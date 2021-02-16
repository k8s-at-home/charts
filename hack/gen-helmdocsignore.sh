#!/usr/bin/env bash
set -eu

# shellcheck disable=SC2155
export REPO_ROOT=$(git rev-parse --show-toplevel)

grep -L -r "\- name\: common" ./charts/**/Chart.yaml \
    | sed 's|\.\/\(.*\)/Chart.yaml|\1|' \
    | grep -v "common" \
    > .helmdocsignore
