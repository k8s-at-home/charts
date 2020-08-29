# Heimdall Application Dashboard

This is a helm chart for [heimdall](https://github.com/heimdall/heimdall) leveraging the [Linuxserver.io image](https://hub.docker.com/r/linuxserver/heimdall/)

## TL;DR;

```shell
$ helm repo add k8s-at-home https://k8s-at-home.com/charts/
$ helm install k8s-at-home/heimdall
```

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install my-release k8s-at-home/heimdall
```

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following tables lists the configurable parameters of the Sentry chart and their default values.

| Parameter                  | Description                         | Default                                                 |
|----------------------------|-------------------------------------|---------------------------------------------------------|
| `image.repository`         | Image repository | `linuxserver/heimdall` |
| `image.tag`                | Image tag. Possible values listed [here](https://hub.docker.com/r/linuxserver/heimdall/tags/).| `2.2.2-ls84`|
| `image.pullPolicy`         | Image pull policy | `IfNotPresent` |
| `strategyType`             | Specifies the strategy used to replace old Pods by new ones | `Recreate` |
| `timezone`                 | Timezone the heimdall instance should run as, e.g. 'America/New_York' | `UTC` |
| `puid`                     | process userID the heimdall instance should run as | `1001` |
| `pgid`                     | process groupID the heimdall instance should run as | `1001` |
| `probes.liveness.initialDelaySeconds`  | Specify liveness `initialDelaySeconds` parameter for the deployment  | `60` |
| `probes.liveness.failureThreshold`     | Specify liveness `failureThreshold` parameter for the deployment     | `5`  |
| `probes.liveness.timeoutSeconds`       | Specify liveness `timeoutSeconds` parameter for the deployment       | `10` |
| `probes.readiness.initialDelaySeconds` | Specify readiness `initialDelaySeconds` parameter for the deployment | `60` |
| `probes.readiness.failureThreshold`    | Specify readiness `failureThreshold` parameter for the deployment    | `5`  |
| `probes.readiness.timeoutSeconds`      | Specify readiness `timeoutSeconds` parameter for the deployment      | `10` |
| `Service.type`          | Kubernetes service type for the heimdall GUI | `ClusterIP` |
| `Service.port`          | Kubernetes port where the heimdall GUI is exposed| `80` |
| `Service.annotations`   | Service annotations for the heimdall GUI | `{}` |
| `Service.labels`        | Custom labels | `{}` |
| `Service.loadBalancerIP` | Loadbalance IP for the heimdall GUI | `{}` |
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
| `persistence.config.storageClass` | Type of persistent volume claim | `-` |
| `persistence.config.accessMode`  | Persistence access mode | `ReadWriteOnce` |
| `persistence.config.skipuninstall`  | Do not delete the pvc upon helm uninstall | `false` |
| `persistence.extraExistingClaimMounts`  | Optionally add multiple existing claims | `[]` |
| `resources`                | CPU/Memory resource requests/limits | `{}` |
| `nodeSelector`             | Node labels for pod assignment | `{}` |
| `tolerations`              | Toleration labels for pod assignment | `[]` |
| `affinity`                 | Affinity settings for pod assignment | `{}` |
| `podAnnotations`           | Key-value pairs to add as pod annotations  | `{}` |
| `deploymentAnnotations`           | Key-value pairs to add as deployment annotations  | `{}` |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
helm install my-release \
  --set timezone="America/New York" \
    k8s-at-home/heimdall
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
helm install my-release -f values.yaml k8s-at-home/heimdall
```

---
**NOTE**

If you get `Error: rendered manifests contain a resource that already exists. Unable to continue with install: existing resource conflict: ...` it may be because you uninstalled the chart with `skipuninstall` enabled, you need to manually delete the pvc or use `existingClaim`.

---

Read through the [values.yaml](https://github.com/k8s-at-home/charts/blob/master/charts/heimdall/values.yaml) file. It has several commented out suggested values.
