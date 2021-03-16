# homebridge

![Version: 1.0.3](https://img.shields.io/badge/Version-1.0.3-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 3.1.0](https://img.shields.io/badge/AppVersion-3.1.0-informational?style=flat-square)

A lightweight NodeJS server that emulates the iOS HomeKit API

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://homebridge.io/>
* <https://github.com/oznu/docker-homebridge>

## Requirements

## Dependencies

| Repository | Name | Version |
|------------|------|---------|

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install homebridge k8s-at-home/homebridge
```

## Installing the Chart

To install the chart with the release name `homebridge`

```console
helm install homebridge k8s-at-home/homebridge
```

## Uninstalling the Chart

To uninstall the `homebridge` deployment

```console
helm uninstall homebridge
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](../common/values.yaml) from the [common library](../common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install homebridge \
  --set env.TZ="America/New York" \
    k8s-at-home/homebridge
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install homebridge k8s-at-home/homebridge -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity settings for pod assignment or the homebridge GUI |
| config.additionalPackages | list | `[]` | Additional Alpine packages to install at container statup such as `bash` |
| config.enableUI | bool | `true` | Enable the Homebridge UI plugin |
| config.plugins | list | `[]` | Additional Homebridge plugins to install at container startup such as `homebridge-hue` |
| extraEnvs | list | `[]` | Extra ENV vars to pass to the homebridge container |
| fullnameOverride | string | `""` |  |
| hostNetwork | bool | `false` | Enable hostNetwork - needed for discovery to work |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.repository | string | `"oznu/homebridge"` | Image repository |
| image.tag | string | `"3.1.0"` | Overrides the image tag whose default is the chart appVersion. Possible values listed [here](https://hub.docker.com/r/oznu/homebridge/tags) |
| imagePullSecrets | list | `[]` | Secrets to use when pulling the image |
| ingress.annotations | object | `{}` | Ingress annotations |
| ingress.enabled | bool | `false` | Enables Ingress |
| ingress.hosts | list | `["chart-example.local"]` | Ingress accepted hostnames |
| ingress.path | string | `"/"` | Ingress path |
| ingress.tls | list | `[]` | Ingress TLS configuration |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` | Node labels for pod assignment or the homebridge GUI |
| persistence.accessMode | string | `"ReadWriteOnce"` | Persistence access modes |
| persistence.enabled | bool | `true` | Use persistent volume to store data |
| persistence.existingClaim | string | `nil` | Use an existing PVC to persist data |
| persistence.size | string | `"1Gi"` | Size of persistent volume claim |
| persistence.skipuninstall | bool | `false` | Do not delete the pvc upon helm uninstall |
| persistence.storageClass | string | `nil` | Type of persistent volume claim |
| pgid | int | `1000` | process groupID the instance should run as |
| podAnnotations | object | `{}` | Key-value pairs to add as pod annotations |
| podSecurityContext | object | `{}` |  |
| probes.liveness.enabled | bool | `true` | Use the livenessProbe? |
| probes.liveness.failureThreshold | int | `5` | Specify liveness `failureThreshold` parameter for the deployment |
| probes.liveness.initialDelaySeconds | int | `60` | Specify liveness `initialDelaySeconds` parameter for the deployment |
| probes.liveness.timeoutSeconds | int | `10` | Specify liveness `timeoutSeconds` parameter for the deployment |
| probes.readiness.enabled | bool | `true` | Use the readinessProbe? |
| probes.readiness.failureThreshold | int | `5` | Specify readiness `failureThreshold` parameter for the deployment |
| probes.readiness.initialDelaySeconds | int | `60` | Specify readiness `initialDelaySeconds` parameter for the deployment |
| probes.readiness.timeoutSeconds | int | `10` | Specify readiness `timeoutSeconds` parameter for the deployment |
| probes.startup.enabled | bool | `false` | Use the startupProbe? (new in kubernetes 1.16) |
| probes.startup.failureThreshold | int | `30` | Specify startup `failureThreshold` parameter for the deployment |
| probes.startup.periodSeconds | int | `10` | Specify startup `periodSeconds` parameter for the deployment |
| puid | int | `1000` | process userID the instance should run as |
| replicaCount | int | `1` |  |
| resources | object | `{}` | CPU/Memory resource requests/limits or the homebridge GUI |
| securityContext | object | `{}` |  |
| service.annotations | object | `{}` | Service annotations for the homebridge GUI |
| service.clusterIP | string | `nil` | Cluster IP for the homebridge GUI |
| service.externalIPs | string | `nil` | External IPs for the homebridge GUI |
| service.externalTrafficPolicy | string | `nil` | Loadbalancer externalTrafficPolicy |
| service.homebridgePort | int | `51826` |  |
| service.httpPort | int | `8080` | Kubernetes port where the homebridge GUI is exposed |
| service.loadBalancerIP | string | `nil` | Loadbalancer IP for the homebridge GUI |
| service.loadBalancerSourceRanges | string | `nil` | Loadbalancer client IP restriction range for the homebridge GUI |
| service.nodePort | string | `nil` | nodePort to listen on for the homebridge GUI |
| service.type | string | `"ClusterIP"` | Kubernetes service type for the homebridge GUI |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| strategyType | string | `"Recreate"` | Specifies the strategy used to replace old Pods by new ones |
| timezone | string | `"UTC"` | Specify the container timezone |
| tolerations | list | `[]` | Toleration labels for pod assignment or the homebridge GUI |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [1.0.3]

#### Added

- N/A

#### Changed

- Use helm-docs

#### Removed

- N/A

[1.0.3]: #1.0.3

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)