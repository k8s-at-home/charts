# librespeed

![Version: 2.0.1](https://img.shields.io/badge/Version-2.0.1-informational?style=flat-square) ![AppVersion: 1.0.6-12](https://img.shields.io/badge/AppVersion-1.0.6--12-informational?style=flat-square)

Librespeed is a HTML5 webpage to test upload and download speeds

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/librespeed/speedtest>
* <https://hub.docker.com/r/linuxserver/librespeed>
* <https://github.com/k8s-at-home/charts/tree/master/charts/librespeed>

## Requirements

## Dependencies

| Repository | Name | Version |
|------------|------|---------|

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install librespeed k8s-at-home/librespeed
```

## Installing the Chart

To install the chart with the release name `librespeed`

```console
helm install librespeed k8s-at-home/librespeed
```

## Uninstalling the Chart

To uninstall the `librespeed` deployment

```console
helm uninstall librespeed
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](../common/values.yaml) from the [common library](../common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install librespeed \
  --set env.TZ="America/New York" \
    k8s-at-home/librespeed
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install librespeed k8s-at-home/librespeed -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity settings for pod assignment or the homebridge GUI |
| deploymentAnnotations | object | `{}` | Key-value pairs to add as deployment annotations |
| distance | string | `"km"` | how the distance from the server is measured. Options `km`, `mi`, or `` |
| email | string | `nil` | Email address for GDPR requests. Must be specified when telemetry=true |
| fullnameOverride | string | `""` |  |
| idObfuscation | bool | `false` | Test IDs are obfuscated, avoids exposing database internal sequential IDs |
| image.pullPolicy | string | `"IfNotPresent"` | Librespeed image pull policy |
| image.repository | string | `"adolfintel/speedtest"` | Librespeed image |
| image.tag | string | `"latest"` | Librespeed image tag |
| ingress.annotations | object | `{}` | Ingress annotations |
| ingress.enabled | bool | `false` | Enables Ingress |
| ingress.hosts | list | `["chart-example.local"]` | Ingress accepted hostnames |
| ingress.path | string | `"/"` | Ingress path |
| ingress.tls | list | `[]` | Ingress TLS configuration |
| livenessProbePath | string | `"/"` | Default livenessProbe path |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` | Node labels for pod assignment or the homebridge GUI |
| password | string | `"ChangeMe"` | password for stats page |
| persistence.accessMode | string | `"ReadWriteOnce"` | Persistence access modes |
| persistence.enabled | bool | `true` | Use persistent volume to store data |
| persistence.existingClaim | string | `nil` | Use an existing PVC to persist data |
| persistence.size | string | `"1Gi"` | Size of persistent volume claim |
| persistence.skipuninstall | bool | `false` | Do not delete the pvc upon helm uninstall |
| persistence.storageClass | string | `nil` | Type of persistent volume claim |
| persistence.subPath | string | `nil` | When mounting the data volume you may specify a subPath |
| pgid | string | `"1000"` | Default GID |
| podAnnotations | object | `{}` | Key-value pairs to add as pod annotations |
| puid | string | `"1000"` | Default UID |
| readinessProbePath | string | `"/"` | Default readinessProbe path |
| redactIPAddresses | bool | `false` | IP addresses/hostnames are redacted from the collected telemetry |
| resources | object | `{}` | CPU/Memory resource requests/limits or the homebridge GUI |
| service.annotations | object | `{}` | Service annotations for the GUI |
| service.externalTrafficPolicy | string | `"Cluster"` | Set the externalTrafficPolicy in the Service to either Cluster or Local |
| service.labels | object | `{}` | Custom labels |
| service.loadBalancerIP | string | `nil` | Loadbalance IP for the GUI |
| service.loadBalancerSourceRanges | list | `nil` | List of IP CIDRs allowed access to load balancer (if supported) |
| service.nodePort | int | `nil` | Kubernetes nodePort where the GUI is exposed |
| service.port | int | `80` | Kubernetes port where the GUI is exposed |
| service.type | string | `"ClusterIP"` | Kubernetes service type for the GUI |
| strategyType | string | `"Recreate"` | Specifies the strategy used to replace old Pods by new ones |
| telemetry | bool | `false` | Enable/Disable history |
| timezone | string | `"UTC"` | Default timezone |
| title | string | `"LibreSpeed"` | Title of your speedtest |
| tolerations | list | `[]` | Toleration labels for pod assignment or the homebridge GUI |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [2.0.1]

#### Added

- N/A

#### Changed

- Use helm-docs

#### Removed

- N/A

[2.0.1]: #2.0.1

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)