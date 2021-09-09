# network-ups-tools

![Version: 5.1.0](https://img.shields.io/badge/Version-5.1.0-informational?style=flat-square) ![AppVersion: v2.7.4-2479-g86a32237](https://img.shields.io/badge/AppVersion-v2.7.4--2479--g86a32237-informational?style=flat-square)

Network UPS Tools is a collection of programs which provide a common interface for monitoring and administering UPS, PDU and SCD hardware.

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/networkupstools/nut>

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
helm install network-ups-tools k8s-at-home/network-ups-tools
```

## Installing the Chart

To install the chart with the release name `network-ups-tools`

```console
helm install network-ups-tools k8s-at-home/network-ups-tools
```

## Uninstalling the Chart

To uninstall the `network-ups-tools` deployment

```console
helm uninstall network-ups-tools
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install network-ups-tools \
  --set env.TZ="America/New York" \
    k8s-at-home/network-ups-tools
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install network-ups-tools k8s-at-home/network-ups-tools -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| config.files | object | See values.yaml | See https://github.com/networkupstools/nut/tree/master/conf for config sample files |
| config.mode | string | `"values"` | If set to 'values', the configuration will be read from these values. Otherwise you have to mount a volume to /etc/nut containing the configuration files. |
| env | object | See below | environment variables. |
| env.TZ | string | `"UTC"` | Set the container timezone |
| exporter.enabled | bool | See values.yaml | Enable and configure prometheus-nut-exporter sidecar and Prometheus serviceMonitor. |
| exporter.env.logLevel | string | `"info"` | log level [info|debug|trace] |
| exporter.env.port | int | `9995` | metrics port |
| exporter.image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| exporter.image.repository | string | `"hon95/prometheus-nut-exporter"` | image repository |
| exporter.image.tag | string | `"1.1.1"` | image tag |
| exporter.serviceMonitor.interval | string | `"30s"` |  |
| exporter.serviceMonitor.labels | object | `{}` |  |
| exporter.serviceMonitor.scrapeTimeout | string | `"10s"` |  |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"ghcr.io/k8s-at-home/network-ups-tools"` | image repository |
| image.tag | string | `"v2.7.4-2479-g86a32237"` | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| persistence.ups.hostPath | string | `"/dev/bus/usb/001/001"` | The path of the usb ups on the host. |
| persistence.ups.mountPath | string | `"/dev/bus/usb/001/001"` | Optional path for ups to mount in the container. |
| securityContext | object | See values.yaml | Set to true if using ups connected by usb to the host |
| service | object | See values.yaml | Configures service settings for the chart. |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [5.1.0]

### Added

- Added podMonitor and the ability to use [prometheus-nut-exporter](https://github.com/HON95/prometheus-nut-exporter) as a sidecar container.

### [5.0.0]

#### Changed

- Upgraded the common library dependency to version 4.0.0. This introduced (potentially) breaking changes to `initContainers` and `additionalContainers`. Be sure to check out the [library chart](https://github.com/k8s-at-home/library-charts/blob/common-4.0.0/charts/stable/common/) for the up-to-date values.

### [4.0.0]

#### Changed

- **BREAKING**: Upgraded the common library dependency to version 3.2.0. This introduces several breaking changes (`service`, `ingress` and `persistence` keys have been refactored).
  Be sure to check out the [library chart](https://github.com/k8s-at-home/library-charts/blob/common-3.2.0/charts/stable/common/) for the up-to-date values.
- Changed image repository to `ghcr.io/k8s-at-home/network-ups-tools`.
- Changed image tag to `v2.7.4-2474-gb4a58380`.

### [1.0.0]

#### Added

- Initial version

[5.1.0]: #510
[5.0.0]: #500
[4.0.0]: #400
[1.0.0]: #100

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
