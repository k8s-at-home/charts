# node-feature-discovery

![Version: 2.1.1](https://img.shields.io/badge/Version-2.1.1-informational?style=flat-square) ![AppVersion: 0.7.0](https://img.shields.io/badge/AppVersion-0.7.0-informational?style=flat-square)

Detect hardware features available on each node in a Kubernetes cluster, and advertises those features using node labels

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/kubernetes-sigs/node-feature-discovery>
* <https://github.com/k8s-at-home/charts>

## Requirements

## Dependencies

| Repository | Name | Version |
|------------|------|---------|

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install node-feature-discovery k8s-at-home/node-feature-discovery
```

## Installing the Chart

To install the chart with the release name `node-feature-discovery`

```console
helm install node-feature-discovery k8s-at-home/node-feature-discovery
```

## Uninstalling the Chart

To uninstall the `node-feature-discovery` deployment

```console
helm uninstall node-feature-discovery
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](../common/values.yaml) from the [common library](../common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install node-feature-discovery \
  --set env.TZ="America/New York" \
    k8s-at-home/node-feature-discovery
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install node-feature-discovery k8s-at-home/node-feature-discovery -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| config | string | `"#sources:\n#  cpu:\n#    cpuid:\n##     NOTE: whitelist has priority over blacklist\n#      attributeBlacklist:\n#        - \"BMI1\"\n#        - \"BMI2\"\n#        - \"CLMUL\"\n#        - \"CMOV\"\n#        - \"CX16\"\n#        - \"ERMS\"\n#        - \"F16C\"\n#        - \"HTT\"\n#        - \"LZCNT\"\n#        - \"MMX\"\n#        - \"MMXEXT\"\n#        - \"NX\"\n#        - \"POPCNT\"\n#        - \"RDRAND\"\n#        - \"RDSEED\"\n#        - \"RDTSCP\"\n#        - \"SGX\"\n#        - \"SSE\"\n#        - \"SSE2\"\n#        - \"SSE3\"\n#        - \"SSE4.1\"\n#        - \"SSE4.2\"\n#        - \"SSSE3\"\n#      attributeWhitelist:\n#  kernel:\n#    kconfigFile: \"/path/to/kconfig\"\n#    configOpts:\n#      - \"NO_HZ\"\n#      - \"X86\"\n#      - \"DMI\"\n#  pci:\n#    deviceClassWhitelist:\n#      - \"0200\"\n#      - \"03\"\n#      - \"12\"\n#    deviceLabelFields:\n#      - \"class\"\n#      - \"vendor\"\n#      - \"device\"\n#      - \"subsystem_vendor\"\n#      - \"subsystem_device\"\n#  usb:\n#    deviceClassWhitelist:\n#      - \"0e\"\n#      - \"ef\"\n#      - \"fe\"\n#      - \"ff\"\n#    deviceLabelFields:\n#      - \"class\"\n#      - \"vendor\"\n#      - \"device\"\n#  custom:\n#    - name: \"my.kernel.feature\"\n#      matchOn:\n#        - loadedKMod: [\"example_kmod1\", \"example_kmod2\"]\n#    - name: \"my.pci.feature\"\n#      matchOn:\n#        - pciId:\n#            class: [\"0200\"]\n#            vendor: [\"15b3\"]\n#            device: [\"1014\", \"1017\"]\n#        - pciId :\n#            vendor: [\"8086\"]\n#            device: [\"1000\", \"1100\"]\n#    - name: \"my.usb.feature\"\n#      matchOn:\n#        - usbId:\n#          class: [\"ff\"]\n#          vendor: [\"03e7\"]\n#          device: [\"2485\"]\n#        - usbId:\n#          class: [\"fe\"]\n#          vendor: [\"1a6e\"]\n#          device: [\"089a\"]\n#    - name: \"my.combined.feature\"\n#      matchOn:\n#        - pciId:\n#            vendor: [\"15b3\"]\n#            device: [\"1014\", \"1017\"]\n#          loadedKMod : [\"vendor_kmod1\", \"vendor_kmod2\"]\n"` | node-feature-discovery configuration - see https://github.com/kubernetes-sigs/node-feature-discovery/blob/master/nfd-worker.conf.example for example |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.repository | string | `"gcr.io/k8s-staging-nfd/node-feature-discovery"` | Image repository |
| image.tag | string | `"v0.7.0"` | Image tag. Possible values listed [here](https://github.com/kubernetes-sigs/node-feature-discovery/releases). |
| imagePullSecrets | list | `[]` |  |
| master.affinity | object | `{"nodeAffinity":{"preferredDuringSchedulingIgnoredDuringExecution":[{"preference":{"matchExpressions":[{"key":"node-role.kubernetes.io/master","operator":"In","values":[""]}]},"weight":1}]}}` | Affinity settings for master component pod assignment |
| master.nodeSelector | object | `{}` | Node labels for master component pod assignment |
| master.replicaCount | int | `1` | Number of replicas to scale the master component to |
| master.resources | object | `{}` | CPU/Memory resource requests/limits for master component |
| master.securityContext | object | `{}` |  |
| master.tolerations | list | `[{"effect":"NoSchedule","key":"node-role.kubernetes.io/master","operator":"Equal","value":""}]` | Toleration labels for master component pod assignment. |
| nameOverride | string | `""` |  |
| podAnnotations | object | `{}` | Key-value pairs to add as pod annotations |
| podSecurityContext | object | `{}` |  |
| rbac.create | bool | `true` |  |
| service.annotations | object | `{}` | Service annotations for the GUI |
| service.clusterIP | string | `""` |  |
| service.externalTrafficPolicy | string | `nil` | Set the externalTrafficPolicy in the Service to either Cluster or Local |
| service.labels | object | `{}` | Custom labels |
| service.loadBalancerIP | string | `nil` | Loadbalance IP for the GUI |
| service.loadBalancerSourceRanges | list | `nil` | List of IP CIDRs allowed access to load balancer (if supported) |
| service.nodePort | int | `nil` | Kubernetes nodePort where the GUI is exposed |
| service.port | int | `8080` | Kubernetes port where the GUI is exposed |
| service.type | string | `"ClusterIP"` | Kubernetes service type for the GUI |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| sources | list | `[]` | List of sources to consider when labeling - see [documentation](https://github.com/kubernetes-sigs/node-feature-discovery#feature-sources) for info |
| worker.affinity | object | `{}` | Affinity settings for worker component pod assignment |
| worker.nodeSelector | object | `{}` | Node labels for worker component pod assignment |
| worker.resources | object | `{}` | CPU/Memory resource requests/limits for worker component |
| worker.securityContext | object | `{}` |  |
| worker.tolerations | list | `[]` | Toleration labels for worker component pod assignment |

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