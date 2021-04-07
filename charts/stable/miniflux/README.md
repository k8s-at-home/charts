# miniflux

![Version: 2.2.0](https://img.shields.io/badge/Version-2.2.0-informational?style=flat-square) ![AppVersion: 2.0.28](https://img.shields.io/badge/AppVersion-2.0.28-informational?style=flat-square)

Miniflux is a minimalist and opinionated feed reader.

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/miniflux/v2>

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
helm install miniflux k8s-at-home/miniflux
```

## Installing the Chart

To install the chart with the release name `miniflux`

```console
helm install miniflux k8s-at-home/miniflux
```

## Uninstalling the Chart

To uninstall the `miniflux` deployment

```console
helm uninstall miniflux
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install miniflux \
  --set env.TZ="America/New York" \
    k8s-at-home/miniflux
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install miniflux k8s-at-home/miniflux -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| command[0] | string | `"/usr/bin/miniflux"` |  |
| command[1] | string | `"-c"` |  |
| command[2] | string | `"/etc/miniflux.conf"` |  |
| config.admin.password | string | `"miniflux"` |  |
| config.admin.username | string | `"admin"` |  |
| env.CREATE_ADMIN | string | `"1"` |  |
| env.RUN_MIGRATIONS | string | `"1"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"miniflux/miniflux"` |  |
| image.tag | string | `"2.0.28"` |  |
| ingress.enabled | bool | `false` |  |
| postgresql | object | `{"enabled":true,"persistence":{"enabled":false},"postgresqlDatabase":"miniflux","postgresqlPassword":"miniflux","postgresqlUsername":"postgres"}` | Bitnami postgres chart. For more options see https://github.com/bitnami/charts/tree/master/bitnami/postgresql |
| postgresql.enabled | bool | `true` | true: use bitnami postgres instance -- false: use your own postgres instance |
| postgresql.persistence.enabled | bool | `false` | if database is stored to a PVC. Set to true when you are done testing. |
| postgresql.postgresqlDatabase | string | `"miniflux"` | Postgres database |
| postgresql.postgresqlPassword | string | `"miniflux"` | Postgres user password |
| postgresql.postgresqlUsername | string | `"postgres"` | Postgres user -- Needs to be superuser to create hstore extension |
| probes.liveness.custom | bool | `true` |  |
| probes.liveness.enabled | bool | `true` |  |
| probes.liveness.spec.failureThreshold | int | `3` |  |
| probes.liveness.spec.httpGet.path | string | `"/healthcheck"` |  |
| probes.liveness.spec.httpGet.port | int | `8080` |  |
| probes.liveness.spec.initialDelaySeconds | int | `30` |  |
| probes.liveness.spec.periodSeconds | int | `10` |  |
| probes.liveness.spec.timeoutSeconds | int | `1` |  |
| service.port.port | int | `8080` |  |
| strategy.type | string | `"Recreate"` |  |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/charts/tree/master/charts/common/README.md#Changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [1.0.0]

- Initial chart release

[1.0.0]: https://github.com/k8s-at-home/charts/tree/miniflux-1.0.0/charts/home-assistant

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
