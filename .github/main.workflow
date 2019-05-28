workflow "Lint & Publish Helm chart" {
  resolves = [
    "Package Helm Chart(s)",
    "Filter: not deleted",
  ]
  on = "push"
}

workflow "Pull Requests" {
  resolves = [
    "actions/bin/filter@master-1",
    "Lint changed chart(s) in pull request",
  ]
  on = "pull_request"
}

action "Package Helm Chart(s)" {
  uses = "billimek/gh-actions/helm-gh-pages@master"
  args = "https://billimek.com/billimek-charts/"
  secrets = [
    "GITHUB_TOKEN",
    "COMMIT_EMAIL",
    "ACCESS_TOKEN",
  ]
  needs = ["Filter: not deleted"]
}

action "Filter: master branch" {
  uses = "actions/bin/filter@master"
  args = "branch master"
  secrets = ["GITHUB_TOKEN"]
}

action "Filter: not deleted" {
  uses = "actions/bin/filter@master"
  args = "not deleted"
  secrets = ["GITHUB_TOKEN"]
  needs = ["Filter: master branch"]
}

workflow "on pull request merge, delete the branch" {
  on = "pull_request"
  resolves = ["branch cleanup"]
}

action "branch cleanup" {
  uses = "jessfraz/branch-cleanup-action@master"
  secrets = ["GITHUB_TOKEN"]
}

action "Filter: not master branch" {
  uses = "actions/bin/filter@master"
  args = "not master branch"
  secrets = ["GITHUB_TOKEN"]
}

action "actions/bin/filter@master-1" {
  uses = "actions/bin/filter@master"
  args = "action 'opened|synchronize'"
  secrets = ["GITHUB_TOKEN"]
}

action "Lint changed chart(s) in pull request" {
  uses = "billimek/gh-actions/helm-gh-pages@master"
  needs = ["actions/bin/filter@master-1", "Filter: not master branch"]
  args = "https://billimek.com/billimek-charts/"
  secrets = ["GITHUB_TOKEN"]
}
