# unifi-poller

![Version: 10.3.3](https://img.shields.io/badge/Version-10.3.3-informational?style=flat-square) ![AppVersion: 2.1.3](https://img.shields.io/badge/AppVersion-2.1.3-informational?style=flat-square)

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
| https://library-charts.k8s-at-home.com | common | 4.4.2 |

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
| metrics.enabled | bool | See values.yaml | Enable and configure a Prometheus serviceMonitor for the chart under this key. |
| metrics.prometheusRule | object | See values.yaml | Enable and configure Prometheus Rules for the chart under this key. |
| metrics.prometheusRule.rules | list | See prometheusrules.yaml | Configure additionial rules for the chart under this key. |
| metrics.serviceMonitor.interval | string | `"1m"` |  |
| metrics.serviceMonitor.labels | object | `{}` |  |
| metrics.serviceMonitor.scrapeTimeout | string | `"30s"` |  |
| service.main.ports.http.enabled | bool | `false` |  |
| service.main.ports.metrics.enabled | bool | `true` |  |
| service.main.ports.metrics.port | int | `9130` |  |
| service.main.ports.metrics.protocol | string | `"TCP"` |  |

## Changelog

### Version 10.3.3

#### Added

N/A

#### Changed

* Upgraded `common` chart dependency to version 4.4.2

#### Fixed

N/A

### Older versions

A historical overview of changes can be found on [ArtifactHUB](https://artifacthub.io/packages/helm/k8s-at-home/unifi-poller?modal=changelog)

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v0.1.1](https://github.com/k8s-at-home/helm-docs/releases/v0.1.1)
