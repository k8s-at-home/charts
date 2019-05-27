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
  on = "push"
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
  needs = ["Is this a PR"]
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

action "Is this a PR" {
  uses = "actions/bin/filter@master"
  needs = ["Filter for not master"]
  args = "action 'opened|synchronize|reopened'"
  secrets = ["GITHUB_TOKEN"]
}
