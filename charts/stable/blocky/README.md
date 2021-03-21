# blocky

![Version: 6.0.0](https://img.shields.io/badge/Version-6.0.0-informational?style=flat-square) ![AppVersion: v0.13](https://img.shields.io/badge/AppVersion-v0.13-informational?style=flat-square)

DNS proxy as ad-blocker for local network

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/0xERR0R/blocky>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://library-charts.k8s-at-home.com | common | 1.0.0 |

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install blocky k8s-at-home/blocky
```

## Installing the Chart

To install the chart with the release name `blocky`

```console
helm install blocky k8s-at-home/blocky
```

## Uninstalling the Chart

To uninstall the `blocky` deployment

```console
helm uninstall blocky
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install blocky \
  --set env.TZ="America/New York" \
    k8s-at-home/blocky
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install blocky k8s-at-home/blocky -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| config | string | values provided by the default Blocky configuration | Full list of options: https://github.com/0xERR0R/blocky/blob/master/docs/config.yml |
| env | object | `{}` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"spx01/blocky"` |  |
| image.tag | string | `"v0.13"` |  |
| ingress.enabled | bool | `false` |  |
| persistence.logs.emptyDir | bool | `false` |  |
| persistence.logs.enabled | bool | `false` |  |
| persistence.logs.mountPath | string | `"/logs"` |  |
| prometheus.serviceMonitor.additionalLabels | object | `{}` |  |
| prometheus.serviceMonitor.enabled | bool | `false` |  |
| prometheus.serviceMonitor.interval | string | `"30s"` |  |
| service.additionalServices[0].enabled | bool | `true` |  |
| service.additionalServices[0].externalTrafficPolicy | string | `"Local"` |  |
| service.additionalServices[0].nameSuffix | string | `"dns-tcp"` |  |
| service.additionalServices[0].port.name | string | `"dns-tcp"` |  |
| service.additionalServices[0].port.port | int | `53` |  |
| service.additionalServices[0].port.protocol | string | `"TCP"` |  |
| service.additionalServices[0].port.targetPort | int | `53` |  |
| service.additionalServices[0].type | string | `"NodePort"` |  |
| service.additionalServices[1].enabled | bool | `true` |  |
| service.additionalServices[1].externalTrafficPolicy | string | `"Local"` |  |
| service.additionalServices[1].nameSuffix | string | `"dns-udp"` |  |
| service.additionalServices[1].port.name | string | `"dns-udp"` |  |
| service.additionalServices[1].port.port | int | `53` |  |
| service.additionalServices[1].port.protocol | string | `"UDP"` |  |
| service.additionalServices[1].port.targetPort | int | `53` |  |
| service.additionalServices[1].type | string | `"NodePort"` |  |
| service.port.port | int | `4000` |  |
| strategy.type | string | `"Recreate"` |  |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [6.0.0]

#### Added

- **BREAKING** Migrate Blocky to the common library, a lot of configuration has changed.

#### Changed

- N/A

#### Removed

- N/A

[6.0.0]: #6.0.0

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)