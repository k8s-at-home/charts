# statping

![Version: 2.0.0](https://img.shields.io/badge/Version-2.0.0-informational?style=flat-square) ![AppVersion: v0.90.65](https://img.shields.io/badge/AppVersion-v0.90.65-informational?style=flat-square)

Status page for monitoring your websites and applications

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/statping/statping>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | postgresql | 10.3.7 |
| https://k8s-at-home.com/charts/ | common | 3.1.0 |

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
Other values may be used from the [values.yaml](../common/values.yaml) from the [common library](../common).

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

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/charts/tree/master/charts/common/)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env.ADMIN_EMAIL | string | `"info@example.com"` | dashboard admin email |
| env.ADMIN_PASSWORD | string | `"admin"` | dashboard admin password (needed to edit) |
| env.ADMIN_USER | string | `"admin"` | dashboard admin user (needed to edit) |
| env.DB_CONN | string | `"postgres"` | Type of database to use |
| env.DB_DATABASE | string | postgresql.postgresqlDatabase value | Postgres database password |
| env.DB_HOST | string | internal postgresql URL | Postgres database hostname |
| env.DB_PASS | string | postgresql.postgresqlPassword value | Postgres database password |
| env.DB_USER | string | postgresql.postgresqlUsername value | Postgres database user name |
| env.DESCRIPTION | string | `"This is a Statping instance deployed as Helm chart"` | Description of the Statping instance |
| env.DISABLE_LOGS | bool | `false` | Disable logs from appearing and writing to disk |
| env.NAME | string | `"Statping Example"` | Name of the Statping instance |
| env.POSTGRES_SSLMODE | bool | `false` | Enable ssl_mode for postgres (To enable use require) |
| env.USE_CDN | bool | `false` | Use CDN for static context from third-parties |
| env.VIRTUAL_HOST | string | `""` | External URL you use to connect to the statping (the one you enter in your browser) |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"statping/statping"` |  |
| image.tag | string | `"v0.90.65"` |  |
| ingress.enabled | bool | `false` |  |
| persistence | object | see bellow | Generated application config.yaml and logs are written here. Usually does not need to be persisted. |
| postgresql | object | see bellow | Bitnami postgres chart. For more options see https://github.com/bitnami/charts/tree/master/bitnami/postgresql |
| postgresql.enabled | bool | `true` | By default uses an internal postgress. Dissable if you use your own Postgres. |
| postgresql.persistence.enabled | bool | `false` | if database is stored to a PVC. Set to true when you are done testing. |
| postgresql.postgresqlDatabase | string | `"postgres"` | Postgres database password |
| postgresql.postgresqlPassword | string | `"changeme"` | Postgres database password |
| postgresql.postgresqlUsername | string | `"postgres"` | Postgres database user name |
| service.port.port | int | `8080` |  |
| strategy.type | string | `"Recreate"` |  |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/charts/tree/master/charts/common/README.md#Changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [2.0.0]

#### Added

- N/A

#### Changed

- Redone based on common chart

#### Removed

- N/A

[2.0.0]: #2.0.0

## Support

- See the [Wiki](https://github.com/k8s-at-home/charts/wiki)
- Open a [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/charts/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)