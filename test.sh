#!/bin/bash
CHARTS=()

# Get only the chart paths
for i in "$@"
do
    IFS='/' read -r -a path_parts <<< "$i"
    CHARTS+=("${path_parts[1]}/${path_parts[2]}")
done

# Remove duplicates
CHARTS=( `for i in ${CHARTS[@]}; do echo $i; done | sort -u` )

for i in "${CHARTS[@]}"
do
    echo "Rendering README for chart ${i}"
    IFS='/' read -r -a chart_parts <<< "$i"
    ./hack/gen-helm-docs.sh "${chart_parts[0]}" "${chart_parts[1]}"
    echo ""
done
