# statping

![Version: 3.2.1](https://img.shields.io/badge/Version-3.2.1-informational?style=flat-square) ![AppVersion: v0.90.74](https://img.shields.io/badge/AppVersion-v0.90.74-informational?style=flat-square)

Status page for monitoring your websites and applications

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/statping/statping>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | postgresql | 10.3.15 |
| https://library-charts.k8s-at-home.com | common | 2.2.0 |

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install statping k8s-at-home/statping
```

## Installing the Chart

To install the chart with the release name `statping`

```console
helm install statping k8s-at-home/statping
```

## Uninstalling the Chart

To uninstall the `statping` deployment

```console
helm uninstall statping
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install statping \
  --set env.TZ="America/New York" \
    k8s-at-home/statping
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install statping k8s-at-home/statping -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env.DB_CONN | string | `"postgres"` | Type of database to use |
| env.DB_DATABASE | string | postgresql.postgresqlDatabase value | Postgres database password |
| env.DB_HOST | string | internal postgresql URL | Postgres database hostname |
| env.DB_PASS | string | postgresql.postgresqlPassword value | Postgres database password |
| env.DB_USER | string | postgresql.postgresqlUsername value | Postgres database user name |
| env.DESCRIPTION | string | `"This is a Statping instance deployed as Helm chart"` | Description of the Statping instance |
| env.DISABLE_LOGS | bool | `false` | Disable logs from appearing and writing to disk |
| env.NAME | string | `"Statping Example"` | Name of the Statping instance |
| env.POSTGRES_SSLMODE | string | `"disable"` | Enable ssl_mode for postgres (To enable use require) |
| env.USE_CDN | bool | `false` | Use CDN for static context from third-parties |
| env.VIRTUAL_HOST | string | `""` | External URL you use to connect to the statping (the one you enter in your browser) |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"statping/statping"` |  |
| image.tag | string | `v0.90.74` |  |
| ingress.enabled | bool | `false` |  |
| persistence | object | see bellow | Generated application config.yaml and logs are written here. Usually does not need to be persisted. |
| postgresql | object | see bellow | Bitnami postgres chart. For more options see https://github.com/bitnami/charts/tree/master/bitnami/postgresql |
| postgresql.enabled | bool | `true` | By default uses an internal postgress. Disable if you use your own Postgres. |
| postgresql.persistence.enabled | bool | `false` | if database is stored to a PVC. Set to true when you are done testing. |
| postgresql.postgresqlDatabase | string | `"postgres"` | Postgres database password |
| postgresql.postgresqlPassword | string | `"changeme"` | Postgres database password |
| postgresql.postgresqlUsername | string | `"postgres"` | Postgres database user name |
| service.port.port | int | `8080` |  |
| strategy.type | string | `"Recreate"` |  |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [2.0.0]

#### Added

- N/A

#### Changed

- Migrated to common library chart
- Moved `service.port` to `service.port.port`

#### Removed

- N/A

[2.0.0]: #2.0.0

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community
