# intel-gpu-plugin

![Version: 1.2.1](https://img.shields.io/badge/Version-1.2.1-informational?style=flat-square) ![AppVersion: 0.19.0](https://img.shields.io/badge/AppVersion-0.19.0-informational?style=flat-square)

The Intel GPU plugin facilitates offloading the processing of computation intensive workloads to GPU hardware

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/intel/intel-device-plugins-for-kubernetes/blob/master/cmd/gpu_plugin>

## Requirements

## Dependencies

| Repository | Name | Version |
|------------|------|---------|

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
| affinity | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.repository | string | `"intel/intel-gpu-plugin"` | Image repository |
| image.tag | string | `"0.19.0"` | Image tag. Possible values listed [here](https://hub.docker.com/r/intel/intel-gpu-plugin/tags) |
| imagePullSecrets | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` | Key-value pairs to add as pod annotations |
| podSecurityContext | object | `{}` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| sharedDeviceNumber | int | 1 | Number of containers sharing the same GPU device |
| strategyType | string | `"Recreate"` | Specifies the strategy used to replace old Pods by new ones |
| tolerations | list | `[]` |  |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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

[1.2.0]: #1.2.0
[1.1.0]: #1.1.0
[1.0.1]: #1.0.1

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)