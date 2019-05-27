workflow "Lint & Publish Helm chart" {
  resolves = [
    "Package Helm Chart(s)",
    "Not a deleted event",
  ]
  on = "push"
}

workflow "Pull Requests" {
  on = "pull_request"
  resolves = [
    "Lint changed chart(s) in pull request",
    "Branch Cleanup",
  ]
}

action "Package Helm Chart(s)" {
  uses = "billimek/gh-actions/helm-gh-pages@master"
  args = "https://billimek.com/billimek-charts/"
  secrets = ["GITHUB_TOKEN"]
  needs = ["Not a deleted event"]
}

action "Lint changed chart(s) in pull request" {
  uses = "billimek/gh-actions/helm-gh-pages@master"
  args = "https://billimek.com/billimek-charts/"
  secrets = ["GITHUB_TOKEN"]
  needs = ["Not on master branch ?"]
}

action "Push on the master branch?" {
  uses = "actions/bin/filter@master"
  args = "branch master"
  secrets = ["GITHUB_TOKEN"]
}

action "Not a deleted event" {
  uses = "actions/bin/filter@3c0b4f0e63ea54ea5df2914b4fabf383368cd0da"
  args = "not deleted"
  secrets = ["GITHUB_TOKEN"]
  needs = ["Push on the master branch?"]
}

action "Branch Cleanup" {
  uses = "jessfraz/branch-cleanup-action@master"
  secrets = ["GITHUB_TOKEN"]
  env = {
    NO_BRANCH_DELETED_EXIT_CODE = "0"
  }
}

action "Not on master branch ?" {
  uses = "actions/bin/filter@3c0b4f0e63ea54ea5df2914b4fabf383368cd0da"
  args = "not branch master"
  secrets = ["GITHUB_TOKEN"]
}
