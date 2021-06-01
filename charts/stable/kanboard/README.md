# kanboard

![Version: 2.5.1](https://img.shields.io/badge/Version-2.5.1-informational?style=flat-square) ![AppVersion: v1.2.18](https://img.shields.io/badge/AppVersion-v1.2.18-informational?style=flat-square)

Kanboard is a free and open source Kanban project management software.

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/kanboard/kanboard>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | postgresql | 10.4.8 |
| https://library-charts.k8s-at-home.com | common | 2.5.0 |

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install kanboard k8s-at-home/kanboard
```

## Installing the Chart

To install the chart with the release name `kanboard`

```console
helm install kanboard k8s-at-home/kanboard
```

## Uninstalling the Chart

To uninstall the `kanboard` deployment

```console
helm uninstall kanboard
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install kanboard \
  --set env.TZ="America/New York" \
    k8s-at-home/kanboard
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install kanboard k8s-at-home/kanboard -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| config.cache.dir | string | `nil` | Cache folder to use if cache driver is "file" |
| config.cache.driver | string | `"memory"` | Available cache drivers are "file" and "memory" |
| config.db.driver | string | `"sqlite"` | Database driver: sqlite, mysql or postgres |
| config.db.runMigrations | bool | `true` | Run automatically database migrations |
| config.debug | bool | `false` |  |
| config.files.dir | string | `"data/files"` | Folder for uploaded files |
| config.logging.driver | string | `"stdout"` | log driver: syslog, stderr, stdout or file |
| config.mail.bcc | string | `nil` |  |
| config.mail.enabled | bool | `false` | Enable/disable email configuration from the user interface |
| config.mail.from | string | `"notifications@kanboard.local"` |  |
| config.plugins.api.url | string | `"https://kanboard.org/plugins.json"` | default plugin directory URL |
| config.plugins.dir | string | `"data/plugins"` | Plugin folder |
| config.plugins.installer | bool | `false` | Enable/disable plugin installation from the user interface |
| config.session.duration | int | `0` | Session duration in second (0 = until the browser is closed) |
| config.session.handler | string | `"db"` | Session handler: db or php |
| config.urlRewrite | bool | `false` |  |
| env | object | `{}` | https://docs.kanboard.org/en/latest/admin_guide/docker.html#environment-variables |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"kanboard/kanboard"` |  |
| image.tag | string | `"v1.2.18"` |  |
| ingress.enabled | bool | `false` |  |
| persistence.data | object | `{"accessMode":"ReadWriteOnce","emptyDir":{"enabled":false},"enabled":false,"mountPath":"/var/www/app/data","size":"1Gi"}` | enable data persistence |
| persistence.ssl | object | `{"emptyDir":{"enabled":false},"enabled":false,"mountPath":"/etc/nginx/ssl"}` | enable SSL persistence |
| postgresql | object | `{"enabled":false,"persistence":{"enabled":false},"postgresqlDatabase":"kanboard","postgresqlPassword":"kanboard","postgresqlUsername":"kanboard"}` | Bitnami postgres chart. For more options see https://github.com/bitnami/charts/tree/master/bitnami/postgresql |
| postgresql.enabled | bool | `false` | true: use bitnami postgres instance -- false: use your own postgres instance |
| postgresql.persistence.enabled | bool | `false` | if database is stored to a PVC. Set to true when you are done testing. |
| postgresql.postgresqlDatabase | string | `"kanboard"` | Postgres database password |
| postgresql.postgresqlPassword | string | `"kanboard"` | Postgres database password |
| postgresql.postgresqlUsername | string | `"kanboard"` | Postgres database user name |
| service.port.port | int | `80` |  |
| strategy.type | string | `"Recreate"` |  |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [1.1.0]

#### Added

- Added postgres support

[1.1.0]: https://github.com/k8s-at-home/charts/tree/kanboard-1.1.0/charts/home-assistant

### [1.0.0]

#### Added

- Initial chart release

[1.0.0]: https://github.com/k8s-at-home/charts/tree/kanboard-1.0.0/charts/home-assistant

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
