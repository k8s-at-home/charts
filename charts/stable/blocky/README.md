# blocky

![Version: 9.0.0](https://img.shields.io/badge/Version-9.0.0-informational?style=flat-square) ![AppVersion: v0.15](https://img.shields.io/badge/AppVersion-v0.15-informational?style=flat-square)

DNS proxy as ad-blocker for local network

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/0xERR0R/blocky>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://library-charts.k8s-at-home.com | common | 4.0.0 |

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
| configmap | object | see URL to default config | Full list of options https://github.com/0xERR0R/blocky/blob/master/docs/config.yml |
| configmap.enabled | bool | `false` | If set to 'true', the configuration will be read from these values. |
| controller.replicas | int | `1` | (int) Number of pods to load balance between |
| controller.strategy | string | `"RollingUpdate"` | Set the controller upgrade strategy |
| env | object | See below | environment variables. See [image docs](https://0xerr0r.github.io/blocky/installation/#run-with-docker) for more details. |
| env.TZ | string | `"UTC"` | Set the container timezone |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"spx01/blocky"` | image repository |
| image.tag | string | `"v0.15"` | image tag |
| metrics.enabled | bool | See values.yaml | Enable and configure a Prometheus serviceMonitor for the chart under this key. |
| metrics.prometheusRule | object | See values.yaml | Enable and configure Prometheus Rules for the chart under this key. |
| metrics.prometheusRule.rules | list | See prometheusrules.yaml | Configure additionial rules for the chart under this key. |
| metrics.serviceMonitor.interval | string | `"30s"` |  |
| metrics.serviceMonitor.labels | object | `{}` |  |
| metrics.serviceMonitor.scrapeTimeout | string | `"10s"` |  |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| service | object | See values.yaml | Configures service settings for the chart. |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [9.0.0]

#### Changed

- **BREAKING**: Changed configmap to use a boolean to disable in cases of mounting your own. Refactored Prometheus metrics section to add rules. Enabling metrics automatically enables the serviceMonitor.

### [8.0.0]

#### Changed

- Upgraded the common library dependency to version 4.0.0. This introduced (potentially) breaking changes to `initContainers` and `additionalContainers`. Be sure to check out the [library chart](https://github.com/k8s-at-home/library-charts/blob/common-4.0.0/charts/stable/common/) for the up-to-date values.

### [7.0.0]

#### Changed

- **BREAKING**: Upgraded the common library dependency to version 3.2.0. This introduces several breaking changes (`service`, `ingress` and `persistence` keys have been refactored).
  Be sure to check out the [library chart](https://github.com/k8s-at-home/library-charts/blob/common-3.2.0/charts/stable/common/) for the up-to-date values.
- Changed image tag to `v0.14`.

### [6.0.0]

#### Added

- N/A

#### Changed

- **BREAKING** Migrate Blocky to the common library, a lot of configuration has changed.

#### Removed

- N/A

[9.0.0]: #900
[8.0.0]: #800
[7.0.0]: #700
[6.0.0]: #600

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
