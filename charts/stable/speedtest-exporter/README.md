# speedtest-exporter

![Version: 5.0.2](https://img.shields.io/badge/Version-5.0.2-informational?style=flat-square) ![AppVersion: v3.2.2](https://img.shields.io/badge/AppVersion-v3.2.2-informational?style=flat-square)

Speedtest Exporter made in python using the official speedtest bin

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/MiguelNdeCarvalho/speedtest-exporter/>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://library-charts.k8s-at-home.com | common | 4.0.1 |

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install speedtest-exporter k8s-at-home/speedtest-exporter
```

## Installing the Chart

To install the chart with the release name `speedtest-exporter`

```console
helm install speedtest-exporter k8s-at-home/speedtest-exporter
```

## Uninstalling the Chart

To uninstall the `speedtest-exporter` deployment

```console
helm uninstall speedtest-exporter
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install speedtest-exporter \
  --set env.TZ="America/New York" \
    k8s-at-home/speedtest-exporter
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install speedtest-exporter k8s-at-home/speedtest-exporter -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env | object | See below | environment variables. See [application docs](https://docs.miguelndecarvalho.pt/projects/speedtest-exporter/) for more details. |
| env.TZ | string | `"UTC"` | Set the container timezone |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"ghcr.io/miguelndecarvalho/speedtest-exporter"` | image repository |
| image.tag | string | `"v3.2.2"` | image tag |
| metrics.enabled | bool | See values.yaml | Enable and configure a Prometheus serviceMonitor for the chart under this key. |
| metrics.prometheusRule | object | See values.yaml | Enable and configure Prometheus Rules for the chart under this key. |
| metrics.prometheusRule.downloadLimit | int | `400` | Download speed you want alerts to be triggered in Mbps |
| metrics.prometheusRule.jitterLimit | int | `30` | Jitter latency you want alerts to be triggered in ms |
| metrics.prometheusRule.pingLimit | int | `10` | Ping latency you want alerts to be triggered in ms |
| metrics.prometheusRule.rules | list | See prometheusrules.yaml | Configure additionial rules for the chart under this key. |
| metrics.prometheusRule.uploadLimit | int | `400` | Upload speed you want alerts to be triggered in Mbps |
| metrics.serviceMonitor.interval | string | `"60m"` | The interval field must use minutes for the padding to calculate properly. |
| metrics.serviceMonitor.labels | object | `{}` |  |
| metrics.serviceMonitor.scrapeTimeout | string | `"1m"` |  |
| service | object | See values.yaml | Configures service settings for the chart. |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [5.0.0]

#### Changed

- **BREAKING**: Refactored Prometheus metrics section to add rules. Enabling metrics automatically enables the serviceMonitor.

### [4.0.0]

##### Changed

- Move from podMonitor to serviceMonitor since this has a service to connect to. Potential breaking change.

### [3.0.0]

#### Changed

- Upgraded the common library dependency to version 4.0.0. This introduced (potentially) breaking changes to `initContainers` and `additionalContainers`. Be sure to check out the [library chart](https://github.com/k8s-at-home/library-charts/blob/common-4.0.0/charts/stable/common/) for the up-to-date values.

### [2.0.0]

#### Changed

- **BREAKING**: Upgraded the common library dependency to version 3.2.0. This introduces several breaking changes (`service`, `ingress` and `persistence` keys have been refactored).
  Be sure to check out the [library chart](https://github.com/k8s-at-home/library-charts/blob/common-3.2.0/charts/stable/common/) for the up-to-date values.
- Changed image tag to `v3.2.2`.

### [1.0.0]

#### Added

- Initial release

#### Changed

- N/A

#### Removed

- N/A

[5.0.0]: #500
[4.0.0]: #400
[3.0.0]: #300
[2.0.0]: #200
[1.0.0]: #100

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
