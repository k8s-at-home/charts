workflow "Lint & Publish Helm chart" {
  resolves = [
    "Package Helm Chart(s)",
    "Push on refs/heads/master ?",
  ]
  on = "push"
}

workflow "Pull Requests" {
  on = "pull_request"
  resolves = ["Lint changed chart(s) in pull request"]
}

action "Package Helm Chart(s)" {
  uses = "billimek/gh-actions/helm-gh-pages@master"
  args = "https://billimek.com/billimek-charts/"
  secrets = ["GITHUB_TOKEN"]
  needs = ["Push on refs/heads/master ?"]
}

action "Lint changed chart(s) in pull request" {
  uses = "billimek/gh-actions/helm-gh-pages@master"
  args = "https://billimek.com/billimek-charts/"
  secrets = ["GITHUB_TOKEN"]
}

action "Push on the master branch?" {
  uses = "actions/bin/filter@master"
  args = "branch master"
  secrets = ["GITHUB_TOKEN"]
}

action "Filter for not master" {
  uses = "actions/bin/filter@master"
  args = "not branch master"
  secrets = ["GITHUB_TOKEN"]
}

action "Push on refs/heads/master ?" {
  uses = "actions/bin/filter@3c0b4f0e63ea54ea5df2914b4fabf383368cd0da"
  args = "ref refs/heads/master"
  secrets = ["GITHUB_TOKEN"]
  needs = ["Push on the master branch?"]
}
