# smarter-device-manager

![Version: 6.0.0](https://img.shields.io/badge/Version-6.0.0-informational?style=flat-square) ![AppVersion: 1.20.7](https://img.shields.io/badge/AppVersion-1.20.7-informational?style=flat-square)

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
| https://library-charts.k8s-at-home.com | common | 4.0.0 |

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

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [5.0.0]

#### Changed

- **BREAKING**: Upgraded the common library dependency to version 3.2.0. This introduces several breaking changes (`service`, `ingress` and `persistence` keys have been refactored).
  Be sure to check out the [library chart](https://github.com/k8s-at-home/library-charts/blob/common-3.2.0/charts/stable/common/) for the up-to-date values.

### [4.0.0]

#### Changed

- BREAKING: The `config` key has been replaced with a multiline string
- BREAKING: The chart now uses the `hostPathMounts` feature to mount the host paths
- The app version has been bumped to v1.20.7, this should allow better support of `/dev` subfolders.

### [3.3.2]

#### Added

- Added icon url.

#### Changed

- N/A

#### Removed

- N/A

### [1.0.0]

#### Added

- N/A

#### Changed

- N/A

#### Removed

- N/A

[5.0.0]: #500
[4.0.0]: #400
[3.3.2]: #332
[1.0.0]: #100

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
