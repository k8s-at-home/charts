# Deluge BitTorrent client

This is a helm chart for [Deluge](https://deluge-torrent.org/) leveraging the [Linuxserver.io image](https://hub.docker.com/r/linuxserver/deluge/)

## TL;DR;

```shell
$ helm repo add billimek https://billimek.github.io/helm-repo
$ helm install billimek/deluge
```

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install --name my-release billimek/deluge
```

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
| `image.repository`         | Image repository | `linuxserver/nzbget` |
| `image.tag`                | Image tag. Possible values listed [here](https://hub.docker.com/r/linuxserver/nzbget/tags/).| `147`|
| `image.pullPolicy`         | Image pull policy | `IfNotPresent` |
| `timezone`                 | Timezone the deluge instance should run as, e.g. 'America/New_York' | `UTC` |
| `umask`                    | umask for file creation/manipulation - important for shared resources like the downloads persistant storage | `022` |
| `puid`                     | process userID the deluge instance should run as | `1001` |
| `pgid`                     | process groupID the deluge instance should run as | `1001` |
| `guiService.type`          | Kubernetes service type for the Deluge GUI | `ClusterIP` |
| `guiService.port`          | Kubernetes port where the Deluge GUI is exposed| `8112` |
| `guiService.annotations`   | Service annotations for the Deluge GUI | `{}` |
| `guiService.labels`        | Custom labels | `{}` |
| `guiService.loadBalancerIP` | Loadbalance IP for the Deluge GUI | `{}` |
| `guiService.loadBalancerSourceRanges` | List of IP CIDRs allowed access to load balancer (if supported)      | None
| `guiService.externalTrafficPolicy` | Set the externalTrafficPolicy in the Service to either Cluster or Local | `Cluster`
| `daemonService.type`       | Kubernetes service type for the deluge daemon service | `ClusterIP` |
| `daemonService.port`       | Kubernetes port where the deluge daemon service is exposed | `58846` |
| `daemonService.annotations` | Service annotations for the deluge daemon service | `{}` |
| `daemonService.labels`     | Custom labels | `{}` |
| `daemonService.loadBalancerIP` | Loadbalance IP for the deluge daemon service | `{}` |
| `daemonService.loadBalancerSourceRanges` | List of IP CIDRs allowed access to load balancer (if supported)      | None
| `daemonService.externalTrafficPolicy` | Set the externalTrafficPolicy in the Service to either Cluster or Local | `Cluster`
| `btService.type`       | Kubernetes service type for the deluge bittorrent endpoint | `NodePort` |
| `btService.port`       | Kubernetes port where the deluge bittorrent endpoint is exposed | `51414` |
| `btService.annotations` | Service annotations for the deluge bittorrent endpoint | `{}` |
| `btService.labels`     | Custom labels | `{}` |
| `btService.loadBalancerIP` | Loadbalance IP for the deluge bittorrent endpoint | `{}` |
| `btService.loadBalancerSourceRanges` | List of IP CIDRs allowed access to load balancer (if supported)      | None
| `btService.externalTrafficPolicy` | Set the externalTrafficPolicy in the Service to either Cluster or Local | `Cluster`
| `ingress.enabled`              | Enables Ingress | `false` |
| `ingress.annotations`          | Ingress annotations | `{}` |
| `ingress.labels`               | Custom labels                       | `{}`
| `ingress.path`                 | Ingress path | `/` |
| `ingress.hosts`                | Ingress accepted hostnames | `chart-example.local` |
| `ingress.tls`                  | Ingress TLS configuration | `[]` |
| `persistence.config.enabled`      | Use persistent volume to store configuration data | `true` |
| `persistence.config.size`         | Size of persistent volume claim | `1Gi` |
| `persistence.config.existingClaim`| Use an existing PVC to persist data | `nil` |
| `persistence.config.storageClass` | Type of persistent volume claim | `-` |
| `persistence.config.accessMode`  | Persistence access mode | `ReadWriteOnce` |
| `persistence.downloads.enabled`      | Use persistent volume to store configuration data | `true` |
| `persistence.downloads.size`         | Size of persistent volume claim | `10Gi` |
| `persistence.downloads.existingClaim`| Use an existing PVC to persist data | `nil` |
| `persistence.downloads.storageClass` | Type of persistent volume claim | `-` |
| `persistence.downloads.accessMode`  | Persistence access mode | `ReadWriteOnce` |
| `resources`                | CPU/Memory resource requests/limits | `{}` |
| `nodeSelector`             | Node labels for pod assignment | `{}` |
| `tolerations`              | Toleration labels for pod assignment | `[]` |
| `affinity`                 | Affinity settings for pod assignment | `{}` |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
helm install --name my-release \
  --set timezone="America/New York" \
    billimek/deluge
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
helm install --name my-release -f values.yaml stable/deluge
```

Read through the [values.yaml](values.yaml) file. It has several commented out suggested values.

## Regarding the services

* `guiService`: represents the main web UI and is what one would normally point the ingress to
* `daemonService`: This is used to interact with the deluge daemon server from a client other than the embeded UI
* `btService`: This used to listen for external connections from other bittorrent clients and is gernally only useful if exposed to clients outside of the kubernetes cluster