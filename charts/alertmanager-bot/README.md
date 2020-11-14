# alertmanager-bot

This is a helm chart for [alertmanager-bot](https://github.com/metalmatze/alertmanager-bot) leveraging the [official image](https://hub.docker.com/r/metalmatze/alertmanager-bot)

## TL;DR;

```shell
$ helm repo add k8s-at-home https://k8s-at-home.com/charts/
$ helm install k8s-at-home/alertmanager-bot
```

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install my-release k8s-at-home/alertmanager-bot
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
| `image.repository`         | Image repository | `metalmatze/alertmanager-bot` |
| `image.tag`                | Image tag. Possible values listed [here](https://hub.docker.com/r/metalmatze/alertmanager-bot/tags/).| `0.4.2`|
| `image.pullPolicy`         | Image pull policy | `IfNotPresent` |
| `strategyType`             | Specifies the strategy used to replace old Pods by new ones | `Recreate` |
| `Service.type`          | Kubernetes service type for the alertmanager-bot | `ClusterIP` |
| `Service.port`          | Kubernetes port where the alertmanager-bot is exposed| `8200` |
| `Service.annotations`   | Service annotations for the alertmanager-bot | `{}` |
| `Service.labels`        | Custom labels | `{}` |
| `Service.loadBalancerIP` | Loadbalance IP for the alertmanager-bot | `{}` |
| `Service.loadBalancerSourceRanges` | List of IP CIDRs allowed access to load balancer (if supported)      | None
| `ingress.enabled`              | Enables Ingress | `false` |
| `ingress.annotations`          | Ingress annotations | `{}` |
| `ingress.labels`               | Custom labels                       | `{}`
| `ingress.path`                 | Ingress path | `/` |
| `ingress.hosts`                | Ingress accepted hostnames | `chart-example.local` |
| `ingress.tls`                  | Ingress TLS configuration | `[]` |
| `persistence.enabled`                       | Use persistent volume to store configuration data                                            | `true`                                         |
| `persistence.annotations`                   | Key-value pairs to add as persistent volume claim annotations                                | `{}`                                           |
| `persistence.storageClass`                  | Type of persistent volume claim                                                              | `-`                                            |
| `persistence.existingClaim`                 | Use an existing PVC to persist data                                                          | `nil`                                          |
| `persistence.accessMode`                    | Persistence access mode                                                                      | `ReadWriteOnce`                                |
| `persistence.size`                          | Size of persistent volume claim                                                              | `1Gi`                                          |
| `resources`                | CPU/Memory resource requests/limits | `{}` |
| `nodeSelector`             | Node labels for pod assignment | `{}` |
| `tolerations`              | Toleration labels for pod assignment | `[]` |
| `affinity`                 | Affinity settings for pod assignment | `{}` |
| `telegramAdmin`              | The Telegram user id for the admin | None |
| `telegramToken`                 | Token you get from @botfather | None |


Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
helm install my-release \
  --set telegramAdmin="1234567" \
  --set telegramToken="XXX" \
    k8s-at-home/alertmanager-bot
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
helm install my-release -f values.yaml k8s-at-home/alertmanager-bot
```

---
**NOTE**

The bot will only reply to messages sent from an admin. All other messages are dropped and logged on the bot's console. Your user id you can get from @userinfobot.

---

Read through the [values.yaml](https://github.com/k8s-at-home/charts/blob/master/charts/alertmanager-bot/values.yaml) file. It has several commented out suggested values.
