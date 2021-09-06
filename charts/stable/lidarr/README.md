# lidarr

![Version: 12.0.0](https://img.shields.io/badge/Version-12.0.0-informational?style=flat-square) ![AppVersion: v1.0.0.2255](https://img.shields.io/badge/AppVersion-v1.0.0.2255-informational?style=flat-square)

Looks and smells like Sonarr but made for music

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/Lidarr/Lidarr>
* <https://github.com/k8s-at-home/container-images>

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
helm install lidarr k8s-at-home/lidarr
```

## Installing the Chart

To install the chart with the release name `lidarr`

```console
helm install lidarr k8s-at-home/lidarr
```

## Uninstalling the Chart

To uninstall the `lidarr` deployment

```console
helm uninstall lidarr
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install lidarr \
  --set env.TZ="America/New York" \
    k8s-at-home/lidarr
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install lidarr k8s-at-home/lidarr -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env | object | See below | environment variables. |
| env.TZ | string | `"UTC"` | Set the container timezone |
| exporter.enabled | bool | See values.yaml | Enable and configure Exportarr sidecar and Prometheus podMonitor. |
| exporter.env.additionalMetrics | bool | `false` | Set to true to enable gathering of additional metrics (slow) |
| exporter.env.port | int | `32123` | metrics port |
| exporter.env.unknownQueueItems | bool | `false` | Set to true to enable gathering unknown queue items |
| exporter.image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| exporter.image.repository | string | `"ghcr.io/onedr0p/exportarr"` | image repository |
| exporter.image.tag | string | `"v0.6.1"` | image tag |
| exporter.podMonitor.interval | string | `"3m"` |  |
| exporter.podMonitor.labels | object | `{}` |  |
| exporter.podMonitor.scrapeTimeout | string | `"1m"` |  |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"ghcr.io/k8s-at-home/lidarr"` | image repository |
| image.tag | string | `"v1.0.0.2255"` | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| probes | object | See values.yaml | Configures the probes for the main Pod. |
| service | object | See values.yaml | Configures service settings for the chart. |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [12.0.0]

#### Changed

- Refactoring of the Exportarr sidecar and Prometheus podMonitor. This is a breaking change if it was enabled previously.

### [11.0.0]

#### Changed

- Upgraded the common library dependency to version 4.0.0. This introduced (potentially) breaking changes to `initContainers` and `additionalContainers`. Be sure to check out the [library chart](https://github.com/k8s-at-home/library-charts/blob/common-4.0.0/charts/stable/common/) for the up-to-date values.

### [10.0.0]

#### Changed

- **BREAKING**: Upgraded the common library dependency to version 3.0.2. This introduces several breaking changes (`service`, `ingress` and `persistence` keys have been refactored).
  Be sure to check out the [library chart](https://github.com/k8s-at-home/library-charts/blob/common-3.0.2/charts/stable/common/) for the up-to-date values.
- Changed image tag to `v1.0.0.2226`.

### [9.0.0]

#### Changed

- **Breaking**: swap linuxserver.io images for k8s@home image

### [1.0.0]

#### Added

- Initial version

[12.0.0]: #1200
[11.0.0]: #1100
[10.0.0]: #1000
[9.0.0]: #900
[1.0.0]: #100

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
