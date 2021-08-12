# zigbee2mqtt

![Version: 9.0.0](https://img.shields.io/badge/Version-9.0.0-informational?style=flat-square) ![AppVersion: 1.19.1](https://img.shields.io/badge/AppVersion-1.19.1-informational?style=flat-square)

Bridges events and allows you to control your Zigbee devices via MQTT

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/Koenkk/zigbee2mqtt>

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
helm install zigbee2mqtt k8s-at-home/zigbee2mqtt
```

## Installing the Chart

To install the chart with the release name `zigbee2mqtt`

```console
helm install zigbee2mqtt k8s-at-home/zigbee2mqtt
```

## Uninstalling the Chart

To uninstall the `zigbee2mqtt` deployment

```console
helm uninstall zigbee2mqtt
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install zigbee2mqtt \
  --set env.TZ="America/New York" \
    k8s-at-home/zigbee2mqtt
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install zigbee2mqtt k8s-at-home/zigbee2mqtt -f values.yaml
```

## Custom configuration

**IMPORTANT NOTE:** a zigbee controller device must be accessible on the node where this pod runs, in order for this chart to function properly.

First, you will need to mount your zigbee device into the pod, you can do so by adding the following to your values:

```yaml
additionalVolumeMounts:
  - name: usb
    mountPath: /path/to/device

additionalVolumes:
  - name: usb
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
          - zigbee-controller
```

... where a node with an attached zigbee controller USB device is labeled with `app: zigbee-controller`

If you are getting errors, that the device cannot be opened when starting Zigbee2Mqtt, try uncommenting the privileged flag:

```
securityContext:
  privileged: true
```

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity constraint rules to place the Pod on a specific node. [[ref]](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#affinity-and-anti-affinity) |
| config | object | See values.yaml | zigbee2mqtt configuration settings. This will be copied into the container's persistent storage at first run only. Further configuration should be done in the application itself! See [project documentation](https://www.zigbee2mqtt.io/information/configuration.html) for more information. |
| env | object | See below | environment variables. See [image docs](https://www.zigbee2mqtt.io/information/configuration.html#override-via-environment-variables) for more details. |
| env.ZIGBEE2MQTT_DATA | string | `"/data"` | Set the data folder for Zigbee2MQTT. |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"koenkk/zigbee2mqtt"` | image repository |
| image.tag | string | `"1.19.1"` | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| persistence.usb | object | See values.yaml | Configure a hostPathMount to mount a USB device in the container. |
| securityContext.privileged | bool | `nil` | Privileged securityContext may be required if USB controller is accessed directly through the host machine |
| service | object | See values.yaml | Configures service settings for the chart. Normally this does not need to be modified. |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [8.0.0]

#### Changed

- **BREAKING**: Upgraded the common library dependency to version 3.0.1. This introduces several breaking changes (`service`, `ingress` and `persistence` keys have been refactored).
  Be sure to check out the [library chart](https://github.com/k8s-at-home/library-charts/blob/common-3.0.1/charts/stable/common/) for the up-to-date values.
- Changed image tag to `1.19.1`.

### [1.0.0]

#### Added

- N/A

#### Changed

- N/A

#### Removed

- N/A

[8.0.0]: #800
[1.0.0]: #100

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
