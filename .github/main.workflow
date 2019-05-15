workflow "Publish Helm chart" {
  on = "push"
  resolves = ["Helm gh-pages"]
}

action "Helm gh-pages" {
  uses = "billimek/gh-actions/helm-gh-pages@master"
  args = [".", "https://billimek.com/billimek-charts/"]
  secrets = ["GITHUB_TOKEN"]
}
