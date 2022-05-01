# smarter-device-manager

![Version: 6.4.0](https://img.shields.io/badge/Version-6.4.0-informational?style=flat-square) ![AppVersion: 1.20.7](https://img.shields.io/badge/AppVersion-1.20.7-informational?style=flat-square)

Manage hardware resource allocation without a need for privileged containers

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://gitlab.com/arm-research/smarter/smarter-device-manager/>
* <https://github.com/k8s-at-home/charts>

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
helm install smarter-device-manager k8s-at-home/smarter-device-manager
```

## Installing the Chart

To install the chart with the release name `smarter-device-manager`

```console
helm install smarter-device-manager k8s-at-home/smarter-device-manager
```

## Uninstalling the Chart

To uninstall the `smarter-device-manager` deployment

```console
helm uninstall smarter-device-manager
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install smarter-device-manager \
  --set env.TZ="America/New York" \
    k8s-at-home/smarter-device-manager
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install smarter-device-manager k8s-at-home/smarter-device-manager -f values.yaml
```

## Custom configuration

Please consider overriding the default configuration through `values.yaml` file.
For example:
```yaml
config: |
  - devicematch: ^snd$
    nummaxdevices: 20
  - devicematch: ^rtc0$
    nummaxdevices: 20
  - devicematch: ^video[0-9]*$
    nummaxdevices: 20
  - devicematch: ^ttyACM[0-9]*$
    nummaxdevices: 1
```
The above configuration allows up to twenty pods to make use of `/dev/snd`, `/dev/rtc0` and each of `/dev/video[0-9]*` devices.
Only one pod at a time can use any of the discovered host `/dev/ttyACM[0-9]*` devices. This means that if a pod has reserved a dongle at `/dev/ttyACM0`, another pod requesting the same device will stay pending.

Once the devices are discovered, they will be added as allocatable resources to the nodes:
```
 $ kubectl describe nodes
...
Capacity:
  cpu:                                  4
  memory:                               16104560Ki
  pods:                                 110
  smarter-devices/gpiochip0:            0
  smarter-devices/i2c-0:                0
  smarter-devices/snd:                  20
  smarter-devices/ttyUSB-Z-Stick-Gen5:  1
```

The hardware is requested by pods through `resources`, e.g.:
```yaml
  resources:
    limits:
      smarter-devices/ttyUSB-Conbee-2: 1
    requests:
      smarter-devices/ttyUSB-Conbee-2: 1
```

In this case host device `/dev/ttyUSB-Conbee-2` will be given at the same path, and the pod will only be created when this device is available.

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| config | string | See values.yaml | Override default configuration See [project repo](https://gitlab.com/arm-research/smarter/smarter-device-manager) for configuration examples. |
| dnsPolicy | string | `nil` | Defaults to "ClusterFirst" if hostNetwork is false and "ClusterFirstWithHostNet" if hostNetwork is true. |
| hostNetwork | bool | `true` | When using hostNetwork make sure you set dnsPolicy to `ClusterFirstWithHostNet` |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"registry.gitlab.com/arm-research/smarter/smarter-device-manager"` | image repository |
| image.tag | string | `"v1.20.7"` | image tag |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| priorityClassName | string | `"system-node-critical"` | Custom priority class for different treatment by the scheduler Setting this is not necessary, but it is recommended. [[ref]](https://kubernetes.io/docs/concepts/configuration/pod-priority-preemption/) |
| securityContext | object | See values.yaml | Configure the securityContext for this pod [[ref]](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/) |
| termination.messagePath | string | `"/var/log/termination-log"` | Configure the path at which the file to which the main container's termination message will be written. Overrides the default of `/dev/termination-log` to allow read-only `persistence.devfs` at `/dev`. [[ref](https://kubernetes.io/docs/reference/kubernetes-api/workload-resources/pod-v1/#lifecycle-1)] |
| termination.messagePolicy | string | `"FallbackToLogsOnError"` | Indicate how the main container's termination message should be populated. Valid options are `File` and `FallbackToLogsOnError`. smarter-device-manager does not support a termination-log, so use the container's log. [[ref](https://kubernetes.io/docs/reference/kubernetes-api/workload-resources/pod-v1/#lifecycle-1)] |

## Changelog

### Version 6.4.0

#### Added

N/A

#### Changed

* Upgraded `common` chart dependency to version 4.4.0

#### Fixed

N/A

### Older versions

A historical overview of changes can be found on [ArtifactHUB](https://artifacthub.io/packages/helm/k8s-at-home/smarter-device-manager?modal=changelog)

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v0.1.1](https://github.com/k8s-at-home/helm-docs/releases/v0.1.1)
