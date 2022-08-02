# home-assistant

![Version: 13.4.2](https://img.shields.io/badge/Version-13.4.2-informational?style=flat-square) ![AppVersion: 2022.5.4](https://img.shields.io/badge/AppVersion-2022.5.4-informational?style=flat-square)

Home Assistant

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/home-assistant/home-assistant>
* <https://github.com/cdr/code-server>
* <https://github.com/k8s-at-home/charts/tree/master/charts/stable/home-assistant>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | influxdb | 5.3.5 |
| https://charts.bitnami.com/bitnami | mariadb | 11.0.14 |
| https://charts.bitnami.com/bitnami | postgresql | 11.6.12 |
| https://library-charts.k8s-at-home.com | common | 4.5.2 |

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install home-assistant k8s-at-home/home-assistant
```

## Installing the Chart

To install the chart with the release name `home-assistant`

```console
helm install home-assistant k8s-at-home/home-assistant
```

## Uninstalling the Chart

To uninstall the `home-assistant` deployment

```console
helm uninstall home-assistant
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install home-assistant \
  --set env.TZ="America/New York" \
    k8s-at-home/home-assistant
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install home-assistant k8s-at-home/home-assistant -f values.yaml
```

## Custom configuration

### HTTP 400 bad request while accessing from your browser

When configuring Home Assistant behind a reverse proxy make sure you configure the [http](https://www.home-assistant.io/integrations/http) component and set `trusted_proxies` correctly and `use_x_forwarded_for` to `true`.

For example (by edit the configuration.yaml hosted in your pod):

```yaml
http:
  server_host: 0.0.0.0
  ip_ban_enabled: true
  login_attempts_threshold: 5
  use_x_forwarded_for: true
  trusted_proxies:
  # Pod CIDR
  - 10.69.0.0/16
  # Node CIDR
  - 192.168.42.0/24
```

### Z-Wave / Zigbee

A Z-Wave and/or Zigbee controller device could be used with Home Assistant if passed through from the host to the pod. Skip this section if you are using zwave2mqtt and/or zigbee2mqtt or plan to.

First you will need to mount your Z-Wave and/or Zigbee device into the pod, you can do so by adding the following to your values:

```yaml
persistence:
  usb:
    enabled: true
    type: hostPath
    hostPath: /path/to/device
```

Second you will need to set a nodeAffinity rule, for example:

```yaml
affinity:
  nodeAffinity:
    requiredDuringSchedulingIgnoredDuringExecution:
      nodeSelectorTerms:
      - matchExpressions:
        - key: app
          operator: In
          values:
          - zwave-controller
```

... where a node with an attached zwave and/or zigbee controller USB device is labeled with `app: zwave-controller`

### Websockets

If an ingress controller is being used with home assistant, web sockets must be enabled using annotations to enable support of web sockets.

Using NGINX as an example the following will need to be added to your values:

```yaml
ingress:
  main:
    enabled: true
    annotations:
      nginx.org/websocket-services: home-assistant
    hosts:
      - host: home-assistant.example.org
        paths:
          - path: /
```

The value derived is the name of the kubernetes service object for home-assistant

### Metrics collection

If metrics collection is enabled through the `metrics.enabled: true` setting, make sure to also enable the Prometheus
endpoint in your Home-Assistant configuration. See the [official documentation](https://www.home-assistant.io/integrations/prometheus/) for more details on how to set this up.

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| addons.codeserver | object | See values.yaml | Enable and configure codeserver for the chart.    This allows for easy access to configuration.yaml |
| env | object | See below | environment variables. |
| env.TZ | string | `"UTC"` | Set the container timezone |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"ghcr.io/home-assistant/home-assistant"` | image repository |
| image.tag | string | chart.appVersion | image tag |
| influxdb | object | See values.yaml | Enable and configure influxdb database subchart under this key.    For more options see [influxdb chart documentation](https://github.com/bitnami/charts/tree/master/bitnami/influxdb) |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| mariadb | object | See values.yaml | Enable and configure mariadb database subchart under this key.    For more options see [mariadb chart documentation](https://github.com/bitnami/charts/tree/master/bitnami/mariadb) |
| metrics.enabled | bool | See values.yaml | Enable and configure a Prometheus serviceMonitor for the chart under this key. |
| metrics.prometheusRule | object | See values.yaml | Enable and configure Prometheus Rules for the chart under this key. |
| metrics.prometheusRule.rules | list | See prometheusrules.yaml | Configure additionial rules for the chart under this key. |
| metrics.serviceMonitor.interval | string | `"1m"` |  |
| metrics.serviceMonitor.labels | object | `{}` |  |
| metrics.serviceMonitor.scrapeTimeout | string | `"30s"` |  |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| persistence.usb | object | See values.yaml | Configure a hostPathMount to mount a USB device in the container. |
| postgresql | object | See values.yaml | Enable and configure postgresql database subchart under this key.    For more options see [postgresql chart documentation](https://github.com/bitnami/charts/tree/master/bitnami/postgresql) |
| securityContext | object | `{"privileged":null}` | Enable devices to be discoverable hostNetwork: true -- When hostNetwork is true set dnsPolicy to ClusterFirstWithHostNet dnsPolicy: ClusterFirstWithHostNet |
| securityContext.privileged | bool | `nil` | Privileged securityContext may be required if USB devics are accessed directly through the host machine |
| service | object | See values.yaml | Configures service settings for the chart. Normally this does not need to be modified. |

## Changelog

### Version 13.4.2

#### Added

N/A

#### Changed

* Upgraded `common` chart dependency to version 4.5.2

#### Fixed

N/A

### Older versions

A historical overview of changes can be found on [ArtifactHUB](https://artifacthub.io/packages/helm/k8s-at-home/home-assistant?modal=changelog)

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v0.1.1](https://github.com/k8s-at-home/helm-docs/releases/v0.1.1)
