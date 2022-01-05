#!/usr/bin/env bash

set -eu

# Check if release notes have been changed
# Usage ./check-releasenotes.sh path

# require yq
command -v yq >/dev/null 2>&1 || {
    echo >&2 "yq (https://github.com/mikefarah/yq) is not installed. Aborting."
    exit 1
}

# Allow for a specific chart to be passed in as a argument
if [ $# -ge 1 ] && [ -n "$1" ]; then
    root="$1"
    chart_file="${1}/Chart.yaml"
    if [ ! -f "$chart_file" ]; then
        echo "File ${chart_file} does not exist."
        exit 1
    fi
    cd $root
    DEFAULT_BRANCH=$(git remote show origin | awk '/HEAD branch/ {print $NF}')

    echo "Generating release notes for $root"

    # Loop over all dependencies in current chart version
    NEW_DEPENDENCIES=$(cat Chart.yaml | yq e '.dependencies[].name' -P - | LC_ALL=C sort)
    OLD_DEPENDENCIES=$(git show origin/$DEFAULT_BRANCH:./Chart.yaml | yq e '.dependencies[].name' -P - | LC_ALL=C sort)

    ADDED_DEPENDENCIES=$(comm -23 <(printf '%s\n' "${NEW_DEPENDENCIES[@]}") <(printf '%s\n' "${OLD_DEPENDENCIES[@]}"))
    UPDATED_DEPENDENCIES=$(comm -12 <(printf '%s\n' "${NEW_DEPENDENCIES[@]}") <(printf '%s\n' "${OLD_DEPENDENCIES[@]}"))
    REMOVED_DEPENDENCIES=$(comm -13 <(printf '%s\n' "${NEW_DEPENDENCIES[@]}") <(printf '%s\n' "${OLD_DEPENDENCIES[@]}"))

    tmpfile=$(mktemp)
    trap 'rm -f "$tmpfile"' EXIT

    for DEP_NAME in ${ADDED_DEPENDENCIES[@]}
    do
      echo "- kind: changed" >> $tmpfile
      echo "  description: Added \`${DEP_NAME}\` chart dependency." >> $tmpfile
    done

    for DEP_NAME in ${UPDATED_DEPENDENCIES[@]}
    do
      NEW_VERSION=$(cat Chart.yaml | yq e ".dependencies[] | select(.name == \"$DEP_NAME\") | .version" -P -)
      OLD_VERSION=$(git show origin/$DEFAULT_BRANCH:./Chart.yaml | yq e ".dependencies[] | select(.name == \"$DEP_NAME\") | .version" -P -)
      if [ "${NEW_VERSION}" != "${OLD_VERSION}" ]; then
        echo "- kind: changed" >> $tmpfile
        echo "  description: Upgraded \`${DEP_NAME}\` chart dependency to version \`${NEW_VERSION}\`." >> $tmpfile
      fi
    done

    for DEP_NAME in ${REMOVED_DEPENDENCIES[@]}
    do
      echo "- kind: changed" >> $tmpfile
      echo "  description: Removed \`${DEP_NAME}\` chart dependency." >> $tmpfile
    done

    yq eval-all --inplace 'select(fileIndex == 0).annotations."artifacthub.io/changes" = (select(fileIndex == 1) | to_yaml) | select(fileIndex==0)' Chart.yaml $tmpfile
else
    echo >&2 "No chart folder has been specified."
    exit 1
fi
