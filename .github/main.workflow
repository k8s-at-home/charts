workflow "Publish Helm chart" {
  resolves = [
    "Package Helm Chart(s)",
  ]
  on = "check_run"
}

action "Package Helm Chart(s)" {
  uses = "billimek/gh-actions/helm-gh-pages@master"
  secrets = ["GITHUB_TOKEN"]
  args = "[\".\",\"https://billimek.com/billimek-charts/\"]"
}
