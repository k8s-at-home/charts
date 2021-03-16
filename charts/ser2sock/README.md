# ser2sock

![Version: 2.0.2](https://img.shields.io/badge/Version-2.0.2-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

Serial to Socket Redirector

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/nutechsoftware/ser2sock>
* <https://github.com/tenstartups/ser2sock>

## Requirements

## Dependencies

| Repository | Name | Version |
|------------|------|---------|

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

**IMPORTANT NOTE:** the USB device must be accessible on the node where this pod runs, in order for this chart to function properly.

A way to achieve this can be with nodeAffinity rules, for example:

```yaml
affinity:
  nodeAffinity:
    requiredDuringSchedulingIgnoredDuringExecution:
      nodeSelectorTerms:
      - matchExpressions:
        - key: usb
          operator: In
          values:
          - alarmdecoder
```

... where a node with an attached Coral USB device is labeled with `usb: alarmdecoder`

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity settings for pod assignment of the GUI |
| baudRate | int | `115200` | Baudrate |
| device | string | `"/dev/ttyUSB0"` | USB Device to use |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.repository | string | `"tenstartups/ser2sock"` | Image repository |
| image.tag | string | `"latest"` | Image tag. Possible values listed [here](https://hub.docker.com/r/tenstartups/ser2sock/tags). |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` | Node labels for pod assignment of the GUI |
| pgid | string | `"1001"` | GID to run as |
| podAnnotations | object | `{}` | Pod annotations |
| puid | string | `"1001"` | UID to run as |
| resources | object | `{}` | CPU/Memory resource requests/limits or the GUI |
| service.annotations | object | `{}` | Service annotations for the GUI |
| service.clusterIP | string | `nil` | Cluster IP for the GUI |
| service.externalIPs | string | `nil` | External IPs for the GUI |
| service.externalTrafficPolicy | string | `nil` | Loadbalancer externalTrafficPolicy |
| service.loadBalancerIP | string | `nil` | Loadbalancer IP for the GUI |
| service.loadBalancerSourceRanges | string | `nil` | Loadbalancer client IP restriction range for the GUI |
| service.nodePort | string | `nil` | nodePort to listen on for the GUI |
| service.port | int | `10000` | Kubernetes port where the GUI is exposed |
| service.type | string | `"ClusterIP"` | Kubernetes service type for the GUI |
| strategyType | string | `"Recreate"` | Specifies the strategy used to replace old Pods by new ones |
| timezone | string | `nil` | Timezone the ser2sock instance should run as, e.g. 'America/New_York' |
| tolerations | list | `[]` | Toleration labels for pod assignment of the GUI |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [2.0.2]

#### Added

- N/A

#### Changed

- N/A

#### Removed

- N/A

[2.0.2]: #2.0.2

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)