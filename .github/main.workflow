workflow "Lint & Publish Helm chart" {
  resolves = [
    "Package Helm Chart(s)",
  ]
  on = "push"
}

action "Package Helm Chart(s)" {
  uses = "billimek/gh-actions/helm-gh-pages@master"
  secrets = ["GITHUB_TOKEN"]
  args = "[\".\",\"https://billimek.com/billimek-charts/\"]"
}
