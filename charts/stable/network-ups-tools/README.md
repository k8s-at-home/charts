# network-ups-tools

![Version: 6.3.3](https://img.shields.io/badge/Version-6.3.3-informational?style=flat-square) ![AppVersion: v2.7.4-2479-g86a32237](https://img.shields.io/badge/AppVersion-v2.7.4--2479--g86a32237-informational?style=flat-square)

Network UPS Tools is a collection of programs which provide a common interface for monitoring and administering UPS, PDU and SCD hardware.

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/networkupstools/nut>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://library-charts.k8s-at-home.com | common | 4.4.2 |

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
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"ghcr.io/k8s-at-home/network-ups-tools"` | image repository |
| image.tag | string | `"v2.7.4-2479-g86a32237"` | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| metrics.enabled | bool | See values.yaml | Enable and configure prometheus-nut-exporter sidecar and Prometheus serviceMonitor. |
| metrics.exporter.env.logLevel | string | `"info"` | log level [info|debug|trace] |
| metrics.exporter.env.port | int | `9995` | metrics port |
| metrics.exporter.image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| metrics.exporter.image.repository | string | `"hon95/prometheus-nut-exporter"` | image repository |
| metrics.exporter.image.tag | string | `"1.1.1"` | image tag |
| metrics.prometheusRule | object | See values.yaml | Enable and configure Prometheus Rules for the chart under this key. |
| metrics.prometheusRule.rules | list | See prometheusrules.yaml | Configure additionial rules for the chart under this key. |
| metrics.serviceMonitor.interval | string | `"30s"` |  |
| metrics.serviceMonitor.labels | object | `{}` |  |
| metrics.serviceMonitor.scrapeTimeout | string | `"10s"` |  |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| persistence.ups.hostPath | string | `"/dev/bus/usb/001/001"` | The path of the usb ups on the host. |
| persistence.ups.mountPath | string | `"/dev/bus/usb/001/001"` | Optional path for ups to mount in the container. |
| securityContext | object | See values.yaml | Set to true if using ups connected by usb to the host |
| service | object | See values.yaml | Configures service settings for the chart. |

## Changelog

### Version 6.3.3

#### Added

N/A

#### Changed

* Upgraded `common` chart dependency to version 4.4.2

#### Fixed

N/A

### Older versions

A historical overview of changes can be found on [ArtifactHUB](https://artifacthub.io/packages/helm/k8s-at-home/network-ups-tools?modal=changelog)

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v0.1.1](https://github.com/k8s-at-home/helm-docs/releases/v0.1.1)
