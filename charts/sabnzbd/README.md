# SABnzbd Usenet client

This is a helm chart for [SABnzbd](https://sabnzbd.org/) leveraging the [Linuxserver.io image](https://hub.docker.com/r/linuxserver/sabnzbd/)

## TL;DR;

```shell
$ helm repo add k8s-at-home https://k8s-at-home.com/charts/
$ helm install k8s-at-home/sabnzbd
```

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install --name my-release k8s-at-home/sabnzbd
```

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
helm delete my-release --purge
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following tables lists the configurable parameters of the Sentry chart and their default values.

| Parameter                              | Description                                                                                   | Default                         |
|----------------------------------------|-----------------------------------------------------------------------------------------------|---------------------------------|
| `image.repository`                     | Image repository                                                                              | `linuxserver/sabnzbd`           |
| `image.tag`                            | Image tag. Possible values listed [here](https://hub.docker.com/r/linuxserver/sabnzbd/tags/). | `2.3.9-0ubuntu1jcfp218.04-ls64` |
| `image.pullPolicy`                     | Image pull policy                                                                             | `IfNotPresent`                  |
| `strategyType`                         | Specifies the strategy used to replace old Pods by new ones                                   | `Recreate`                      |
| `timezone`                             | Timezone the sabnzbd instance should run as, e.g. 'America/New_York'                          | `UTC`                           |
| `puid`                                 | process userID the sabnzbd instance should run as                                             | `1001`                          |
| `pgid`                                 | process groupID the sabnzbd instance should run as                                            | `1001`                          |
| `probes.liveness.initialDelaySeconds`  | Specify liveness `initialDelaySeconds` parameter for the deployment                           | `60`                            |
| `probes.liveness.failureThreshold`     | Specify liveness `failureThreshold` parameter for the deployment                              | `5`                             |
| `probes.liveness.timeoutSeconds`       | Specify liveness `timeoutSeconds` parameter for the deployment                                | `10`                            |
| `probes.readiness.initialDelaySeconds` | Specify readiness `initialDelaySeconds` parameter for the deployment                          | `60`                            |
| `probes.readiness.failureThreshold`    | Specify readiness `failureThreshold` parameter for the deployment                             | `5`                             |
| `probes.readiness.timeoutSeconds`      | Specify readiness `timeoutSeconds` parameter for the deployment                               | `10`                            |
| `Service.type`                         | Kubernetes service type for the sabnzbd GUI                                                   | `ClusterIP`                     |
| `Service.port`                         | Kubernetes port where the sabnzbd GUI is exposed                                              | `8080`                          |
| `Service.annotations`                  | Service annotations for the sabnzbd GUI                                                       | `{}`                            |
| `Service.labels`                       | Custom labels                                                                                 | `{}`                            |
| `Service.loadBalancerIP`               | Loadbalancer IP for the sabnzbd GUI                                                           | `{}`                            |
| `Service.loadBalancerSourceRanges`     | List of IP CIDRs allowed access to load balancer (if supported)                               | None                            |
| `ingress.enabled`                      | Enables Ingress                                                                               | `false`                         |
| `ingress.annotations`                  | Ingress annotations                                                                           | `{}`                            |
| `ingress.labels`                       | Custom labels                                                                                 | `{}`                            |
| `ingress.path`                         | Ingress path                                                                                  | `/`                             |
| `ingress.hosts`                        | Ingress accepted hostnames                                                                    | `chart-example.local`           |
| `ingress.tls`                          | Ingress TLS configuration                                                                     | `[]`                            |
| `persistence.config.enabled`           | Use persistent volume to store configuration data                                             | `true`                          |
| `persistence.config.size`              | Size of persistent volume claim                                                               | `1Gi`                           |
| `persistence.config.existingClaim`     | Use an existing PVC to persist data                                                           | `nil`                           |
| `persistence.config.storageClass`      | Type of persistent volume claim                                                               | `-`                             |
| `persistence.config.accessMode`        | Persistence access mode                                                                       | `ReadWriteOnce`                 |
| `persistence.config.skipuninstall`     | Do not delete the pvc upon helm uninstall                                                     | `false`                         |
| `persistence.downloads.enabled`        | Use persistent volume to store configuration data                                             | `true`                          |
| `persistence.downloads.size`           | Size of persistent volume claim                                                               | `10Gi`                          |
| `persistence.downloads.existingClaim`  | Use an existing PVC to persist data                                                           | `nil`                           |
| `persistence.downloads.storageClass`   | Type of persistent volume claim                                                               | `-`                             |
| `persistence.downloads.accessMode`     | Persistence access mode                                                                       | `ReadWriteOnce`                 |
| `persistence.downloads.skipuninstall`  | Do not delete the pvc upon helm uninstall                                                     | `false`                         |
| `persistence.extraMounts`              | Array of additional claims to mount                                                           | `[]`                            |
| `resources`                            | CPU/Memory resource requests/limits                                                           | `{}`                            |
| `nodeSelector`                         | Node labels for pod assignment                                                                | `{}`                            |
| `tolerations`                          | Toleration labels for pod assignment                                                          | `[]`                            |
| `affinity`                             | Affinity settings for pod assignment                                                          | `{}`                            |
| `podAnnotations`                       | Key-value pairs to add as pod annotations                                                     | `{}`                            |
| `deploymentAnnotations`                | Key-value pairs to add as pod annotations                                                     | `{}`                            |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
helm install --name my-release \
  --set timezone="America/New York" \
    k8s-at-home/sabnzbd
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
helm install --name my-release -f values.yaml stable/sabnzbd
```

---
**NOTE**

If you get `Error: rendered manifests contain a resource that already exists. Unable to continue with install: existing resource conflict: ...` it may be because you uninstalled the chart with `skipuninstall` enabled, you need to manually delete the pvc or use `existingClaim`.

---

Read through the [values.yaml](https://github.com/k8s-at-home/charts/blob/master/charts/sabnzbd/values.yaml) file. It has several commented out suggested values.
