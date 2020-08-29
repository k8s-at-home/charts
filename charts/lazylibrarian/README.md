# LazyLibrarian helm chart

This is a helm chart for [LazyLibrarian](https://gitlab.com/LazyLibrarian/LazyLibrarian.git) based on the [container image provided by LinuxServer.io](https://hub.docker.com/r/linuxserver/lazylibrarian/).

## TL;DR

```shell
$ helm repo add k8s-at-home https://k8s-at-home.com/charts/
$ helm install k8s-at-home/lazylibrarian
```

## Installing the Chart

To install the chart with the release name `my-release`:

```shell
helm install my-release k8s-at-home/lazylibrarian
```

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```shell
helm delete my-release --purge
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following tables lists the configurable parameters of the LazyLibrarian chart and their default values.

| Parameter                                   | Description                                                                                         | Default                                        |
| ------------------------------------------- | --------------------------------------------------------------------------------------------------- | ---------------------------------------------- |
| `image.repository`                          | Image repository                                                                                    | `linuxserver/lazylibrarian`                    |
| `image.tag`                                 | Image tag. Possible values listed [here](https://hub.docker.com/r/linuxserver/lazylibrarian/tags/). | `581cdfb3-ls23`                                |
| `image.pullPolicy`                          | Image pull policy                                                                                   | `IfNotPresent`                                 |
| `strategyType`                              | Specifies the strategy used to replace old Pods by new ones                                         | `Recreate`                                     |
| `timezone`                                  | Timezone the instance should run as, e.g. 'America/New_York'                                        | `UTC`                                          |
| `puid`                                      | process userID the instance should run as                                                           | `1001`                                         |
| `pgid`                                      | process groupID the instance should run as                                                          | `1001`                                         |
| `dockerMods.calibre.enabled`                | Enable optional calibre conversion feature. refer [here](https://github.com/linuxserver/docker-lazylibrarian#application-setup) | `false`            |
| `dockerMods.calibre.image.repository`       | DockerMod image repository                                                                          | `linuxserver/calibre-web`                      |
| `dockerMods.calibre.image.tag`              | DockerMod image tag. Can be found [here](https://hub.docker.com/r/linuxserver/calibre-web/tags/)    | `calibre`                                      |
| `dockerMods.ffmpeg.enabled`                 | Enable optional ffmpeg conversion feature. refer [here](https://github.com/linuxserver/docker-lazylibrarian#application-setup) | `false`             |
| `dockerMods.ffmpeg.image.repository`        | DockerMod image repository                                                                          | `linuxserver/mods`                             |
| `dockerMods.ffmpeg.image.tag`               | DockerMod image tag.                                                                                | `lazylibrarian-ffmpeg`                         |
| `probes.liveness.enabled`                   | Enables liveness probe for the main container                                                       | `true`                                         |
| `probes.liveness.initialDelaySeconds`       | Specify liveness `initialDelaySeconds` parameter for the main container                             | `60`                                           |
| `probes.liveness.failureThreshold`          | Specify liveness `failureThreshold` parameter for the main container                                | `5`                                            |
| `probes.liveness.timeoutSeconds`            | Specify liveness `timeoutSeconds` parameter for the main container                                  | `10`                                           |
| `probes.readiness.enabled`                  | Enables readiness probe for the main container                                                      | `true`                                         |
| `probes.readiness.initialDelaySeconds`      | Specify readiness `initialDelaySeconds` parameter for the main container                            | `60`                                           |
| `probes.readiness.failureThreshold`         | Specify readiness `failureThreshold` parameter for the main container                               | `5`                                            |
| `probes.readiness.timeoutSeconds`           | Specify readiness `timeoutSeconds` parameter for the main container                                 | `10`                                           |
| `probes.startup.enabled`                    | Enables startup probe for the main container                                                        | `false`                                        |
| `probes.startup.failureThreshold`           | Specify startup `failureThreshold` parameter for the main container                                 | `30`                                           |
| `probes.startup.timeoutSeconds`             | Specify startup `periodSeconds` parameter for the main container                                    | `10`                                           |
| `service.type`                              | Kubernetes service type for the GUI                                                                 | `ClusterIP`                                    |
| `service.port`                              | Kubernetes port where the GUI is exposed                                                            | `5299`                                         |
| `service.annotations`                       | Service annotations for the GUI                                                                     | `{}`                                           |
| `service.labels`                            | Custom labels                                                                                       | `{}`                                           |
| `service.loadBalancerIP`                    | Loadbalancer IP for the GUI                                                                         | `{}`                                           |
| `service.loadBalancerSourceRanges`          | List of IP CIDRs allowed access to load balancer (if supported)                                     | None                                           |
| `ingress.enabled`                           | Enables Ingress                                                                                     | `false`                                        |
| `ingress.annotations`                       | Ingress annotations                                                                                 | `{}`                                           |
| `ingress.labels`                            | Custom labels                                                                                       | `{}`                                           |
| `ingress.path`                              | Ingress path                                                                                        | `/`                                            |
| `ingress.hosts`                             | Ingress accepted hostnames                                                                          | `chart-example.local`                          |
| `ingress.tls`                               | Ingress TLS configuration                                                                           | `[]`                                           |
| `persistence.enabled`                       | Use persistent volume to store configuration data                                                   | `true`                                         |
| `persistence.size`                          | Size of persistent volume claim                                                                     | `1Gi`                                          |
| `persistence.existingClaim`                 | Use an existing PVC to persist data                                                                 | `nil`                                          |
| `persistence.storageClass`                  | Type of persistent volume claim                                                                     | `-`                                            |
| `persistence.subPath`                       | Mount a sub directory if set                                                                        | `nil          `                                |
| `persistence.accessMode`                    | Persistence access mode                                                                             | `ReadWriteOnce`                                |
| `persistence.extraVolumes`                  | Optionally add multiple additional volumes                                                          | `[]`                                           |
| `resources`                                 | CPU/Memory resource requests/limits                                                                 | `{}`                                           |
| `nodeSelector`                              | Node labels for pod assignment                                                                      | `{}`                                           |
| `tolerations`                               | Toleration labels for pod assignment                                                                | `[]`                                           |
| `affinity`                                  | Affinity settings for pod assignment                                                                | `{}`                                           |
| `podAnnotations`                            | Key-value pairs to add as pod annotations                                                           | `{}`                                           |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
helm install my-release \
  --set timezone="Europe/Amsterdam" \
    k8s-at-home/lazylibrarian
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
helm install my-release -f values.yaml k8s-at-home/lazylibrarian
```

---

Read through the [values.yaml](https://github.com/k8s-at-home/charts/lazylibrarian/values.yaml) file. It has several commented out suggested values.
