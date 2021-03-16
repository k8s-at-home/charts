# deconz

![Version: 2.0.2](https://img.shields.io/badge/Version-2.0.2-informational?style=flat-square) ![AppVersion: 2.05.80](https://img.shields.io/badge/AppVersion-2.05.80-informational?style=flat-square)

A Helm chart for deploying deCONZ

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/dresden-elektronik/deconz-rest-plugin>
* <https://github.com/marthoc/docker-deconz>

## Requirements

## Dependencies

| Repository | Name | Version |
|------------|------|---------|

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install deconz k8s-at-home/deconz
```

## Installing the Chart

To install the chart with the release name `deconz`

```console
helm install deconz k8s-at-home/deconz
```

## Uninstalling the Chart

To uninstall the `deconz` deployment

```console
helm uninstall deconz
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](../common/values.yaml) from the [common library](../common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install deconz \
  --set env.TZ="America/New York" \
    k8s-at-home/deconz
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install deconz k8s-at-home/deconz -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity settings for pod assignment |
| autoscaling.enabled | bool | `false` | Enables Pod auto-scaling |
| autoscaling.maxReplicas | int | `1` | Maximum number of replicas to auto-scale to |
| autoscaling.minReplicas | int | `1` | Minimum number of replicas to auto-scale to |
| extraVolumes | list | `[]` | Optionally add additional Volumes Volumes will be mounted to the folder specified under mountPath If no mountPath is set it will be mounted to /mnt/<name> |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.repository | string | `"marthoc/deconz"` | Image repository |
| image.tag | string | `"amd64-2.05.80"` | Image tag. Possible values listed [here](https://hub.docker.com/r/marthoc/deconz/tags/). |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` | Ingress annotations |
| ingress.enabled | bool | `false` | Enables Ingress |
| ingress.hosts | list | `[{"host":"deconz.local"}]` | Ingress accepted hostnames |
| ingress.labels | object | `{}` |  |
| ingress.path | string | `"/"` | Ingress path |
| ingress.tls | list | `[]` | Ingress TLS configuration |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` | Node labels for pod assignment |
| persistence.accessMode | string | `"ReadWriteOnce"` | Use an existing PVC to persist data existingClaim: deconz-data -- Persistence access mode |
| persistence.annotations | object | `{}` | Key-value pairs to add as persistent volume claim annotations |
| persistence.enabled | bool | `false` | Use persistent volume to store configuration data |
| persistence.size | string | `"1Gi"` | Size of persistent volume claim |
| podAnnotations | object | `{}` | Key-value pairs to add as pod annotations |
| podSecurityContext | object | `{}` |  |
| probes.liveness.enabled | bool | `true` | Enables liveness probe for the Pod |
| probes.liveness.failureThreshold | int | `5` | Specify liveness `failureThreshold` parameter for the Pod |
| probes.liveness.initialDelaySeconds | int | `30` | Specify liveness `initialDelaySeconds` parameter for the Pod |
| probes.liveness.timeoutSeconds | int | `10` | Specify liveness `timeoutSeconds` parameter for the Pod |
| probes.readiness.enabled | bool | `true` | Enables readiness probe for the Pod |
| probes.readiness.failureThreshold | int | `5` | Specify readiness `failureThreshold` parameter for the Pod |
| probes.readiness.initialDelaySeconds | int | `30` | Specify readiness `initialDelaySeconds` parameter for the Pod |
| probes.startup.enabled | bool | `false` | Enables startup probe for the Pod |
| probes.startup.failureThreshold | int | `30` | Specify startup `failureThreshold` parameter for the Pod |
| probes.startup.periodSeconds | int | `10` | Specify startup `periodSeconds` parameter for the Pod |
| replicaCount | int | `1` | Number of replicas to scale to |
| resources | object | `{}` | CPU/Memory resource requests/limits |
| securityContext.privileged | bool | `true` |  |
| service.annotations | object | `{}` | Service annotations for the GUI |
| service.clusterIP | string | `""` |  |
| service.externalIPs | list | `[]` |  |
| service.externalTrafficPolicy | string | `"Local"` | Set the externalTrafficPolicy in the Service to either Cluster or Local |
| service.httpPort | int | `80` | Kubernetes port where the GUI is exposed |
| service.labels | object | `{}` | Custom labels |
| service.loadBalancerIP | string | `""` | Loadbalancer IP for the GUI |
| service.loadBalancerSourceRanges | string | `nil` | List of IP CIDRs allowed access to load balancer (if supported) |
| service.type | string | `"ClusterIP"` | Kubernetes service type for the GUI |
| service.vncPort | int | `5900` | Kubernetes port where the VNC server is exposed |
| service.websocketPort | int | `443` | Kubernetes port where the websocket is exposed |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. @default: a name is generated using the fullname template |
| strategyType | string | `"Recreate"` | Specifies the strategy used to replace old Pods by new ones |
| timezone | string | `"UTC"` | Timezone the instance should run as, e.g. 'America/New_York' |
| tolerations | list | `[]` | Toleration labels for pod assignment |
| vnc.enabled | bool | `true` | Enabled the built-in VNC server to access the application |
| vnc.existingSecret | string | `""` | Existing Kubernetes secret containing the VNC password |
| vnc.password | string | `"changeme"` | VNC server password |
| zigbeeDevice.enabled | bool | `false` | Enables passing through a Zigbee device |
| zigbeeDevice.hostPath | string | `"/dev/ttyUSB1"` | HostPath of the Zigbee device that should be passed through |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [2.0.2]

#### Added

- N/A

#### Changed

- move to helm-docs

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