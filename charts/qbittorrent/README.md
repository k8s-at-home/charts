# qBittorrent client

This is a helm chart for [qbittorrent](https://qbittorrent.org/) leveraging the [Linuxserver.io image](https://hub.docker.com/r/linuxserver/qbittorrent/)

## TL;DR;

```shell
$ helm repo add billimek https://billimek.com/billimek-charts/
$ helm install billimek/qbittorrent
```

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install --name my-release billimek/qbittorrent
```

The default login details (change ASAP) are:

* login:admin
* password:admin

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
helm delete my-release --purge
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following tables lists the configurable parameters of the Sentry chart and their default values.

| Parameter                  | Description                         | Default                                                 |
|----------------------------|-------------------------------------|---------------------------------------------------------|
| `image.repository`         | Image repository | `linuxserver/qbittorrent` |
| `image.tag`                | Image tag. Possible values listed [here](https://hub.docker.com/r/linuxserver/qbittorrent/tags/).| `14.2.0.99201912180418-6819-118af03ubuntu18.04.1-ls57`|
| `image.pullPolicy`         | Image pull policy | `IfNotPresent` |
| `strategyType`             | Specifies the strategy used to replace old Pods by new ones | `Recreate` |
| `timezone`                 | Timezone the qbittorrent instance should run as, e.g. 'America/New_York' | `UTC` |
| `puid`                     | process userID the qbittorrent instance should run as | `1001` |
| `pgid`                     | process groupID the qbittorrent instance should run as | `1001` |
| `umask`                     | newly created files should be set to this umask value | `022` |
| `probes.liveness.initialDelaySeconds`  | Specify liveness `initialDelaySeconds` parameter for the deployment  | `60` |
| `probes.liveness.failureThreshold`     | Specify liveness `failureThreshold` parameter for the deployment     | `5`  |
| `probes.liveness.timeoutSeconds`       | Specify liveness `timeoutSeconds` parameter for the deployment       | `10` |
| `probes.readiness.initialDelaySeconds` | Specify readiness `initialDelaySeconds` parameter for the deployment | `60` |
| `probes.readiness.failureThreshold`    | Specify readiness `failureThreshold` parameter for the deployment    | `5`  |
| `probes.readiness.timeoutSeconds`      | Specify readiness `timeoutSeconds` parameter for the deployment      | `10` |
| `guiService.type`          | Kubernetes service type for the qbittorrent GUI | `ClusterIP` |
| `guiService.port`          | Kubernetes port where the qbittorrent GUI is exposed| `8080` |
| `guiService.annotations`   | Service annotations for the qbittorrent GUI | `{}` |
| `guiService.labels`        | Custom labels | `{}` |
| `guiService.loadBalancerIP` | Loadbalance IP for the qbittorrent GUI | `{}` |
| `btService.type`          | Kubernetes service type for the qbittorrent listening bittorrent port | `NodePort` |
| `btService.port`          | Kubernetes port where the qbittorrent listening bittorrent port | `6881` |
| `btService.annotations`   | Service annotations for the qbittorrent bittorrent protocol | `{}` |
| `btService.labels`        | Custom labels | `{}` |
| `btService.loadBalancerIP` | Loadbalance IP for the qbittorrent bittorrent protocol | `{}` |
| `ingress.enabled`              | Enables Ingress | `false` |
| `ingress.annotations`          | Ingress annotations | `{}` |
| `ingress.labels`               | Custom labels                       | `{}`
| `ingress.path`                 | Ingress path | `/` |
| `ingress.hosts`                | Ingress accepted hostnames | `chart-example.local` |
| `ingress.tls`                  | Ingress TLS configuration | `[]` |
| `persistence.config.enabled`      | Use persistent volume to store configuration data | `true` |
| `persistence.config.size`         | Size of persistent volume claim | `1Gi` |
| `persistence.config.existingClaim`| Use an existing PVC to persist data | `nil` |
| `persistence.config.subPath`  | Mount a sub directory of the persistent volume if set | `""` |
| `persistence.config.storageClass` | Type of persistent volume claim | `-` |
| `persistence.config.accessMode`  | Persistence access mode | `ReadWriteOnce` |
| `persistence.config.skipuninstall`  | Do not delete the pvc upon helm uninstall | `false` |
| `persistence.downloads.enabled`      | Use persistent volume to store configuration data | `true` |
| `persistence.downloads.size`         | Size of persistent volume claim | `10Gi` |
| `persistence.downloads.existingClaim`| Use an existing PVC to persist data | `nil` |
| `persistence.downloads.subPath`  | Mount a sub directory of the persistent volume if set | `""` |
| `persistence.downloads.storageClass` | Type of persistent volume claim | `-` |
| `persistence.downloads.accessMode`   | Persistence access mode | `ReadWriteOnce` |
| `persistence.downloads.skipuninstall`  | Do not delete the pvc upon helm uninstall | `false` |
| `persistence.extraMounts`            | Array of additional claims to mount | `[]` |
| `resources`                | CPU/Memory resource requests/limits | `{}` |
| `nodeSelector`             | Node labels for pod assignment | `{}` |
| `tolerations`              | Toleration labels for pod assignment | `[]` |
| `affinity`                 | Affinity settings for pod assignment | `{}` |
| `podAnnotations`           | Key-value pairs to add as pod annotations  | `{}` |
| `deploymentAnnotations`    | Key-value pairs to add as deployment annotations  | `{}` |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
helm install --name my-release \
  --set timezone="America/New York" \
    billimek/qbittorrent
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
helm install --name my-release -f values.yaml billimek/qbittorrent
```

---
**NOTE**

If you get `Error: rendered manifests contain a resource that already exists. Unable to continue with install: existing resource conflict: ...` it may be because you uninstalled the chart with `skipuninstall` enabled, you need to manually delete the pvc or use `existingClaim`.

---

Read through the [values.yaml](https://github.com/billimek/billimek-charts/blob/master/charts/qbittorrent/values.yaml) file. It has several commented out suggested values.
