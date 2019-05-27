workflow "Lint & Publish Helm chart" {
  resolves = [
    "Package Helm Chart(s)",
  ]
  on = "push"
}

workflow "Pull Requests" {
  resolves = [
    "Pull Request Linting",
  ]
  on = "pull_request"
}

action "Package Helm Chart(s)" {
  uses = "billimek/gh-actions/helm-gh-pages@master"
  args = "https://billimek.com/billimek-charts/"
  secrets = ["GITHUB_TOKEN"]
  needs = ["Filter for master"]
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

action "Filter for not master" {
  uses = "actions/bin/filter@master"
  args = "not branch master"
  secrets = ["GITHUB_TOKEN"]
}
