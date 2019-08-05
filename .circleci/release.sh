#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

: "${CH_TOKEN:?Environment variable CH_TOKEN must be set}"
: "${GIT_REPOSITORY_URL:?Environment variable GIT_REPO_URL must be set}"
: "${GIT_USERNAME:?Environment variable GIT_USERNAME must be set}"
: "${GIT_EMAIL:?Environment variable GIT_EMAIL must be set}"
: "${GIT_REPOSITORY_NAME:?Environment variable GIT_REPOSITORY_NAME must be set}"

readonly REPO_ROOT="${REPO_ROOT:-$(git rev-parse --show-toplevel)}"

main() {
    pushd "$REPO_ROOT" > /dev/null

    echo "Fetching tags..."
    git fetch --tags

    local latest_tag
    latest_tag=$(find_latest_tag)

    local latest_tag_rev
    latest_tag_rev=$(git rev-parse --verify "$latest_tag")
    echo "$latest_tag_rev $latest_tag (latest tag)"

    local head_rev
    head_rev=$(git rev-parse --verify HEAD)
    echo "$head_rev HEAD"

    if [[ "$latest_tag_rev" == "$head_rev" ]]; then
        echo "No code changes. Nothing to release."
        exit
    fi

    rm -rf .deploy
    mkdir -p .deploy

    echo "Identifying changed charts since tag '$latest_tag'..."

    git diff --find-renames --name-only "$latest_tag_rev" -- . | cut -d '/' -f 1 | uniq > /tmp/modified_dirs.txt
    while read -r dir; do
        if find "$dir" -type f -iname "Chart.yaml" | grep -E -q 'Chart.yaml'; then
            echo "Packaging chart '$dir'..."
            package_chart "$dir"
        fi
    done < /tmp/modified_dirs.txt
    rm /tmp/modified_dirs.txt

    ls -ald .deploy

    if [ -d .deploy ]; then
        release_charts
        sleep 5
        update_index
    else
        "Nothing to do. No chart changes detected."
    fi

    popd > /dev/null
}

find_latest_tag() {
    if ! git describe --tags --abbrev=0 2> /dev/null; then
        git rev-list --max-parents=0 --first-parent HEAD
    fi
}

package_chart() {
    local chart="$1"
    helm dependency build "$chart"
    helm package "$chart" --destination .deploy
}

release_charts() {
    chart-releaser upload -o "$GIT_USERNAME" -r "$GIT_REPOSITORY_NAME" -p .deploy
}

update_index() {
    chart-releaser index -o "$GIT_USERNAME" -r "$GIT_REPOSITORY_NAME" -p .deploy/index.yaml

    git config user.email "$GIT_EMAIL"
    git config user.name "$GIT_USERNAME"

    for file in */*.md; do
        if [[ -e $file ]]; then
            mkdir -p ".deploy/docs/$(dirname "$file")"
            cp --force "$file" ".deploy/docs/$(dirname "$file")"
        fi
    done

    git checkout gh-pages
    cp --force .deploy/index.yaml index.yaml

    if [[ -e ".deploy/docs" ]]; then
        # mkdir -p charts
        cp --force --recursive .deploy/docs/* .
    fi

    git checkout master -- README.md

    if ! git diff --quiet; then
        git add .
        git commit --message="[ci skip] Update index.yaml" --signoff
        git push "$GIT_REPOSITORY_URL" gh-pages
    fi
}

main
