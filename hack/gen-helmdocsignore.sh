#!/usr/bin/env bash
set -eu

#
# Generate .helmdocsignore for excluding non-common based helm charts
#

# shellcheck disable=SC2155
export REPO_ROOT=$(git rev-parse --show-toplevel)

grep -L -r "\- name\: common" ./charts/**/Chart.yaml \
    | sed 's|\.\/\(.*\)/Chart.yaml|\1|' \
    | grep -v "common" \
    > .helmdocsignore

echo "charts/common-test" >> .helmdocsignore
