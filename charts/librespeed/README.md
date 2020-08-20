# Librespeed

HTML5 based speedtest with password protected history

**This chart is not maintained by the Librespeed project and any issues with the chart should be raised [here](https://github.com/billimek/billimek-charts/issues/new)**

## TL;DR;

```shell
helm repo add billimek https://billimek.com/billimek-charts/
helm install billimek/librespeed
```

## Introduction

This code is adopted from the [Linuxserver Librespeed docker image](https://hub.docker.com/r/linuxserver/librespeed) which runs the [Librespeed application](https://github.com/librespeed/speedtest)

## Installing the Chart

To install the chart with the release name `my-release`:

```shell
helm install --name my-release billimek/librespeed
```
## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```shell
helm delete my-release --purge
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following tables lists the configurable parameters of the Librespeed chart and their default values.

| Parameter                          | Description                                                              | Default                   |
|:---------------------------------- |:-----------------------------------------------------------------------  |:------------------------- |
| `image.repository`                 | Librespeed image                                                         | `linuxserver/librespeed`  |
| `image.tag`                        | Librespeed image tag                                                     | `5.2-ls25`                |
| `image.pullPolicy`                 | Librespeed image pull policy                                             | `IfNotPresent`            |
| `strategyType`                     | Specifies the strategy used to replace old Pods by new ones              | `Recreate`                |
| `livenessProbePath`                | Default livenessProbe path                                               | `/`                       |
| `readinessProbePath`               | Default readinessProbe path                                              | `/`                       |
| `timezone`                         | Default timezone                                                         | `UTC`                     |
| `puid`                             | Default UID                                                              | `1000`                    |
| `pgid`                             | Default GID                                                              | `1000`                    |
| `telemetry`                        | Enable/Disable history                                                   | `false`                   |
| `title`                            | Title of your speedtest                                                  | `LibreSpeed`              |
| `idObfuscation`                    | Test IDs are obfuscated, avoids exposing database internal sequential IDs| `false`                   |
| `redactIPAddresses`                | IP addresses/hostnames are redacted from the collected telemetry         | `false`                   |
| `email`                            | Email address for GDPR requests. Must be specified when telemetry=true   | `fake@fake.com            |
| `distance`                         | how the distance from the server is measured. Options `km`, `mi`, or ``  | `km`                        |
| `service.type`                     | Kubernetes service type for the GUI                                      | `ClusterIP`               |
| `service.port`                     | Kubernetes port where the GUI is exposed                                 | `1880`                    |
| `service.nodePort`                 | Kubernetes nodePort where the GUI is exposed                             | ``                        |
| `service.annotations`              | Service annotations for the GUI                                          | `{}`                      |
| `service.labels`                   | Custom labels                                                            | `{}`                      |
| `service.loadBalancerIP`           | Loadbalance IP for the GUI                                               | `{}`                      |
| `service.loadBalancerSourceRanges` | List of IP CIDRs allowed access to load balancer (if supported)          | None                      |
| `service.externalTrafficPolicy`    | Set the externalTrafficPolicy in the Service to either Cluster or Local  | `Cluster`                 |
| `ingress.enabled`                  | Enables Ingress                                                          | `false`                   |
| `ingress.annotations`              | Ingress annotations                                                      | `{}`                      |
| `ingress.path`                     | Ingress path                                                             | `/`                       |
| `ingress.hosts`                    | Ingress accepted hostnames                                               | `chart-example.local`     |
| `ingress.tls`                      | Ingress TLS configuration                                                | `[]`                      |
| `persistence.enabled`              | Use persistent volume to store data                                      | `false`                   |
| `persistence.size`                 | Size of persistent volume claim                                          | `5Gi`                     |
| `persistence.existingClaim`        | Use an existing PVC to persist data                                      | `nil`                     |
| `persistence.storageClass`         | Type of persistent volume claim                                          | `-`                       |
| `persistence.accessModes`          | Persistence access modes                                                 | `ReadWriteOnce`           |
| `persistence.subPath`              | Mount a sub dir of the persistent volume                                 | `nil`                     |
| `resources`                        | CPU/Memory resource requests/limits                                      | `{}`                      |
| `nodeSelector`                     | Node labels for pod assignment                                           | `{}`                      |
| `tolerations`                      | Toleration labels for pod assignment                                     | `[]`                      |
| `affinity`                         | Affinity settings for pod assignment                                     | `{}`                      |
| `podAnnotations`                   | Key-value pairs to add as pod annotations                                | `{}`                      |
| `deploymentAnnotations`            | Key-value pairs to add as deployment annotations                         | `{}`                      |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```shell
helm install --name my-release \
  --set config.timezone="America/New_York" \
    billimek/librespeed
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```shell
helm install --name my-release -f values.yaml billimek/librespeed
```

Read through the [values.yaml](values.yaml) file. It has several commented out suggested values.
