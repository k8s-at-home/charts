#!/usr/bin/env bash
set -e

# require yq
command -v yq >/dev/null 2>&1 || {
    echo >&2 "yq (https://github.com/mikefarah/yq) is not installed. Aborting."
    exit 1
}

# Absolute path of repository
repository=$(git rev-parse --show-toplevel)
charts_folder="${repository}/charts"
charts_summary_file="${charts_folder}"/README.md

# Gather all charts using the common library, excluding common-test
incubator_charts=$(find "${charts_folder}/incubator" -name "Chart.yaml" | sort)
stable_charts=$(find "${charts_folder}/stable" -name "Chart.yaml" | sort)

echo "# Helm charts overview" > "${charts_summary_file}"

echo "### Stable charts:" >> "${charts_summary_file}"
echo "| Chart | Description |" >> "${charts_summary_file}"
echo "| ----- | ----------- |" >> "${charts_summary_file}"
for i in ${stable_charts[@]}
do
    chart_data=($(yq eval '.name, .description' "$i"))
    chart_name="${chart_data[0]}"
    chart_description="${chart_data[@]:1}"
    echo "| [${chart_name}](stable/${chart_name}) | ${chart_description} |" >> "${charts_summary_file}"
done

echo "### Incubator charts:" >> "${charts_summary_file}"
echo "| Chart | Description |" >> "${charts_summary_file}"
echo "| ----- | ----------- |" >> "${charts_summary_file}"
for i in ${incubator_charts[@]}
do
    chart_data=($(yq eval '.name, .description' "$i"))
    chart_name="${chart_data[0]}"
    chart_description="${chart_data[@]:1}"
    echo "| [${chart_name}](incubator/${chart_name}) | ${chart_description} |" >> "${charts_summary_file}"
done
