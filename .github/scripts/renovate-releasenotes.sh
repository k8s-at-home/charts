#!/usr/bin/env bash

set -e

# Check if release notes have been changed
# Usage ./check-releasenotes.sh path

# require yq
command -v yq >/dev/null 2>&1 || {
    printf >&2 "%s\n" "yq (https://github.com/mikefarah/yq) is not installed. Aborting."
    exit 1
}

# Allow for a specific chart to be passed in as a argument
if [ $# -ge 1 ] && [ -n "$1" ]; then
    root="$1"
    chart_file="${1}/Chart.yaml"
    if [ ! -f "$chart_file" ]; then
        printf >&2 "File %s does not exist.\n" "${chart_file}"
        exit 1
    fi
    cd "${root}"

    if [ -z "$DEFAULT_BRANCH" ]; then
      DEFAULT_BRANCH=$(git remote show origin | awk '/HEAD branch/ {print $NF}')
    fi

    printf "Updating changelog annotation for chart %s\n" "$root"

    # Loop over all dependencies in current chart version
    NEW_DEPENDENCIES=()
    while IFS='' read -r line; do NEW_DEPENDENCIES+=("$line"); done < <(yq e '.dependencies[].name' -P Chart.yaml | LC_ALL=C sort)
    OLD_DEPENDENCIES=$(git show "origin/$DEFAULT_BRANCH:./Chart.yaml" | yq e '.dependencies[].name' -P - | LC_ALL=C sort)

    tmpfile=$(mktemp)
    trap 'rm -f "$tmpfile"' EXIT

    for DEP_NAME in "${NEW_DEPENDENCIES[@]}"
    do
      NEW_VERSION=$(yq e ".dependencies[] | select(.name == \"$DEP_NAME\") | .version" -P Chart.yaml)
      OLD_VERSION=$(git show "origin/$DEFAULT_BRANCH:./Chart.yaml" | yq e ".dependencies[] | select(.name == \"$DEP_NAME\") | .version" -P -)
      if [ "${NEW_VERSION}" != "${OLD_VERSION}" ]; then
        printf "%s\n" "- kind: changed" >> "${tmpfile}"
        printf "  description: Upgraded \`%s\` chart dependency to version \`%s\`.\n" "${DEP_NAME}" "${NEW_VERSION}" >> "${tmpfile}"
      fi
    done

    yq eval-all --inplace 'select(fileIndex == 0).annotations."artifacthub.io/changes" = (select(fileIndex == 1) | to_yaml) | select(fileIndex==0)' Chart.yaml "${tmpfile}"
else
    printf >&2 "%s\n" "No chart folder has been specified."
    exit 1
fi
