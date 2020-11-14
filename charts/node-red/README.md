# Node-RED

Low-code programming for event-driven applications

**This chart is not maintained by the Node-RED project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new)**

## TL;DR;

```shell
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm install k8s-at-home/node-red
```

## Introduction

This code is adopted from the [official node-red docker image](https://hub.docker.com/r/nodered/node-red/) which runs the [Node-RED application](https://nodered.org/)

## Installing the Chart

To install the chart with the release name `my-release`:

```shell
helm install --name my-release k8s-at-home/node-red
```
## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```shell
helm delete my-release --purge
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following tables lists the configurable parameters of the Node-RED chart and their default values.

| Parameter                             | Description                                                             | Default                   |
|:------------------------------------- |:----------------------------------------------------------------------- |:------------------------- |
| `image.repository`                    | node-red image                                                          | `nodered/node-red`        |
| `image.tag`                           | node-red image tag                                                      | `1.0.6-12-minimal`        |
| `image.pullPolicy`                    | node-red image pull policy                                              | `IfNotPresent`            |
| `strategyType`                        | Specifies the strategy used to replace old Pods by new ones             | `Recreate`                |
| `serviceAccountName`                  | Service account to run the pod as                                       | ``                        |
| `probes.liveness.enabled`             | Enable/ disable livenessProbe                                           | `true`                    |
| `probes.liveness.probePath`           | Set livenessProbe path                                                  | `/`                       |
| `probes.liveness.initialDelaySeconds` | Set livenessProbe initial delay                                         | 60                        |
| `probes.liveness.failureThreshold`    | Set livenessProbe failure threshold                                     | 5                         |
| `probes.liveness.timeoutSeconds`      | Set livenessProbe timeout                                               | 10                        |
| `probes.readiness.enabled`            | Enable/ disable readinessProbe                                          | `true`                    |
| `probes.readiness.probePath`          | Set readinessProbe path                                                 | `/`                       |
| `probes.readiness.initialDelaySeconds`| Set readinessProbe initial delay                                        | 60                        |
| `probes.readiness.failureThreshold`   | Set readinessProbe failure threshold                                    | 5                         |
| `probes.readiness.timeoutSeconds`     | Set readinessProbe timeout                                              | 10                        |
| `probes.startup.enabled`              | Enable/ disable readinessProbe                                          | `false`                   |
| `probes.startup.probePath`            | Set startupProbe path                                                   | `/`                       |
| `probes.startup.failureThreshold`     | Set startupProbe failure threshold                                      | 30                        |
| `probes.startup.periodSeconds`        | Set startupProbe period                                                 | 10                        |
| `flows`                               | Default flows configuration                                             | `flows.json`              |
| `safeMode`                            | Setting to true starts Node-RED in safe (not running) mode              | `false`                   |
| `enableProjects`                      | setting to true starts Node-RED with the projects feature enabled       | `false`                   |
| `nodeOptions`                         | Node.js runtime arguments                                               | ``                        |
| `extraEnvs`                           | Extra environment variables which will be appended to the env           | `[]`                      |
| `timezone`                            | Default timezone                                                        | `UTC`                     |
| `service.type`                        | Kubernetes service type for the GUI                                     | `ClusterIP`               |
| `service.port`                        | Kubernetes port where the GUI is exposed                                | `1880`                    |
| `service.nodePort`                    | Kubernetes nodePort where the GUI is exposed                            | ``                        |
| `service.annotations`                 | Service annotations for the GUI                                         | `{}`                      |
| `service.labels`                      | Custom labels                                                           | `{}`                      |
| `service.loadBalancerIP`              | Loadbalance IP for the GUI                                              | `{}`                      |
| `service.loadBalancerSourceRanges`    | List of IP CIDRs allowed access to load balancer (if supported)         | None                      |
| `service.externalTrafficPolicy`       | Set the externalTrafficPolicy in the Service to either Cluster or Local | `Cluster`                 |
| `ingress.enabled`                     | Enables Ingress                                                         | `false`                   |
| `ingress.annotations`                 | Ingress annotations                                                     | `{}`                      |
| `ingress.path`                        | Ingress path                                                            | `/`                       |
| `ingress.hosts`                       | Ingress accepted hostnames                                              | `chart-example.local`     |
| `ingress.tls`                         | Ingress TLS configuration                                               | `[]`                      |
| `persistence.enabled`                 | Use persistent volume to store data                                     | `false`                   |
| `persistence.size`                    | Size of persistent volume claim                                         | `5Gi`                     |
| `persistence.existingClaim`           | Use an existing PVC to persist data                                     | `nil`                     |
| `persistence.storageClass`            | Type of persistent volume claim                                         | `-`                       |
| `persistence.accessModes`             | Persistence access modes                                                | `ReadWriteOnce`           |
| `persistence.subPath`                 | Mount a sub dir of the persistent volume                                | `nil`                     |
| `resources`                           | CPU/Memory resource requests/limits                                     | `{}`                      |
| `nodeSelector`                        | Node labels for pod assignment                                          | `{}`                      |
| `tolerations`                         | Toleration labels for pod assignment                                    | `[]`                      |
| `affinity`                            | Affinity settings for pod assignment                                    | `{}`                      |
| `podAnnotations`                      | Key-value pairs to add as pod annotations                               | `{}`                      |
| `deploymentAnnotations`               | Key-value pairs to add as deployment annotations                        | `{}`                      |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```shell
helm install --name my-release \
  --set config.timezone="America/New_York" \
    k8s-at-home/node-red
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```shell
helm install --name my-release -f values.yaml k8s-at-home/node-red
```

Read through the [values.yaml](values.yaml) file. It has several commented out suggested values.
