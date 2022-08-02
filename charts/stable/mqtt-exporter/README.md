# mqtt-exporter

![Version: 1.1.1](https://img.shields.io/badge/Version-1.1.1-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

Simple and generic Prometheus exporter for MQTT. Tested with Mosquitto MQTT and Xiaomi sensors.

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/kpetremann/mqtt-exporter>
* <https://hub.docker.com/r/kpetrem/mqtt-exporter>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://library-charts.k8s-at-home.com | common | 4.5.1 |

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install mqtt-exporter k8s-at-home/mqtt-exporter
```

## Installing the Chart

To install the chart with the release name `mqtt-exporter`

```console
helm install mqtt-exporter k8s-at-home/mqtt-exporter
```

## Uninstalling the Chart

To uninstall the `mqtt-exporter` deployment

```console
helm uninstall mqtt-exporter
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install mqtt-exporter \
  --set env.TZ="America/New York" \
    k8s-at-home/mqtt-exporter
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install mqtt-exporter k8s-at-home/mqtt-exporter -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env | object | See below | environment variables. See [image docs](https://developer.us-1.veritone.com/machinebox/overview) for more details. |
| env.LOG_LEVEL | string | `"INFO"` | Logging level |
| env.MQTT_ADDRESS | string | `"127.0.0.1"` | IP or hostname of MQTT broker |
| env.MQTT_IGNORED_TOPICS | string | `nil` | Comma-separated lists of topics to ignore. Accepts wildcards. |
| env.MQTT_KEEPALIVE | int | `60` | Keep alive interval to maintain connection with MQTT broker |
| env.MQTT_PASSWORD | string | `nil` | Password which should be used to authenticate against the MQTT broker |
| env.MQTT_PORT | int | `1883` | TCP port of MQTT broker |
| env.MQTT_TOPIC | string | `"#"` | Topic path to subscribe to |
| env.MQTT_USERNAME | string | `nil` | Username which should be used to authenticate against the MQTT broker |
| env.PROMETHEUS_PORT | int | `9000` | HTTP server PORT to expose Prometheus metrics |
| env.PROMETHEUS_PREFIX | string | `"mqtt_"` | Prefix added to the metric name, example: mqtt_temperature |
| env.TOPIC_LABEL | string | `"topic"` | Define the Prometheus label for the topic, example temperature{topic="device1"} |
| env.TZ | string | `"UTC"` | Set the container timezone |
| env.ZIGBEE2MQTT_AVAILABILITY | string | `"False"` | Normalize sensor name for device availability metric added by Zigbee2MQTT |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"kpetrem/mqtt-exporter"` | image repository |
| image.tag | string | `"latest"` | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| metrics.enabled | bool | See values.yaml | Enable and configure a Prometheus serviceMonitor for the chart under this key. |
| metrics.serviceMonitor.interval | string | `"30s"` | Interval at which Prometheus should scrape metrics |
| metrics.serviceMonitor.labels | object | `{}` | Additional labels for the Kubernetes `ServiceMonitor` object |
| metrics.serviceMonitor.scrapeTimeout | string | `"10s"` | Timeout after which the scrape is ended |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| securityContext.readOnlyRootFilesystem | bool | `true` |  |
| securityContext.runAsNonRoot | bool | `true` |  |
| securityContext.runAsUser | int | `65534` |  |
| service | object | See values.yaml | Configures service settings for the chart. |

## Changelog

### Version 1.1.1

#### Added

N/A

#### Changed

* Upgraded `common` chart dependency to version 4.5.1

#### Fixed

N/A

### Older versions

A historical overview of changes can be found on [ArtifactHUB](https://artifacthub.io/packages/helm/k8s-at-home/mqtt-exporter?modal=changelog)

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v0.1.1](https://github.com/k8s-at-home/helm-docs/releases/v0.1.1)
