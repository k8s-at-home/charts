# gollum

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![AppVersion: latest](https://img.shields.io/badge/AppVersion-latest-informational?style=flat-square)

gollum helm package

**Homepage:** <https://github.com/k8s-at-home/charts/tree/master/charts/stable/gollum>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Chris Sanders | sanders.chris@gmail.com |  |

## Source Code

* <https://github.com/gollum/gollum>
* <https://github.com/gollum/docker>

## Requirements

Kubernetes: `>=1.16.0-0`

| Repository | Name | Version |
|------------|------|---------|
| https://library-charts.k8s-at-home.com | common | 2.5.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| controllerType | string | `"statefulset"` |  |
| gollum.additionalArgs | string | `"--h1-title"` | Additional arguments for starting gollum |
| gollum.config | string | `"# Push and pull on commit\nGollum::Hook.register(:post_commit, :hook_id) do |committer, sha1|\n     committer.wiki.repo.git.pull('origin', committer.wiki.ref)\n     committer.wiki.repo.git.push('origin', committer.wiki.ref)\nend\n"` | Gollum config.rb customizations reference https://github.com/gollum/gollum#config-file |
| gollum.gitBranch | string | `"master"` | Branch to pull |
| gollum.gitUrl | string | `"https://github.com/k8s-at-home/charts.git"` | Repository URL to pull (accepts access tokens) Ex: https://user:access-token@git.example.com/user/repo.git |
| gollum.syncCommand | string | `"git pull && git push"` | Command run during the sync cron |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"gollumorg/gollum"` | gollum upstream image |
| image.tag | string | `"latest"` |  |
| ingress.enabled | bool | `false` |  |
| persistence.wiki.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.wiki.enabled | bool | `false` |  |
| persistence.wiki.mountPath | string | `"/wiki"` |  |
| persistence.wiki.size | string | `"2Gi"` |  |
| service.port.name | string | `"http"` |  |
| service.port.port | int | `80` |  |
| service.port.targetPort | int | `4567` |  |
| service.type | string | `"ClusterIP"` |  |
| strategy.type | string | `"RollingUpdate"` |  |
