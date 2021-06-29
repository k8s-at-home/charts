# unifi-poller

![Version: 8.0.0](https://img.shields.io/badge/Version-8.0.0-informational?style=flat-square) ![AppVersion: 2.1.3](https://img.shields.io/badge/AppVersion-2.1.3-informational?style=flat-square)

Collect ALL UniFi Controller, Site, Device & Client Data - Export to InfluxDB or Prometheus

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/unifi-poller/unifi-poller>
* <https://hub.docker.com/r/golift/unifi-poller>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | influxdb | 1.1.9 |
| https://library-charts.k8s-at-home.com | common | 3.2.0 |

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install unifi-poller k8s-at-home/unifi-poller
```

## Installing the Chart

To install the chart with the release name `unifi-poller`

```console
helm install unifi-poller k8s-at-home/unifi-poller
```

## Uninstalling the Chart

To uninstall the `unifi-poller` deployment

```console
helm uninstall unifi-poller
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install unifi-poller \
  --set env.TZ="America/New York" \
    k8s-at-home/unifi-poller
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install unifi-poller k8s-at-home/unifi-poller -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env | object | `{}` | Environment variable configuration options for unifi-poller ([docs](https://unifipoller.com/docs/install/configuration)).    Note: a [configuration file](https://github.com/unifi-poller/unifi-poller/blob/master/examples/up.conf.example) is also supported. |
| image.pullPolicy | string | `"IfNotPresent"` | Image [k8s pull policy](https://kubernetes.io/docs/concepts/containers/images/#updating-images). |
| image.repository | string | `"golift/unifi-poller"` | Image to deploy. |
| image.tag | string | `"2.1.3"` | Image tag to deploy. |
| influxdb.architecture | string | `"standalone"` | InfluxDB cluster deployment architecture. |
| influxdb.authEnabled | bool | `false` | Enable InfluxDB authentication, supported by unifi-poller.    Be sure to match in unifi-poller's [influxdb config](https://unifipoller.com/docs/install/configuration#influxdb). |
| influxdb.database | string | `"unifi"` | Database name to automatically initialize.    Be sure to match in unifi-poller's [influxdb config](https://unifipoller.com/docs/install/configuration#influxdb). |
| influxdb.enabled | bool | `false` | Create an InfluxDB instance as a [unifi-poller storage backend](https://unifipoller.com/docs/dependencies/influxdb).    See [bitnami/influxdb](https://github.com/bitnami/charts/tree/master/bitnami/influxdb) for more options. |
| influxdb.persistence.enabled | bool | `false` | Enable persistence to store in a PV so data survives pod restarts. |
| ingress.main.enabled | bool | `false` | Expose [unifi-poller's web interface](https://unifipoller.com/docs/advanced/webserver)    (if enabled in the configuration) via the k8s ingress by setting this true. |
| prometheus.serviceMonitor.additionalLabels | object | `{}` | More labels to add to the ServiceMonitor resource. |
| prometheus.serviceMonitor.enabled | bool | `false` | Create a [ServiceMonitor](https://github.com/prometheus-operator/prometheus-operator/blob/master/Documentation/design.md#servicemonitor)    for the [unifi-poller prometheus exporter](https://unifipoller.com/docs/dependencies/prometheus)    that is recognized by [prometheus-operator](https://github.com/prometheus-operator/prometheus-operator).    This gets created in this chart's namespace. Note: this only creates a ServiceMonitor, not a prometheus instance. |
| prometheus.serviceMonitor.interval | string | `"1m"` | Prometheus [endpoint polling interval](https://github.com/prometheus-operator/prometheus-operator/blob/master/Documentation/api.md#endpoint)    for this ServiceMonitor (how often unifi-poller will be queried). |
| service.main.ports.http.port | int | `9130` | The port this prometheus exporter will listen on ([registered as 9130](https://github.com/prometheus/prometheus/wiki/Default-port-allocations)).    This should match unifi-poller's [configured listen port](https://unifipoller.com/docs/install/configuration#prometheus). |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [8.0.0]

#### Added

- N/A

#### Changed

- **BREAKING**: Upgraded the common library dependency to version 3.2.0. This introduces several breaking changes (`service`, `ingress` and `persistence` keys have been refactored).
   Be sure to check out the [library chart](https://github.com/k8s-at-home/library-charts/blob/common-3.2.0/charts/stable/common/) for the up-to-date values.
- Change the default influxdb database name to match unifi-poller's default - BREAKING CHANGE
- Updates default unifi-poller version from 2.0.1 to 2.1.3

#### Removed

- N/A

[8.0.0]: https://github.com/k8s-at-home/charts/compare/unifi-poller-7.4.0...unifi-poller-8.0.0

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
