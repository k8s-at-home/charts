# smarter-device-manager

![Version: 2.2.1](https://img.shields.io/badge/Version-2.2.1-informational?style=flat-square) ![AppVersion: 1.1.2](https://img.shields.io/badge/AppVersion-1.1.2-informational?style=flat-square)

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
| https://library-charts.k8s-at-home.com | common | 1.0.0 |

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
config:
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

Please note that only the root of the host `/dev` directory is considered for discovery. _Therefore, `by-id` paths will not work and some `udev` rules may be necessary._

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
| devicePluginPath | string | `"/var/lib/kubelet/device-plugins"` |  |
| dnsPolicy | string | `"ClusterFirstWithHostNet"` |  |
| hostNetwork | bool | `true` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"registry.gitlab.com/arm-research/smarter/smarter-device-manager"` |  |
| image.tag | string | `"v1.1.2"` |  |
| priorityClassName | string | `"system-node-critical"` |  |
| securityContext.allowPrivilegeEscalation | bool | `false` |  |
| securityContext.capabilities.drop[0] | string | `"ALL"` |  |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [1.0.0]

#### Added

- N/A

#### Changed

- N/A

#### Removed

- N/A

[1.0.0]: #1.0.0

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)