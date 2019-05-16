workflow "Lint & Publish Helm chart" {
  resolves = [
    "Package Helm Chart(s)",
  ]
  on = "push"
}

action "Package Helm Chart(s)" {
  uses = "billimek/gh-actions/helm-gh-pages@master"
  args = "[\"https://billimek.com/billimek-charts/\"]"
  secrets = ["GITHUB_TOKEN"]
  env = {
    SKIP_LINTING = "true"
  }
}

workflow "Pull Request" {
  on = "pull_request"
  resolves = ["billimek/gh-actions/helm-gh-pages@master"]
}

action "billimek/gh-actions/helm-gh-pages@master" {
  uses = "billimek/gh-actions/helm-gh-pages@master"
  args = "\"https://billimek.com/billimek-charts/\""
  secrets = ["GITHUB_TOKEN"]
  env = {
    PR = "true"
  }
}
