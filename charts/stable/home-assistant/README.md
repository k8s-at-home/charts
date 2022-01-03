# home-assistant

![Version: 12.0.0](https://img.shields.io/badge/Version-12.0.0-informational?style=flat-square) ![AppVersion: 2021.12.7](https://img.shields.io/badge/AppVersion-2021.12.7-informational?style=flat-square)

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
| https://charts.bitnami.com/bitnami | influxdb | 1.1.9 |
| https://charts.bitnami.com/bitnami | mariadb | 10.2.0 |
| https://charts.bitnami.com/bitnami | postgresql | 10.14.2 |
| https://library-charts.k8s-at-home.com | common | 4.3.0 |

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

For example:

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
| env | object | See below | environment variables. |
| env.TZ | string | `"UTC"` | Set the container timezone |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"homeassistant/home-assistant"` | image repository |
| image.tag | string | `"2021.12.7"` | image tag |
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

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [12.0.0]

#### Changed

- **BREAKING**: Specified the default postgresql version (14.1.0) to comply with Home-Assistant supported versions. Make sure to back up your database before upgrading to this version!
- Changed image tag to `2021.12.7`.
- **BREAKING**: Updated `mariadb` chart to version `10.2.0`. Check out the [chart documentation](https://github.com/bitnami/charts/tree/master/bitnami/mariadb#to-1000) to see which values have changed.
- Updated `postgresql` chart to version `10.14.2`.
- Updated the common library dependency to version 4.3.0.

### [11.0.6]

#### Changed

- Fix home-assistant ingress example

### [11.0.5]

#### Fixed

- Updated chart documentation.

### [11.0.0]

#### Changed

- **BREAKING**: Refactored Prometheus metrics section to add rules. Enabling metrics automatically enables the serviceMonitor.

### [10.0.0]

#### Changed

- Upgraded the common library dependency to version 4.0.0. This introduced (potentially) breaking changes to `initContainers` and `additionalContainers`. Be sure to check out the [library chart](https://github.com/k8s-at-home/library-charts/blob/common-4.0.0/charts/stable/common/) for the up-to-date values.

### [9.0.1]

- Removed an incorrect reference to another project's documentation.
- Fixed the changelog versions.

### [9.0.0]

#### Changed

- **BREAKING**: Upgraded the common library dependency to version 3.0.2. This introduces several breaking changes (`service`, `ingress` and `persistence` keys have been refactored).
  Be sure to check out the [library chart](https://github.com/k8s-at-home/library-charts/blob/common-3.0.2/charts/stable/common/) for the up-to-date values.
- Changed image tag to `2021.6.3`.
- Updated `mariadb` chart to version `9.3.14`.
- Updated `postgresql` chart to version `10.4.9`.

## [8.3.0]

### Changed

- Updated image tag to version 2021.5.5.

## [8.0.0]

### Changed

- Updated image tag to version 2021.4.4.

### Removed

- Removed support for specifying git Deploykey directly from this chart. This feature has been moved to the [codeserver add-on](http://docs.k8s-at-home.com/our-helm-charts/common-library-add-ons/#code-server).

## [5.0.0]

### Changed

- Migrated chart over to our common library, this version introduces breaking changes. Be sure to back up your config volume incase something goes wrong.
- Upgraded `home-assistant` container image to `2020.12.1`.
- Upgraded `postgresql` subchart from version 10.1.3 to version 10.2.0.
- Upgraded `influxdb` subchart from version 1.1.2 to version 1.1.4.
- Upgraded `mariadb` subchart from version 9.1.2 to version 9.1.4.

## [4.0.0]

### Changed

- Bumped bitnami/mariadb to 9.1.2 in chart deps

### Removed

- Appdaemon sidecar was removed and replaced by it's own chart at [charts/appdaemon](https://github.com/k8s-at-home/charts/tree/master/charts/appdaemon)
- Configurator sidecar was removed in favor of the `code-server` sidecar. One configure sidecar to rule them all!

## [3.1.0]

### Changed

- Fixed issue in default postgresql configuration.
- Bumped bitnami/postgresql to 10.1.1 in chart deps

## [3.0.0]

Any pre-existing StatefulSet will have to be removed before upgrading due to a name change in the chart.

### Changed

- The default `home-assistant` image has been updated to v0.118.3.
- The default `vscode` image has been updated to 3.7.2.
- :warning: Upgraded `influxdb` subchart from version 0.6.7 to version 1.0.0.
- :warning: Upgraded `postgresql` subchart from version 9.1.2 to version 10.1.0.
  This is a major version update, [requiring changes](https://github.com/bitnami/charts/tree/master/bitnami/postgresql#to-1000) in your `values.yaml` if you use it!
- :warning: Upgraded `mariadb` subchart from version 7.7.1 to version 9.0.1.
  This is a major version update, [requiring changes](https://github.com/bitnami/charts/tree/master/bitnami/mariadb#to-900) in your `values.yaml` if you use it!

### Removed

- Subchart support for `esphome` was removed as it is really a separate application and integration was only limited to sharing a secrets file.

### Fixed

- Fixed some formatting errors that were causing the pipeline to fail.

## [2.7.0]

This is the last version before starting this changelog. All sorts of cool stuff was changed, but only `git log` remembers what that was :slightly_frowning_face:

[12.0.0]: #1200
[11.0.6]: #1106
[11.0.5]: #1105
[11.0.0]: #1100
[10.0.0]: #1000
[9.0.1]: #901
[9.0.0]: #900
[8.0.0]: #800
[5.0.0]: #500
[4.0.0]: #400
[3.1.0]: #310
[3.0.0]: #300
[2.7.0]: #270

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
