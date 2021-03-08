# duplicati

![Version: 2.1.1](https://img.shields.io/badge/Version-2.1.1-informational?style=flat-square) ![AppVersion: v2.0.5.1](https://img.shields.io/badge/AppVersion-v2.0.5.1-informational?style=flat-square)

Store securely encrypted backups on cloud storage services!

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://hub.docker.com/r/linuxserver/duplicati/>
* <https://github.com/duplicati/duplicati>

## Requirements

## Dependencies

| Repository | Name | Version |
|------------|------|---------|

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install duplicati k8s-at-home/duplicati
```

## Installing the Chart

To install the chart with the release name `duplicati`

```console
helm install duplicati k8s-at-home/duplicati
```

## Uninstalling the Chart

To uninstall the `duplicati` deployment

```console
helm uninstall duplicati
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](../common/values.yaml) from the [common library](../common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install duplicati \
  --set env.TZ="America/New York" \
    k8s-at-home/duplicati
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install duplicati k8s-at-home/duplicati -f values.yaml
```

## Custom configuration

---
**NOTE**

If you get `Error: rendered manifests contain a resource that already exists. Unable to continue with install: existing resource conflict: ...` it may be because you uninstalled the chart with `skipuninstall` enabled, you need to manually delete the pvc or use `existingClaim`.

---

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/charts/tree/master/charts/common/)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity settings for pod assignment |
| cliArgs | string | `""` | Optionally specify any CLI variables you want to launch the app with |
| deploymentAnnotations | object | `{}` | Key-value pairs to add as deployment annotations |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.repository | string | `"linuxserver/duplicati"` | Image repository |
| image.tag | string | `"v2.0.5.1-2.0.5.1_beta_2020-01-18-ls72"` | Image tag. Possible values listed [here](https://hub.docker.com/r/linuxserver/duplicati/tags/). |
| ingress.annotations | object | `{}` | Ingress annotations |
| ingress.enabled | bool | `false` | Enables Ingress |
| ingress.hosts | list | `["chart-example.local"]` | Ingress accepted hostnames  |
| ingress.labels | object | `{}` | Custom labels |
| ingress.path | string | `"/"` | Ingress path |
| ingress.tls | list | `[]` | Ingress TLS configuration |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` | Node labels for pod assignment |
| persistence.backups.accessMode | string | `"ReadWriteOnce"` | Use an existing PVC to persist data existingClaim: your-claim -- Persistence access mode |
| persistence.backups.enabled | bool | `true` | Use persistent volume to store backups data |
| persistence.backups.size | string | `"1Gi"` | Size of persistent volume claim |
| persistence.backups.skipuninstall | bool | `false` | Do not delete the pvc upon helm uninstall  |
| persistence.config.accessMode | string | `"ReadWriteOnce"` | Use an existing PVC to persist data existingClaim: your-claim -- Persistence access mode |
| persistence.config.enabled | bool | `true` | Use persistent volume to store configuration data |
| persistence.config.size | string | `"1Gi"` | Size of persistent volume claim |
| persistence.config.skipuninstall | bool | `false` | Do not delete the pvc upon helm uninstall  |
| persistence.extraExistingClaimMounts | list | `[]` | Optionally add multiple existing claims |
| persistence.source.accessMode | string | `"ReadWriteOnce"` | Use an existing PVC to persist data existingClaim: your-claim -- Persistence access mode |
| persistence.source.enabled | bool | `true` | Use persistent volume to store source data |
| persistence.source.size | string | `"1Gi"` | Size of persistent volume claim |
| persistence.source.skipuninstall | bool | `false` | Do not delete the pvc upon helm uninstall  |
| pgid | int | `1001` | Process groupID the duplicati instance should run as |
| podAnnotations | object | `{}` | Key-value pairs to add as pod annotations |
| probes.liveness.failureThreshold | int | `5` | Specify liveness `failureThreshold` parameter for the deployment |
| probes.liveness.initialDelaySeconds | int | `60` | Specify liveness `initialDelaySeconds` parameter for the deployment |
| probes.liveness.timeoutSeconds | int | `10` | Specify liveness `timeoutSeconds` parameter for the deployment |
| probes.readiness.failureThreshold | int | `5` | Specify readiness `failureThreshold` parameter for the deployment |
| probes.readiness.initialDelaySeconds | int | `60` | Specify readiness `initialDelaySeconds` parameter for the deployment |
| probes.readiness.timeoutSeconds | int | `10` | Specify readiness `timeoutSeconds` parameter for the deployment |
| puid | int | `1001` | Process userID the duplicati instance should run as |
| resources | object | `{}` | CPU/Memory resource requests/limits |
| service.annotations | object | `{}` | Service annotations for the duplicati GUI |
| service.labels | object | `{}` | Custom labels |
| service.loadBalancerIP | string | `nil` | Loadbalance IP for the duplicati GUI |
| service.port | int | `8200` | Kubernetes port where the duplicati GUI is exposed |
| service.type | string | `"ClusterIP"` | Kubernetes service type for the duplicati GUI |
| strategyType | string | `"Recreate"` | Specifies the strategy used to replace old Pods by new ones |
| timezone | string | `"UTC"` | Timezone the duplicati instance should run as, e.g. 'America/New_York' |
| tolerations | list | `[]` | Toleration labels for pod assignment |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/charts/tree/master/charts/common/README.md#Changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [2.1.1]

#### Added

- N/A

#### Changed

- Use helm-docs

#### Removed

- N/A

[2.1.1]: #2.1.1

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)