# Jackett

This is a helm chart for [Jackett](https://github.com/Jackett/Jackett) leveraging the [Linuxserver.io image](https://hub.docker.com/r/linuxserver/jackett/)

## TL;DR;

```shell
$ helm repo add billimek https://billimek.com/billimek-charts/
$ helm install billimek/jackett
```

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install --name my-release billimek/jackett
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
| `image.repository`         | Image repository | `linuxserver/jackett` |
| `image.tag`                | Image tag. Possible values listed [here](https://hub.docker.com/r/linuxserver/jackett/tags/).| `v0.12.1132-ls37`|
| `image.pullPolicy`         | Image pull policy | `IfNotPresent` |
| `strategyType`             | Specifies the strategy used to replace old Pods by new ones | `Recreate` |
| `timezone`                 | Timezone the Jackett instance should run as, e.g. 'America/New_York' | `UTC` |
| `puid`                     | process userID the Jackett instance should run as | `1001` |
| `pgid`                     | process groupID the Jackett instance should run as | `1001` |
| `probes.liveness.failureThreshold`     | Specify liveness `failureThreshold` parameter for the deployment     | `5`  |
| `probes.liveness.periodSeconds`       | Specify liveness `periodSeconds` parameter for the deployment       | `10` |
| `probes.readiness.failureThreshold`    | Specify readiness `failureThreshold` parameter for the deployment    | `5`  |
| `probes.readiness.periodSeconds`      | Specify readiness `periodSeconds` parameter for the deployment      | `10` |
| `probes.startup.initialDelaySeconds`    | Specify startup `initialDelaySeconds` parameter for the deployment    | `5`  |
| `probes.startup.failureThreshold`      | Specify startup `failureThreshold` parameter for the deployment      | `30` |
| `probes.startup.periodSeconds`      | Specify startup `periodSeconds` parameter for the deployment      | `10` |
| `Service.type`          | Kubernetes service type for the Jackett GUI | `ClusterIP` |
| `Service.port`          | Kubernetes port where the Jackett GUI is exposed| `9117` |
| `Service.annotations`   | Service annotations for the Jackett GUI | `{}` |
| `Service.labels`        | Custom labels | `{}` |
| `Service.loadBalancerIP` | Loadbalance IP for the Jackett GUI | `{}` |
| `Service.loadBalancerSourceRanges` | List of IP CIDRs allowed access to load balancer (if supported)      | None
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
| `persistence.torrentblackhole.enabled`      | Use persistent volume to store torrent files | `false` |
| `persistence.torrentblackhole.size`         | Size of persistent volume claim | `1Gi` |
| `persistence.torrentblackhole.existingClaim`| Use an existing PVC to persist data | `nil` |
| `persistence.torrentblackhole.subPath`  | Mount a sub directory of the persistent volume if set | `""` |
| `persistence.torrentblackhole.storageClass` | Type of persistent volume claim | `-` |
| `persistence.torrentblackhole.accessMode`  | Persistence access mode | `ReadWriteOnce` |
| `persistence.torrentblackhole.skipuninstall`  | Do not delete the pvc upon helm uninstall | `false` |
| `persistence.extraExistingClaimMounts`  | Optionally add multiple existing claims | `[]` |
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
    billimek/jackett
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
helm install --name my-release -f values.yaml billimek/jackett
```

---
**NOTE**

If you get `Error: rendered manifests contain a resource that already exists. Unable to continue with install: existing resource conflict: ...` it may be because you uninstalled the chart with `skipuninstall` enabled, you need to manually delete the pvc or use `existingClaim`.

---

Read through the [values.yaml](https://github.com/billimek/billimek-charts/blob/master/charts/jackett/values.yaml) file. It has several commented out suggested values.
