# teslamate

![Version: 3.6.4](https://img.shields.io/badge/Version-3.6.4-informational?style=flat-square) ![AppVersion: v1.22.0](https://img.shields.io/badge/AppVersion-v1.22.0-informational?style=flat-square)

A self-hosted data logger for your Tesla 🚘

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/adriankumpf/teslamate>

## Requirements

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | postgresql | 10.3.15 |

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install teslamate k8s-at-home/teslamate
```

## Installing the Chart

To install the chart with the release name `teslamate`

```console
helm install teslamate k8s-at-home/teslamate
```

## Uninstalling the Chart

To uninstall the `teslamate` deployment

```console
helm uninstall teslamate
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install teslamate \
  --set env.TZ="America/New York" \
    k8s-at-home/teslamate
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install teslamate k8s-at-home/teslamate -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| checkOrigin | bool | `false` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"teslamate/teslamate"` |  |
| image.tag | string | `"1.22.0"` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0] | string | `"chart-example.local"` |  |
| ingress.path | string | `"/"` |  |
| ingress.tls | list | `[]` |  |
| locale | string | `"en"` |  |
| mqtt.enabled | bool | `false` |  |
| mqtt.host | string | `nil` |  |
| mqtt.password | string | `nil` |  |
| mqtt.tls | string | `nil` |  |
| mqtt.tlsAcceptInvalid | string | `nil` |  |
| mqtt.username | string | `nil` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| postgresql.enabled | bool | `true` |  |
| postgresql.image.repository | string | `"postgres"` |  |
| postgresql.image.tag | float | `12.1` |  |
| postgresql.persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| postgresql.persistence.enabled | bool | `true` |  |
| postgresql.persistence.mountPath | string | `"/data/"` |  |
| postgresql.persistence.size | string | `"8Gi"` |  |
| postgresql.persistence.storageClass | string | `nil` |  |
| postgresql.postgresqlDataDir | string | `"/data/pgdata"` |  |
| postgresql.postgresqlDatabase | string | `"teslamate"` |  |
| postgresql.postgresqlPassword | string | `"teslamate"` |  |
| postgresql.postgresqlUsername | string | `"teslamate"` |  |
| probes.liveness.failureThreshold | int | `15` |  |
| probes.liveness.periodSeconds | int | `10` |  |
| probes.readiness.failureThreshold | int | `15` |  |
| probes.readiness.periodSeconds | int | `10` |  |
| probes.startup.failureThreshold | int | `30` |  |
| probes.startup.initialDelaySeconds | int | `15` |  |
| probes.startup.periodSeconds | int | `10` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| service.port | int | `4000` |  |
| service.type | string | `"ClusterIP"` |  |
| timeZone | string | `"UTC"` |  |
| tolerations | list | `[]` |  |
| virtualHost | string | `nil` |  |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [3.6.1]

#### Added

- N/A

#### Changed

- use helm-docs

#### Removed

- N/A

[3.6.1]: #3.6.1

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
