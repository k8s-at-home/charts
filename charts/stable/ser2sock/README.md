# ser2sock

![Version: 5.4.0](https://img.shields.io/badge/Version-5.4.0-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

Serial to Socket Redirector

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/nutechsoftware/ser2sock>
* <https://github.com/tenstartups/ser2sock>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://library-charts.k8s-at-home.com | common | 4.5.0 |

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install ser2sock k8s-at-home/ser2sock
```

## Installing the Chart

To install the chart with the release name `ser2sock`

```console
helm install ser2sock k8s-at-home/ser2sock
```

## Uninstalling the Chart

To uninstall the `ser2sock` deployment

```console
helm uninstall ser2sock
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install ser2sock \
  --set env.TZ="America/New York" \
    k8s-at-home/ser2sock
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install ser2sock k8s-at-home/ser2sock -f values.yaml
```

## Custom configuration

**IMPORTANT NOTE:** a ser2sock controller device must be accessible on the node where this pod runs, in order for this chart to function properly.

First, you will need to mount your ser2sock device into the pod, you can do so by adding the following to your values.
Be sure to modify the values according to your requirements!

```yaml
persistence:
  usb:
    enabled: true
    type: hostPath
    mountPath: /dev/ttyUSB0  # This is an optional field, and defaults to the value of `hostPath`
    hostPath: /dev/serial/by-id/usb-FTDI_FT230X_Basic_UART_DO00DPTS-if00-port0
    # hostPathType: CharDevice
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
          - ser2sock-controller
```

... where a node with an attached ser2sock controller USB device is labeled with `app: ser2sock-controller`

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity constraint rules to place the Pod on a specific node. [[ref]](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#affinity-and-anti-affinity) |
| env | object | See below | environment variables. See [image docs](https://github.com/tenstartups/ser2sock) for more details. |
| env.BAUD_RATE | int | `115200` | Serial device baud rate |
| env.LISTENER_PORT | string | `"{{ .Values.service.main.ports.server.port }}"` | Port where ser2sock listens |
| env.SERIAL_DEVICE | string | `"{{ .Values.persistence.usb.mountPath }}"` | Path to the serial device |
| env.TZ | string | `"UTC"` | Set the container timezone |
| image.pullPolicy | string | `"Always"` | image pull policy |
| image.repository | string | `"tenstartups/ser2sock"` | image repository |
| image.tag | string | `"latest"` | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| persistence.usb | object | See values.yaml | Configure a hostPathMount to mount a USB device in the container. |
| securityContext.privileged | bool | `nil` | Privileged securityContext may be required if USB controller is accessed directly through the host machine |
| service | object | See values.yaml | Configures service settings for the chart. |

## Changelog

### Version 5.4.0

#### Added

N/A

#### Changed

* Upgraded `common` chart dependency to version 4.5.0

#### Fixed

N/A

### Older versions

A historical overview of changes can be found on [ArtifactHUB](https://artifacthub.io/packages/helm/k8s-at-home/ser2sock?modal=changelog)

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v0.1.1](https://github.com/k8s-at-home/helm-docs/releases/v0.1.1)
