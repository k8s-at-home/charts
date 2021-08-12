# uptimerobot-prometheus

![Version: 5.0.0](https://img.shields.io/badge/Version-5.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.0.1](https://img.shields.io/badge/AppVersion-0.0.1-informational?style=flat-square)

Prometheus Exporter for the official uptimerobot CLI

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/lekpamartin/uptimerobot_exporter>
* <https://github.com/k8s-at-home/charts/tree/master/charts/uptimerobot-prometheus>

## Requirements

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://library-charts.k8s-at-home.com | common | 4.0.0 |

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install uptimerobot-prometheus k8s-at-home/uptimerobot-prometheus
```

## Installing the Chart

To install the chart with the release name `uptimerobot-prometheus`

```console
helm install uptimerobot-prometheus k8s-at-home/uptimerobot-prometheus
```

## Uninstalling the Chart

To uninstall the `uptimerobot-prometheus` deployment

```console
helm uninstall uptimerobot-prometheus
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install uptimerobot-prometheus \
  --set env.TZ="America/New York" \
    k8s-at-home/uptimerobot-prometheus
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install uptimerobot-prometheus k8s-at-home/uptimerobot-prometheus -f values.yaml
```

## Custom configuration

### Grafana Dashboard

You can find an [example grafana dashboard](https://github.com/lekpamartin/uptimerobot_exporter/blob/master/dashboards/grafana.json) as shown in the screenshot above.

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env | object | See below | environment variables. See [application docs](https://github.com/lekpamartin/uptimerobot_exporter/blob/master/docker-compose.yml) for more details. |
| env.TZ | string | `"UTC"` | Set the container timezone |
| env.UPTIMEROBOT_API_KEY | string | `""` | Set the uptimerobot API key |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"billimek/prometheus-uptimerobot-exporter"` | image repository |
| image.tag | string | `"0.0.1"` | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| prometheus.serviceMonitor | object | See values.yaml | Enable and configure a Prometheus serviceMonitor for the chart under this key. See also the notes under `additionalContainers`. |
| service | object | See values.yaml | Configures service settings for the chart. |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [4.0.0]

#### Changed

- **BREAKING**: Upgraded the common library dependency to version 3.2.0. This introduces several breaking changes (`service`, `ingress` and `persistence` keys have been refactored).
  Be sure to check out the [library chart](https://github.com/k8s-at-home/library-charts/blob/common-3.2.0/charts/stable/common/) for the up-to-date values.

### [3.0.0]

#### Added

- N/A

#### Changed

- **BREAKING** Migrate to the common library, a lot of configuration has changed.

#### Removed

- N/A

### [2.0.2]

#### Added

- N/A

#### Changed

- use helm-docs

#### Removed

- N/A

[4.0.0]: #400
[3.0.0]: #300
[2.0.2]: #202

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
