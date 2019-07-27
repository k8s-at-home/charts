# frigate: Realtime object detection on RTSP cameras with the Google Coral

This is a helm chart for [frigate](https://github.com/frigate/frigate/) leveraging the [Linuxserver.io image](https://hub.docker.com/r/linuxserver/frigate/)

## TL;DR;

```shell
$ helm repo add billimek https://billimek.com/billimek-charts/
$ helm install billimek/frigate
```

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install --name my-release billimek/frigate
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
| `image.repository`         | Image repository | `blakeblackshear/frigate` |
| `image.tag`                | Image tag. Possible values listed [here](https://hub.docker.com/r/blakeblackshear/frigate/tags/).| `0.2.0-beta`|
| `image.pullPolicy`         | Image pull policy | `IfNotPresent` |
| `strategyType`             | Specifies the strategy used to replace old Pods by new ones | `Recreate` |
| `timezone`                 | Timezone the frigate instance should run as, e.g. 'America/New_York' | `UTC` |
| `rtspPassword`             | Password to use for RTSP cameras | `password` |
| `config`                   | frigate configuration - see [config.yaml](https://github.com/blakeblackshear/frigate/blob/master/config/config.yml) for example  | `{}` |
| `Service.type`          | Kubernetes service type for the frigate GUI | `ClusterIP` |
| `Service.port`          | Kubernetes port where the frigate GUI is exposed| `5000` |
| `Service.annotations`   | Service annotations for the frigate GUI | `{}` |
| `Service.labels`        | Custom labels | `{}` |
| `Service.loadBalancerIP` | Loadbalance IP for the frigate GUI | `{}` |
| `Service.loadBalancerSourceRanges` | List of IP CIDRs allowed access to load balancer (if supported)      | None
| `ingress.enabled`              | Enables Ingress | `false` |
| `ingress.annotations`          | Ingress annotations | `{}` |
| `ingress.labels`               | Custom labels                       | `{}`
| `ingress.path`                 | Ingress path | `/` |
| `ingress.hosts`                | Ingress accepted hostnames | `chart-example.local` |
| `ingress.tls`                  | Ingress TLS configuration | `[]` |
| `resources`                | CPU/Memory resource requests/limits | `{}` |
| `nodeSelector`             | Node labels for pod assignment | `{}` |
| `tolerations`              | Toleration labels for pod assignment | `[]` |
| `affinity`                 | Affinity settings for pod assignment | `{}` |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
helm install --name my-release \
  --set rtspPassword="nosecrets" \
    billimek/frigate
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
helm install --name my-release -f values.yaml stable/frigate
```

Read through the [values.yaml](https://github.com/billimek/billimek-charts/blob/master/frigate/values.yaml) file. It has several commented out suggested values.
