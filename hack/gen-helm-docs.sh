#!/usr/bin/env bash
set -eu

#
# Generate helm-docs for Helm charts using the common library
#

# Absolute path of repository
repository=$(git rev-parse --show-toplevel)

# Templates to copy into each chart directory
readme_template="${repository}/hack/templates/README.md.gotmpl"
readme_config_template="${repository}/hack/templates/README_CONFIG.md.gotmpl"
readme_changelog_template="${repository}/hack/templates/README_CHANGELOG.md.gotmpl"

# Gather all charts using the common library, excluding common-test
charts=$(find "${repository}" -name "Chart.yaml" -exec grep --exclude="*common-test*"  -l "\- name\: common" {} \;)

for chart in ${charts}; do
    chart_directory="$(dirname "${chart}")"
    # Copy README template into each Chart directory, overwrite if exists
    cp "${readme_template}" "${chart_directory}"
    # Copy CUSTOM_CONFIG template to each Chart directory, do not overwrite if exists
    cp -n "${readme_config_template}" "${chart_directory}" || true
    # Copy CHANGELOG template to each Chart directory, do not overwrite if exists
    cp -n "${readme_changelog_template}" "${chart_directory}" || true
done

# Run helm-docs for charts using the common library and the common library itself
helm-docs \
    --ignore-file="${repository}/.helmdocsignore" \
    --template-files="$(basename "${readme_template}")" \
    --template-files="$(basename "${readme_config_template}")" \
    --template-files="$(basename "${readme_changelog_template}")" \
    --chart-search-root="${repository}"
