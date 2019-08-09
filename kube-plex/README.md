# Plex Media Server helm chart

## Configuration

The following tables lists the configurable parameters of the Plex chart and their default values.

| Parameter                  | Description                         | Default                                                 |
|----------------------------|-------------------------------------|---------------------------------------------------------|
| `image.repository`         | Image repository | `plexinc/pms-docker` |
| `image.tag`                | Image tag. Possible values listed [here](https://hub.docker.com/r/plexinc/pms-docker/tags/).| `1.10.1.4602-f54242b6b`|
| `image.pullPolicy`         | Image pull policy | `IfNotPresent` |
| `kubePlex.enabled`         | Enable KubPlex transcoder | `true` |
| `kubePlex.image.repository`         | Image repository | `quay.io/munnerz/kube-plex` |
| `kubePlex.image.tag`                | Image tag. | `latest`|
| `kubePlex.image.pullPolicy`         | Image pull policy | `IfNotPresent` |
| `claimToken`                 | Plex Claim Token to authenticate your acount | `` |
| `timezone`                 | Timezone plex instance should run as, e.g. 'America/New_York' | `Europe/London` |
| `service.type`          | Kubernetes service type for the plex GUI/API | `ClusterIP` |
| `service.port`          | Kubernetes port where the plex GUI/API is exposed| `32400` |
| `service.annotations`   | Service annotations for the Plex GUI | `{}` |
| `service.labels`        | Custom labels | `{}` |
| `service.loadBalancerIP` | Loadbalance IP for the Plex GUI | `{}` |
| `service.loadBalancerSourceRanges` | List of IP CIDRs allowed access to load balancer (if supported)      | None
| `ingress.enabled`              | Enables Ingress | `false` |
| `ingress.annotations`          | Ingress annotations | `{}` |
| `ingress.labels`               | Custom labels                       | `{}`
| `ingress.path`                 | Ingress path | `/` |
| `ingress.hosts`                | Ingress accepted hostnames | `chart-example.local` |
| `ingress.tls`                  | Ingress TLS configuration | `[]` |
| `rbac.create`                  | Create RBAC roles? | `true` |
| `nodeSelector`             | Node labels for pod assignment | `beta.kubernetes.io/arch: amd64` |
| `persistence.transcode.enabled`      | Use persistent volume for transcoding | `false` |
| `persistence.transcode.size`         | Size of persistent volume claim | `20Gi` |
| `persistence.transcode.claimName`| Use an existing PVC to persist data | `nil` |
| `persistence.transcode.subPath` | SubPath to use for existing Claim | `nil` |
| `persistence.transcode.storageClass` | Type of persistent volume claim | `-` |
| `persistence.data.size`         | Size of persistent volume claim | `40Gi` |
| `persistence.data.existingClaim`| Use an existing PVC to persist data | `nil` |
| `persistence.data.subPath` | SubPath to use for existing Claim | `nil` |
| `persistence.data.storageClass` | Type of persistent volume claim | `-` |
| `persistence.config.size`         | Size of persistent volume claim | `20Gi` |
| `persistence.config.existingClaim`| Use an existing PVC to persist data | `nil` |
| `persistence.config.subPath` | SubPath to use for existing Claim | `nil` |
| `persistence.config.storageClass` | Type of persistent volume claim | `-` |
| `resources`                | CPU/Memory resource requests/limits | `{}` |
| `podAnnotations`           | Key-value pairs to add as pod annotations  | `{}` |


Read through the [values.yaml](values.yaml) file. It has several commented out suggested values.
