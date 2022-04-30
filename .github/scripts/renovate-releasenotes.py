#!/usr/bin/env python

import sys
import typer

from git import Repo
from loguru import logger
from pathlib import Path

from ruamel.yaml import YAML
from ruamel.yaml.scalarstring import LiteralScalarString

app = typer.Typer(add_completion=False)


def _setup_logging(debug):
    """
    Setup the log formatter for this script
    """

    log_level = "INFO"
    if debug:
        log_level = "DEBUG"

    logger.remove()
    logger.add(
        sys.stdout,
        colorize=True,
        format="<level>{message}</level>",
        level=log_level,
    )


@app.command()
def main(
    chart_folder: Path = typer.Argument(
        ..., help="Folder containing the chart to process"),
    check_branch: str = typer.Option(
        None, help="The branch to compare against."),
    debug: bool = False,
):
    _setup_logging(debug)

    if not chart_folder.is_dir():
        logger.error(f"Could not find folder {str(chart_folder)}")
        raise typer.Exit()

    chart_metadata_file = chart_folder.joinpath('Chart.yaml')

    if not chart_metadata_file.is_file():
        logger.error(f"Could not find file {str(chart_metadata_file)}")
        raise typer.Exit()

    git_repository = Repo(search_parent_directories=True)

    if check_branch:
        logger.info(f"Trying to find branch {check_branch}...")
        branch = next(
            (ref for ref in git_repository.remotes.origin.refs if ref.name == check_branch),
            None
        )

        if not branch:
          logger.error(f"Could not find branch {check_branch}")
          raise typer.Exit()

    else:
        logger.info(f"Trying to determine default branch...")
        branch = next(
            (ref for ref in git_repository.remotes.origin.refs if ref.name == "origin/HEAD"),
            None
        )

    logger.info(f"Comparing against branch {branch}")

    logger.info(f"Updating changelog annotation for chart {chart_folder}")

    yaml = YAML(typ=['rt', 'string'])
    yaml.indent(mapping=2, sequence=4, offset=2)
    yaml.explicit_start = True
    yaml.preserve_quotes = True

    old_chart_metadata = yaml.load(
        git_repository.git.show(f"{branch}:{chart_metadata_file}")
    )
    new_chart_metadata = yaml.load(chart_metadata_file.read_text())

    try:
      old_chart_dependencies = old_chart_metadata["dependencies"]
    except KeyError:
      old_chart_dependencies = []

    try:
      new_chart_dependencies = new_chart_metadata["dependencies"]
    except KeyError:
      new_chart_dependencies = []

    annotations = []
    for dependency in new_chart_dependencies:
      old_dep = None
      if "alias" in dependency.keys():
        old_dep = next(
          (old_dep for old_dep in old_chart_dependencies if "alias" in old_dep.keys() and old_dep["alias"] == dependency["alias"]),
          None
        )
      else:
        old_dep = next(
          (old_dep for old_dep in old_chart_dependencies if old_dep["name"] == dependency["name"]),
          None
        )

      if old_dep and dependency["version"] != old_dep["version"]:
        if "alias" in dependency.keys():
          annotations.append({
            "kind": "changed",
            "description": f"Upgraded {dependency['name']} chart dependency to version {dependency['version']} for alias '{dependency['alias']}'"
          })
        else:
          annotations.append({
            "kind": "changed",
            "description": f"Upgraded {dependency['name']} chart dependency to version {dependency['version']}"
          })

    annotations = YAML(typ=['rt', 'string']).dump_to_string(annotations)

    if annotations:
      new_chart_metadata["annotations"]["artifacthub.io/changes"] = LiteralScalarString(annotations)
      yaml.dump(new_chart_metadata, chart_metadata_file)

if __name__ == "__main__":
    app()
