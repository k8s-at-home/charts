# home-assistant

![Version: 8.3.0](https://img.shields.io/badge/Version-8.3.0-informational?style=flat-square) ![AppVersion: 2021.5.5](https://img.shields.io/badge/AppVersion-2021.5.5-informational?style=flat-square)

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
| https://charts.bitnami.com/bitnami | mariadb | 9.3.9 |
| https://charts.bitnami.com/bitnami | postgresql | 10.4.0 |
| https://library-charts.k8s-at-home.com | common | 2.5.0 |

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

### Z-Wave / Zigbee

A Z-Wave and/or Zigbee controller device could be used with Home Assistant if passed through from the host to the pod. Skip this section if you are using zwave2mqtt and/or zigbee2mqtt or plan to.

First you will need to mount your Z-Wave and/or Zigbee device into the pod, you can do so by adding the following to your values:

```yaml
additionalVolumeMounts:
  - name: zwave-usb
    mountPath: /path/to/device

additionalVolumes:
  - name: zwave-usb
    hostPath:
      path: /path/to/device
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
  enabled: true
  annotations:
    nginx.org/websocket-services: home-assistant
```

The value derived is the name of the kubernetes service object for home-assistant

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env | object | `{}` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"homeassistant/home-assistant"` |  |
| image.tag | string | `"2021.5.5"` |  |
| influxdb.architecture | string | `"standalone"` |  |
| influxdb.authEnabled | bool | `false` |  |
| influxdb.database | string | `"home_assistant"` |  |
| influxdb.enabled | bool | `false` |  |
| influxdb.persistence.enabled | bool | `false` |  |
| ingress.enabled | bool | `false` |  |
| mariadb.architecture | string | `"standalone"` |  |
| mariadb.auth.database | string | `"home-assistant"` |  |
| mariadb.auth.password | string | `"home-assistant-pass"` |  |
| mariadb.auth.rootPassword | string | `"home-assistantrootpass"` |  |
| mariadb.auth.username | string | `"home-assistant"` |  |
| mariadb.enabled | bool | `false` |  |
| mariadb.primary.persistence.enabled | bool | `false` |  |
| persistence.config.emptyDir.enabled | bool | `false` |  |
| persistence.config.enabled | bool | `false` |  |
| postgresql.enabled | bool | `false` |  |
| postgresql.persistence.enabled | bool | `false` |  |
| postgresql.postgresqlDatabase | string | `"home-assistant"` |  |
| postgresql.postgresqlPassword | string | `"home-assistant-pass"` |  |
| postgresql.postgresqlUsername | string | `"home-assistant"` |  |
| prometheus.serviceMonitor.enabled | bool | `false` |  |
| service.port.port | int | `8123` |  |
| strategy.type | string | `"Recreate"` |  |

## Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [8.3.0]

### Changed

- Updated image tag to version 2021.5.5

## [8.0.0]

### Changed

- Updated image tag to version 2021.4.4.

### Removed

- Removed support for specifying git Deploykey directly from this chart. This feature has been moved to the [codeserver add-on](http://docs.k8s-at-home.com/our-helm-charts/common-library-add-ons/#code-server).

## [5.0.0]

### Changed

- Migrated chart over to our common library, this version introduces breaking changes. Be sure to back up your config volume incase something goes wrong.
- Upgraded `home-assistant` container image to `2020.12.1`
- Upgraded `postgresql` subchart from version 10.1.3 to version 10.2.0.
- Upgraded `influxdb` subchart from version 1.1.2 to version 1.1.4.
- Upgraded `mariadb` subchart from version 9.1.2 to version 9.1.4

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
- The default `vscode` image has been updated to 3.7.2
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

[8.0.0]: https://github.com/k8s-at-home/charts/tree/home-assistant-8.0.0/charts/home-assistant

[5.0.0]: https://github.com/k8s-at-home/charts/tree/home-assistant-5.0.0/charts/home-assistant

[4.0.0]: https://github.com/k8s-at-home/charts/tree/home-assistant-4.0.0/charts/home-assistant

[3.1.0]: https://github.com/k8s-at-home/charts/tree/home-assistant-3.1.0/charts/home-assistant

[3.0.0]: https://github.com/k8s-at-home/charts/tree/home-assistant-3.0.0/charts/home-assistant

[2.7.0]: https://github.com/k8s-at-home/charts/tree/home-assistant-2.7.0/charts/home-assistant

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
