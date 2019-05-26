workflow "Lint & Publish Helm chart" {
  resolves = [
    "Package Helm Chart(s)",
    "Filter for non-merged PRs",
  ]
  on = "push"
}

action "Package Helm Chart(s)" {
  uses = "billimek/gh-actions/helm-gh-pages@master"
  args = "https://billimek.com/billimek-charts/"
  secrets = ["GITHUB_TOKEN"]
  needs = ["Filter for non-merged PRs"]
}

workflow "Pull Request" {
  on = "pull_request"
  resolves = [
    "Pull Request Linting",
  ]
}

action "Pull Request Linting" {
  uses = "billimek/gh-actions/helm-gh-pages@master"
  args = "https://billimek.com/billimek-charts/"
  secrets = ["GITHUB_TOKEN"]
}

action "Filter for master" {
  uses = "actions/bin/filter@master"
  args = "branch master"
  secrets = ["GITHUB_TOKEN"]
}

action "Filter for non-merged PRs" {
  uses = "actions/bin/filter@master"
  needs = ["Filter for master"]
  args = "not merged true"
  secrets = ["GITHUB_TOKEN"]
}
