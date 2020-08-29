# radarr movie download client

This is a helm chart for [radarr](https://github.com/Radarr/Radarr/) leveraging the [Linuxserver.io image](https://hub.docker.com/r/linuxserver/radarr/)

## TL;DR;

```shell
$ helm repo add k8s-at-home https://k8s-at-home.com/charts/
$ helm install k8s-at-home/radarr
```

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install --name my-release k8s-at-home/radarr
```

## Upgrading

Chart versions 3.2.0 and earlier used separate PVCs for Downloads and Movies. This presented an issue where Radarr would be unable to hard-link files between the /downloads and /movies directories when importing media. This is caused because each PVC is exposed to the pod as a separate filesystem. This resulted in Radarr copying files rather than linking; using additional storage without the user's knowledge.

This chart now uses a single PVC for Downloads and Movies. This means all of your media (and downloads) must be in, or be subdirectories of, a single directory. If upgrading from v1 of the chart, do the following:

1. [Uninstall](#uninstalling-the-chart) your current release
2. On your backing store, organize your media, ie. media/movies, media/downloads
3. If using a pre-existing PVC, create a single new PVC for all of your media
4. Refer to the [configuration](#configuration) for updates to the chart values
5. Re-install the chart
6. Update your settings in the app to point to the new PVC, which is mounted at /media. This can be done using Radarr's `Movie Editor` under the `Movies` tab. Simply select all movies in your library, and use the editor to change the `Root Folder` and hit save.

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
helm delete my-release --purge
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following tables lists the configurable parameters of the Sentry chart and their default values.

| Parameter                                   | Description                                                                                  | Default                                        |
| ------------------------------------------- | -------------------------------------------------------------------------------------------- | ---------------------------------------------- |
| `image.repository`                          | Image repository                                                                             | `linuxserver/radarr`                           |
| `image.tag`                                 | Image tag. Possible values listed [here](https://hub.docker.com/r/linuxserver/radarr/tags/). | `v0.2.0.1480-ls58`                             |
| `image.pullPolicy`                          | Image pull policy                                                                            | `IfNotPresent`                                 |
| `strategyType`                              | Specifies the strategy used to replace old Pods by new ones                                  | `Recreate`                                     |
| `timezone`                                  | Timezone the instance should run as, e.g. 'America/New_York'                                 | `UTC`                                          |
| `puid`                                      | process userID the instance should run as                                                    | `1001`                                         |
| `pgid`                                      | process groupID the instance should run as                                                   | `1001`                                         |
| `exportarr.enabled`                         | Enable Prometheus monitoring with [Exportarr](https://github.com/onedr0p/exportarr)          | `false`                                        |
| `exportarr.image.repository`                | Exportarr image repository                                                                   | `onedr0p/exportarr`                            |
| `exportarr.image.tag`                       | Exportarr image tag                                                                          | `v0.3.0`                                       |
| `exportarr.image.pullPolicy`                | Exportarr image pullPolicy                                                                   | `IfNotPresent`                                 |
| `exportarr.port`                            | Prometheus scrape port                                                                       | `9708`                                         |
| `exportarr.url`                             | Radarr's URL                                                                                 | `http://radarr.default.svc.cluster.local:7878` |
| `exportarr.apikey`                          | Radarr's API Key                                                                             |                                                |
| `exportarr.serviceMonitor.enabled`          | Enable Prometheus Operator ServiceMonitor monitoring                                         | `false`                                        |
| `exportarr.serviceMonitor.namespace`        | Define namespace where to deploy the ServiceMonitor resource                                 | (namespace where you are deploying)            |
| `exportarr.serviceMonitor.path`             | Prometheus scrape path                                                                       | `/metrics`                                     |
| `exportarr.serviceMonitor.interval`         | Prometheus scrape interval                                                                   | `4m`                                           |
| `exportarr.serviceMonitor.scrapeTimeout`    | Prometheus scrape timeout                                                                    | `90s`                                          |
| `exportarr.serviceMonitor.additionalLabels` | Add custom labels to ServiceMonitor                                                          | `{}`                                           |
| `probes.liveness.initialDelaySeconds`       | Specify liveness `initialDelaySeconds` parameter for the deployment                          | `60`                                           |
| `probes.liveness.failureThreshold`          | Specify liveness `failureThreshold` parameter for the deployment                             | `5`                                            |
| `probes.liveness.timeoutSeconds`            | Specify liveness `timeoutSeconds` parameter for the deployment                               | `10`                                           |
| `probes.readiness.initialDelaySeconds`      | Specify readiness `initialDelaySeconds` parameter for the deployment                         | `60`                                           |
| `probes.readiness.failureThreshold`         | Specify readiness `failureThreshold` parameter for the deployment                            | `5`                                            |
| `probes.readiness.timeoutSeconds`           | Specify readiness `timeoutSeconds` parameter for the deployment                              | `10`                                           |
| `service.type`                              | Kubernetes service type for the GUI                                                          | `ClusterIP`                                    |
| `service.port`                              | Kubernetes port where the GUI is exposed                                                     | `7878`                                         |
| `service.annotations`                       | Service annotations for the GUI                                                              | `{}`                                           |
| `service.labels`                            | Custom labels                                                                                | `{}`                                           |
| `service.loadBalancerIP`                    | Loadbalancer IP for the GUI                                                                  | `{}`                                           |
| `service.loadBalancerSourceRanges`          | List of IP CIDRs allowed access to load balancer (if supported)                              | None                                           |
| `ingress.enabled`                           | Enables Ingress                                                                              | `false`                                        |
| `ingress.annotations`                       | Ingress annotations                                                                          | `{}`                                           |
| `ingress.labels`                            | Custom labels                                                                                | `{}`                                           |
| `ingress.path`                              | Ingress path                                                                                 | `/`                                            |
| `ingress.hosts`                             | Ingress accepted hostnames                                                                   | `chart-example.local`                          |
| `ingress.tls`                               | Ingress TLS configuration                                                                    | `[]`                                           |
| `persistence.config.enabled`                | Use persistent volume to store configuration data                                            | `true`                                         |
| `persistence.config.size`                   | Size of persistent volume claim                                                              | `1Gi`                                          |
| `persistence.config.existingClaim`          | Use an existing PVC to persist data                                                          | `nil`                                          |
| `persistence.config.storageClass`           | Type of persistent volume claim                                                              | `-`                                            |
| `persistence.config.subPath`                | Mount a sub directory if set                                                                    | `nil          `                              |
| `persistence.config.accessMode`             | Persistence access mode                                                                      | `ReadWriteOnce`                                |
| `persistence.config.skipuninstall`          | Do not delete the pvc upon helm uninstall                                                    | `false`                                        |
| `persistence.media.enabled`                 | Use persistent volume to store media                                                         | `true`                                         |
| `persistence.media.size`                    | Size of persistent volume claim                                                              | `10Gi`                                         |
| `persistence.media.existingClaim`           | Use an existing PVC to persist data                                                          | `nil`                                          |
| `persistence.media.storageClass`            | Type of persistent volume claim                                                              | `-`                                            |
| `persistence.media.subPath`                 | Mount a sub directory if set                                                                    | `nil          `                              |
| `persistence.media.accessMode`              | Persistence access mode                                                                      | `ReadWriteOnce`                                |
| `persistence.media.skipuninstall`           | Do not delete the pvc upon helm uninstall                                                    | `false`                                        |
| `persistence.extraExistingClaimMounts`      | Optionally add multiple existing claims                                                      | `[]`                                           |
| `resources`                                 | CPU/Memory resource requests/limits                                                          | `{}`                                           |
| `nodeSelector`                              | Node labels for pod assignment                                                               | `{}`                                           |
| `tolerations`                               | Toleration labels for pod assignment                                                         | `[]`                                           |
| `affinity`                                  | Affinity settings for pod assignment                                                         | `{}`                                           |
| `podAnnotations`                            | Key-value pairs to add as pod annotations                                                    | `{}`                                           |
| `deploymentAnnotations`                     | Key-value pairs to add as deployment annotations                                             | `{}`                                           |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
helm install --name my-release \
  --set timezone="America/New York" \
    k8s-at-home/radarr
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
helm install --name my-release -f values.yaml stable/radarr
```

---

**NOTE**

If you get `Error: rendered manifests contain a resource that already exists. Unable to continue with install: existing resource conflict: ...` it may be because you uninstalled the chart with `skipuninstall` enabled, you need to manually delete the pvc or use `existingClaim`.

---

Read through the [values.yaml](https://github.com/k8s-at-home/charts/blob/master/charts/radarr/values.yaml) file. It has several commented out suggested values.
