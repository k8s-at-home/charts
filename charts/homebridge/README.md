# Homebridge

This is a helm chart for [Homebridge](https://homebridge.io) based on [Docker Homebridge](https://github.com/oznu/docker-homebridge).

## TL;DR;

```shell
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm install k8s-at-home/homebridge
```

## Installing the Chart

To install the chart with the release name `my-release`:

```shell
helm install --name my-release k8s-at-home/homebridge
```

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```shell
helm delete my-release --purge
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following tables lists the configurable parameters of the Home Assistant chart and their default values.

| Parameter                                       | Description                                                                                                                       | Default                             |
| ----------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------- |
| `image.repository`                              | Image repository                                                                                                                  | `oznu/homebridge`                   |
| `image.tag`                                     | Image tag. Possible values listed [here](https://hub.docker.com/r/oznu/homebridge/tags).                                          | `3.1.0`                             |
| `image.pullPolicy`                              | Image pull policy                                                                                                                 | `IfNotPresent`                      |
| `image.pullSecrets`                             | Secrets to use when pulling the image                                                                                             | `[]`                                |
| `strategyType`                                  | Specifies the strategy used to replace old Pods by new ones                                                                       | `Recreate`                          |
| `timezone`                                      | Specify the container timezone                                                                                                    | `UTC`                               |
| `puid`                                          | process userID the instance should run as                                                                                         | `1000`                              |
| `pgid`                                          | process groupID the instance should run as                                                                                        | `1000`                              |
| `config.enableUI`                               | Enable the Homebridge UI plugin                                                                                                   | `true`                              |
| `config.plugins`                                | Additional Homebridge plugins to install at container startup                                                                     | `[]`                                |
| `config.additionalPackages`                     | Additional Alpine packages to install at container statup                                                                         | `[]  `                              |
| `probes.liveness.enabled`                       | Use the livenessProbe?                                                                                                            | `true`                              |
| `probes.liveness.initialDelaySeconds`           | Specify liveness `initialDelaySeconds` parameter for the deployment                                                               | `60`                                |
| `probes.liveness.failureThreshold`              | Specify liveness `failureThreshold` parameter for the deployment                                                                  | `5`                                 |
| `probes.liveness.timeoutSeconds`                | Specify liveness `timeoutSeconds` parameter for the deployment                                                                    | `10`                                |
| `probes.readiness.enabled`                      | Use the readinessProbe?                                                                                                           | `true`                              |
| `probes.readiness.initialDelaySeconds`          | Specify readiness `initialDelaySeconds` parameter for the deployment                                                              | `60`                                |
| `probes.readiness.failureThreshold`             | Specify readiness `failureThreshold` parameter for the deployment                                                                 | `5`                                 |
| `probes.readiness.timeoutSeconds`               | Specify readiness `timeoutSeconds` parameter for the deployment                                                                   | `10`                                |
| `probes.startup.enabled`                        | Use the startupProbe? (new in kubernetes 1.16)                                                                                    | `false`                             |
| `probes.startup.failureThreshold`               | Specify startup `failureThreshold` parameter for the deployment                                                                   | `5`                                 |
| `probes.startup.periodSeconds`                  | Specify startup `periodSeconds` parameter for the deployment                                                                      | `10`                                |
| `service.type`                                  | Kubernetes service type for the homebridge GUI                                                                                    | `ClusterIP`                         |
| `service.httpPort`                              | Kubernetes port where the homebridge GUI is exposed                                                                               | `8123`                              |
| `service.annotations`                           | Service annotations for the homebridge GUI                                                                                        | `{}`                                |
| `service.clusterIP`                             | Cluster IP for the homebridge GUI                                                                                                 | ``                                  |
| `service.externalIPs`                           | External IPs for the homebridge GUI                                                                                               | `[]`                                |
| `service.loadBalancerIP`                        | Loadbalancer IP for the homebridge GUI                                                                                            | ``                                  |
| `service.loadBalancerSourceRanges`              | Loadbalancer client IP restriction range for the homebridge GUI                                                                   | `[]`                                |
| `service.externalTrafficPolicy`                 | Loadbalancer externalTrafficPolicy                                                                                                | ``                                  |
| `hostNetwork`                                   | Enable hostNetwork - needed for discovery to work                                                                                 | `false`                             |
| `service.nodePort`                              | nodePort to listen on for the homebridge GUI                                                                                      | ``                                  |
| `ingress.enabled`                               | Enables Ingress                                                                                                                   | `false`                             |
| `ingress.annotations`                           | Ingress annotations                                                                                                               | `{}`                                |
| `ingress.path`                                  | Ingress path                                                                                                                      | `/`                                 |
| `ingress.hosts`                                 | Ingress accepted hostnames                                                                                                        | `chart-example.local`               |
| `ingress.tls`                                   | Ingress TLS configuration                                                                                                         | `[]`                                |
| `persistence.enabled`                           | Use persistent volume to store data                                                                                               | `true`                              |
| `persistence.size`                              | Size of persistent volume claim                                                                                                   | `1Gi`                               |
| `persistence.existingClaim`                     | Use an existing PVC to persist data                                                                                               | `nil`                               |
| `persistence.storageClass`                      | Type of persistent volume claim                                                                                                   | `-`                                 |
| `persistence.accessMode`                        | Persistence access modes                                                                                                          | `ReadWriteMany`                     |
| `persistence.skipuninstall`                     | Do not delete the pvc upon helm uninstall                                                                                         | `false`                             |
| `extraEnvs`                                     | Extra ENV vars to pass to the homebridge container                                                                                | `[]`                                |
| `resources`                                     | CPU/Memory resource requests/limits or the homebridge GUI                                                                         | `{}`                                |
| `nodeSelector`                                  | Node labels for pod assignment or the homebridge GUI                                                                              | `{}`                                |
| `tolerations`                                   | Toleration labels for pod assignment or the homebridge GUI                                                                        | `[]`                                |
| `affinity`                                      | Affinity settings for pod assignment or the homebridge GUI                                                                        | `{}`                                |
| `podAnnotations`                                | Key-value pairs to add as pod annotations                                                                                         | `{}`                                |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```shell
helm install --name my-release \
  --set timezone="UTC" \
    k8s-at-home/homebridge
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```shell
helm install --name my-release -f values.yaml k8s-at-home/homebridge
```

Read through the [values.yaml](values.yaml) file. It has several commented out suggested values.
