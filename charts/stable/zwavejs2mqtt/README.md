# zwavejs2mqtt

![Version: 5.3.0](https://img.shields.io/badge/Version-5.3.0-informational?style=flat-square) ![AppVersion: 5.0.2](https://img.shields.io/badge/AppVersion-5.0.2-informational?style=flat-square)

Fully configurable Zwave to MQTT Gateway and Control Panel

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/zwave-js/zwavejs2mqtt>
* <https://hub.docker.com/r/zwavejs/zwavejs2mqtt>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://library-charts.k8s-at-home.com | common | 4.4.0 |

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install zwavejs2mqtt k8s-at-home/zwavejs2mqtt
```

## Installing the Chart

To install the chart with the release name `zwavejs2mqtt`

```console
helm install zwavejs2mqtt k8s-at-home/zwavejs2mqtt
```

## Uninstalling the Chart

To uninstall the `zwavejs2mqtt` deployment

```console
helm uninstall zwavejs2mqtt
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install zwavejs2mqtt \
  --set env.TZ="America/New York" \
    k8s-at-home/zwavejs2mqtt
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install zwavejs2mqtt k8s-at-home/zwavejs2mqtt -f values.yaml
```

## Custom configuration

**IMPORTANT NOTE:** a zwave controller device must be accessible on the node where this pod runs, in order for this chart to function properly.

First, you will need to mount your zwave device into the pod, you can do so by adding the following to your values:

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
          - zwave-controller
```

... where a node with an attached zwave controller USB device is labeled with `app: zwave-controller`

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity constraint rules to place the Pod on a specific node. [[ref]](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#affinity-and-anti-affinity) |
| env | object | See below | environment variables. See [image docs](https://zwave-js.github.io/zwavejs2mqtt/#/guide/env-vars) for more details. |
| env.NETWORK_KEY | string | `nil` | Zwave Network key |
| env.TZ | string | `"UTC"` | Set the container timezone |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"zwavejs/zwavejs2mqtt"` | image repository |
| image.tag | string | `"5.0.2"` | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| persistence.usb | object | See values.yaml | Configure a hostPathMount to mount a USB device in the container. |
| securityContext.privileged | bool | `true` | (bool) Privileged securityContext may be required if USB devices are accessed directly through the host machine |
| service | object | See values.yaml | Configures service settings for the chart. |

## Changelog

### Version 5.3.0

#### Added

N/A

#### Changed

* Upgraded `common` chart dependency to version 4.4.0

#### Fixed

N/A

### Older versions

A historical overview of changes can be found on [ArtifactHUB](https://artifacthub.io/packages/helm/k8s-at-home/zwavejs2mqtt?modal=changelog)

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v0.1.1](https://github.com/k8s-at-home/helm-docs/releases/v0.1.1)
