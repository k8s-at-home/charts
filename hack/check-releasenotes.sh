#!/usr/bin/env bash

set -eu

# Check if release notes have been changed
# Usage ./check-releasenotes.sh path

# require yq
command -v yq >/dev/null 2>&1 || {
    echo >&2 "yq (https://github.com/mikefarah/yq) is not installed. Aborting."
    exit 1
}

# Absolute path of repository
repository=$(git rev-parse --show-toplevel)

# Allow for a specific chart to be passed in as a argument
if [ $# -ge 1 ] && [ -n "$1" ]; then
    root="$1"
    chart_file="${1}/Chart.yaml"
    if [ ! -f "$chart_file" ]; then
        echo "File ${chart_file} does not exist."
        exit 1
    fi

    echo "Validating release notes for $root"

    cd $root
    CURRENT=$(cat Chart.yaml | yq e '.annotations."artifacthub.io/changes"' -P -)

    if [ "$CURRENT" == "" ] || [ "$CURRENT" == "null" ]; then
      echo >&2 "Release notes have not been set for this chart!"
      exit 1
    fi

    DEFAULT_BRANCH=$(git remote show origin | awk '/HEAD branch/ {print $NF}')
    ORIGINAL=$(git show origin/$DEFAULT_BRANCH:./Chart.yaml | yq e '.annotations."artifacthub.io/changes"' -P -)

    if [ "$CURRENT" == "$ORIGINAL" ]; then
      echo >&2 "Release notes have not been updated!"
      exit 1
    fi
else
    echo >&2 "No chart folder has been specified."
    exit 1
fi
