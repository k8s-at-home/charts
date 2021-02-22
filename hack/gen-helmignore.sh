#!/usr/bin/env bash
set -eu

#
# Generate common charts .helmignore files
#

# Absolute path of repository
repository=$(git rev-parse --show-toplevel)

# Templates to copy into each chart directory
helmignore="${repository}/hack/templates/.helmignore"

# Gather all charts using the common library, excluding common-test
charts=$(find "${repository}" -name "Chart.yaml" -exec grep -l "\- name\: common" {} \;)

for chart in ${charts}; do
    chart_directory="$(dirname "${chart}")"
    # Copy .helmignore into each Chart directory, overwrite if exists
    cp "${helmignore}" "${chart_directory}"
done
