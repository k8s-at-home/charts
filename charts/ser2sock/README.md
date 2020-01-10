# ser2sock: Serial to Socket Redirector

This is a helm chart for [ser2sock](https://github.com/nutechsoftware/ser2sock)

## TL;DR;

```shell
$ helm repo add billimek https://billimek.com/billimek-charts/
$ helm install billimek/ser2sock
```

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install --name my-release billimek/ser2sock
```

**IMPORTANT NOTE:** the USB device must be accessible on the node where this pod runs, in order for this chart to function properly.

A way to achieve this can be with nodeAffinity rules, for example:

```yaml
affinity:
  nodeAffinity:
    requiredDuringSchedulingIgnoredDuringExecution:
      nodeSelectorTerms:
      - matchExpressions:
        - key: usb
          operator: In
          values:
          - alarmdecoder
```

... where a node with an attached Coral USB device is labeled with `usb: alarmdecoder`

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
| `image.repository`         | Image repository | `tenstartups/ser2sock` |
| `image.tag`                | Image tag. Possible values listed [here](https://hub.docker.com/r/tenstartups/ser2sock/tags).| `latest`|
| `image.pullPolicy`         | Image pull policy | `IfNotPresent` |
| `strategyType`             | Specifies the strategy used to replace old Pods by new ones | `Recreate` |
| `timezone`                 | Timezone the ser2sock instance should run as, e.g. 'America/New_York' | `` |
| `device`             | USB Device to use | `/dev/ttyUSB0` |
| `puid`             | UID to run as | `1001` |
| `pgid`             | GID to run as | `1001` |
| `Service.type`          | Kubernetes service type for the ser2sock GUI | `ClusterIP` |
| `Service.port`          | Kubernetes port where the ser2sock GUI is exposed| `5000` |
| `Service.annotations`   | Service annotations for the ser2sock GUI | `{}` |
| `Service.labels`        | Custom labels | `{}` |
| `Service.loadBalancerIP` | Loadbalance IP for the ser2sock GUI | `{}` |
| `Service.loadBalancerSourceRanges` | List of IP CIDRs allowed access to load balancer (if supported)      | None
| `resources`                | CPU/Memory resource requests/limits | `{}` |
| `nodeSelector`             | Node labels for pod assignment | `{}` |
| `tolerations`              | Toleration labels for pod assignment | `[]` |
| `affinity`                 | Affinity settings for pod assignment | `{}` |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
helm install --name my-release \
    billimek/ser2sock
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
helm install --name my-release -f values.yaml billimek/ser2sock
```

Read through the [values.yaml](https://github.com/billimek/billimek-charts/blob/master/charts/ser2sock/values.yaml) file. It has several commented out suggested values.
