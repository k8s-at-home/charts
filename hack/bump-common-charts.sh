#!/usr/bin/env bash
set -eu

find charts/stable/ -name "Chart.yaml" -exec grep -q -l "\- name\: common" {} \; -print0 | xargs -0 sed -i '' -r -e "s|^version: ([0-9]+\.[0-9]+)\.[0-9]+$|version: \1.1|"
