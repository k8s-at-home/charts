# intel-gpu-plugin

![Version: 2.0.0](https://img.shields.io/badge/Version-2.0.0-informational?style=flat-square) ![AppVersion: 0.20.0](https://img.shields.io/badge/AppVersion-0.20.0-informational?style=flat-square)

The Intel GPU plugin facilitates offloading the processing of computation intensive workloads to GPU hardware

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/intel/intel-device-plugins-for-kubernetes/blob/master/cmd/gpu_plugin>

## Requirements

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://library-charts.k8s-at-home.com | common | 2.5.0 |

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install intel-gpu-plugin k8s-at-home/intel-gpu-plugin
```

## Installing the Chart

To install the chart with the release name `intel-gpu-plugin`

```console
helm install intel-gpu-plugin k8s-at-home/intel-gpu-plugin
```

## Uninstalling the Chart

To uninstall the `intel-gpu-plugin` deployment

```console
helm uninstall intel-gpu-plugin
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install intel-gpu-plugin \
  --set env.TZ="America/New York" \
    k8s-at-home/intel-gpu-plugin
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install intel-gpu-plugin k8s-at-home/intel-gpu-plugin -f values.yaml
```

## Custom configuration

### Node Feature Discovery

If your cluster runs [Node Feature Discovery](https://github.com/k8s-at-home/charts/blob/master/charts/node-feature-discovery), you can deploy the device plugin only on nodes with Intel GPU by specifying the desired `nodeSelector` or `affinity` in your values. For example (make sure to update to your exact feature label):

```yaml
affinity:
  nodeAffinity:
    requiredDuringSchedulingIgnoredDuringExecution:
      nodeSelectorTerms:
        - matchExpressions:
            - key: feature.node.kubernetes.io/pci-0300_8086.present
              operator: In
              values:
                - "true"
```

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| args[0] | string | `"-shared-dev-num"` |  |
| args[1] | string | `"1"` |  |
| controllerType | string | `"daemonset"` |  |
| envValueFrom.NODE_NAME.fieldRef.fieldPath | string | `"spec.nodeName"` |  |
| hostPathMounts[0].emptyDir | bool | `false` |  |
| hostPathMounts[0].enabled | bool | `true` |  |
| hostPathMounts[0].hostPath | string | `"/dev/dri"` |  |
| hostPathMounts[0].mountPath | string | `"/dev/dri"` |  |
| hostPathMounts[0].name | string | `"devfs"` |  |
| hostPathMounts[0].readOnly | bool | `true` |  |
| hostPathMounts[1].emptyDir | bool | `false` |  |
| hostPathMounts[1].enabled | bool | `true` |  |
| hostPathMounts[1].hostPath | string | `"/sys/class/drm"` |  |
| hostPathMounts[1].mountPath | string | `"/sys/class/drm"` |  |
| hostPathMounts[1].name | string | `"sysfs"` |  |
| hostPathMounts[1].readOnly | bool | `true` |  |
| hostPathMounts[2].emptyDir | bool | `false` |  |
| hostPathMounts[2].enabled | bool | `true` |  |
| hostPathMounts[2].hostPath | string | `"/var/lib/kubelet/device-plugins"` |  |
| hostPathMounts[2].mountPath | string | `"/var/lib/kubelet/device-plugins"` |  |
| hostPathMounts[2].name | string | `"kubeletsockets"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"intel/intel-gpu-plugin"` |  |
| image.tag | string | `"0.20.0"` |  |
| ingress.enabled | bool | `false` |  |
| probes.liveness.enabled | bool | `false` |  |
| probes.readiness.enabled | bool | `false` |  |
| probes.startup.enabled | bool | `false` |  |
| service.enabled | bool | `false` |  |
| serviceAccount.create | bool | `true` |  |
| strategy.type | string | `"Recreate"` |  |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [2.0.0]

#### Added

- N/A

#### Changed

- **BREAKING** Migrate to the common library, a lot of configuration has changed.

#### Removed

- N/A

### [1.2.0]

#### Fixed

- Renamed the `shared_device_number` value to `sharedDeviceNumber`.

### [1.1.0]

#### Added

- This chart now supports the `shared-dev-num` value. This allows setting the number of containers sharing the same GPU device.

#### Changed

- Bumped the image version to 0.19.0.

#### Fixed

- Changelog versions

### [1.0.1]

#### Added

- N/A

#### Changed

- use helm-docs

#### Removed

- N/A

[2.0.0]: #200
[1.2.0]: #120
[1.1.0]: #110
[1.0.1]: #101

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
