# bazarr subtitle download client

This is a helm chart for [bazarr](https://github.com/morpheus65535/bazarr) leveraging the [Linuxserver.io image](https://hub.docker.com/r/linuxserver/bazarr)

## TL;DR;

```shell
$ helm repo add billimek https://billimek.com/billimek-charts/
$ helm install billimek/bazarr
```

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install --name my-release billimek/bazarr
```

## Upgrading

Version 1.0.0 used separate PVCs for TV and Movies. In order to keep this chart inline
with changes to charts for Sonarr, etc. this was changed.

This chart now uses a single PVC for all media. This means all of your media must be in, or be subdirectories of, a single media directory. If upgrading from v1 of the chart, do the following:

1. [Uninstall](#uninstalling-the-chart) your current release
2. On your backing store, organize your media, ie. media/tv, media/movies
3. If using a pre-existing PVC, create a single new PVC for all of your media
4. Refer to the [configuration](#configuration) for updates to the chart values
5. Re-install the chart
6. Update your settings in the app to point to the new PVC, which is mounted at /media. These can be found at: `Settings -> Path Mappings For TV Shows` and `Settings -> Path Mappings for Movies`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
helm delete my-release --purge
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following tables lists the configurable parameters of the Sentry chart and their default values.

| Parameter                              | Description                                                                                  | Default               |
| -------------------------------------- | -------------------------------------------------------------------------------------------- | --------------------- |
| `image.repository`                     | Image repository                                                                             | `linuxserver/bazarr`  |
| `image.tag`                            | Image tag. Possible values listed [here](https://hub.docker.com/r/linuxserver/bazarr/tags/). | `v0.8.4.2-ls72`       |
| `image.pullPolicy`                     | Image pull policy                                                                            | `IfNotPresent`        |
| `strategyType`                         | Specifies the strategy used to replace old Pods by new ones                                  | `Recreate`            |
| `timezone`                             | Timezone the bazarr instance should run as, e.g. 'America/New_York'                          | `UTC`                 |
| `puid`                                 | process userID the bazarr instance should run as                                             | `1001`                |
| `pgid`                                 | process groupID the bazarr instance should run as                                            | `1001`                |
| `probes.liveness.initialDelaySeconds`  | Specify liveness `initialDelaySeconds` parameter for the deployment                          | `60`                  |
| `probes.liveness.failureThreshold`     | Specify liveness `failureThreshold` parameter for the deployment                             | `5`                   |
| `probes.liveness.timeoutSeconds`       | Specify liveness `timeoutSeconds` parameter for the deployment                               | `10`                  |
| `probes.readiness.initialDelaySeconds` | Specify readiness `initialDelaySeconds` parameter for the deployment                         | `60`                  |
| `probes.readiness.failureThreshold`    | Specify readiness `failureThreshold` parameter for the deployment                            | `5`                   |
| `probes.readiness.timeoutSeconds`      | Specify readiness `timeoutSeconds` parameter for the deployment                              | `10`                  |
| `Service.type`                         | Kubernetes service type for the bazarr GUI                                                   | `ClusterIP`           |
| `Service.port`                         | Kubernetes port where the bazarr GUI is exposed                                              | `6767`                |
| `Service.annotations`                  | Service annotations for the bazarr GUI                                                       | `{}`                  |
| `Service.labels`                       | Custom labels                                                                                | `{}`                  |
| `Service.loadBalancerIP`               | Loadbalance IP for the bazarr GUI                                                            | `{}`                  |
| `Service.loadBalancerSourceRanges`     | List of IP CIDRs allowed access to load balancer (if supported)                              | None                  |
| `ingress.enabled`                      | Enables Ingress                                                                              | `false`               |
| `ingress.annotations`                  | Ingress annotations                                                                          | `{}`                  |
| `ingress.labels`                       | Custom labels                                                                                | `{}`                  |
| `ingress.path`                         | Ingress path                                                                                 | `/`                   |
| `ingress.hosts`                        | Ingress accepted hostnames                                                                   | `chart-example.local` |
| `ingress.tls`                          | Ingress TLS configuration                                                                    | `[]`                  |
| `persistence.config.enabled`           | Use persistent volume to store configuration data                                            | `true`                |
| `persistence.config.size`              | Size of persistent volume claim                                                              | `1Gi`                 |
| `persistence.config.existingClaim`     | Use an existing PVC to persist data                                                          | `nil`                 |
| `persistence.config.storageClass`      | Type of persistent volume claim                                                              | `-`                   |
| `persistence.config.accessMode`        | Persistence access mode                                                                      | `ReadWriteOnce`       |
| `persistence.config.skipuninstall`     | Do not delete the pvc upon helm uninstall                                                    | `false`               |
| `persistence.media.enabled`            | Use persistent volume to store media data                                                    | `true`                |
| `persistence.media.size`               | Size of persistent volume claim                                                              | `10Gi`                |
| `persistence.media.existingClaim`      | Use an existing PVC to persist data                                                          | `nil`                 |
| `persistence.media.storageClass`       | Type of persistent volume claim                                                              | `-`                   |
| `persistence.media.accessMode`         | Persistence access mode                                                                      | `ReadWriteOnce`       |
| `persistence.media.skipuninstall`      | Do not delete the pvc upon helm uninstall                                                    | `false`               |
| `persistence.extraExistingClaimMounts`      | Optionally add multiple existing claims                                                      | `[]`                                           |
| `resources`                            | CPU/Memory resource requests/limits                                                          | `{}`                  |
| `nodeSelector`                         | Node labels for pod assignment                                                               | `{}`                  |
| `tolerations`                          | Toleration labels for pod assignment                                                         | `[]`                  |
| `affinity`                             | Affinity settings for pod assignment                                                         | `{}`                  |
| `podAnnotations`                       | Key-value pairs to add as pod annotations                                                    | `{}`                  |
| `deploymentAnnotations`                | Key-value pairs to add as deployment annotations                                             | `{}`                  |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
helm install --name my-release \
  --set timezone="America/New York" \
    billimek/bazarr
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
helm install --name my-release -f values.yaml stable/bazarr
```

---

**NOTE**

If you get `Error: rendered manifests contain a resource that already exists. Unable to continue with install: existing resource conflict: ...` it may be because you uninstalled the chart with `skipuninstall` enabled, you need to manually delete the pvc or use `existingClaim`.

---

Read through the [values.yaml](https://github.com/billimek/billimek-charts/blob/master/charts/bazarr/values.yaml) file. It has several commented out suggested values.
