# ESPHome

This is a helm chart for [ESPHome](https://esphome.io)

## TL;DR;

```shell
helm repo add billimek https://billimek.com/billimek-charts/
helm install billimek/esphome
```

## Introduction

This code is adapted for [the official esphome docker image](https://hub.docker.com/r/esphome/esphome/)

## Installing the Chart

To install the chart with the release name `my-release`:

```shell
helm install --name my-release billimek/esphome
```
## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```shell
helm delete my-release --purge
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following tables lists the configurable parameters of the ESPHome chart and their default values.

| Parameter                  | Description                         | Default                                                 |
|----------------------------|-------------------------------------|---------------------------------------------------------|
| `image.repository`         | Image repository | `esphome/esphome` |
| `image.tag`                | Image tag. Possible values listed [here](https://hub.docker.com/r/esphome/esphome/tags/).| `0.14.5`|
| `image.pullPolicy`         | Image pull policy | `IfNotPresent` |
| `image.pullSecrets`        | Secrets to use when pulling the image | `[]` |
| `strategyType`             | Specifies the strategy used to replace old Pods by new ones | `Recreate` |
| `probes.liveness.enabled`  | Use the livenessProbe?  | `true` |
| `probes.liveness.scheme `  | Specify liveness `scheme` parameter for the deployment  | `HTTP` |
| `probes.liveness.initialDelaySeconds`  | Specify liveness `initialDelaySeconds` parameter for the deployment  | `60` |
| `probes.liveness.failureThreshold`     | Specify liveness `failureThreshold` parameter for the deployment     | `5`  |
| `probes.liveness.timeoutSeconds`       | Specify liveness `timeoutSeconds` parameter for the deployment       | `10` |
| `probes.readiness.enabled`  | Use the readinessProbe?  | `true` |
| `probes.readiness.scheme `  | Specify readiness `scheme` parameter for the deployment  | `HTTP` |
| `probes.readiness.initialDelaySeconds` | Specify readiness `initialDelaySeconds` parameter for the deployment | `60` |
| `probes.readiness.failureThreshold`    | Specify readiness `failureThreshold` parameter for the deployment    | `5`  |
| `probes.readiness.timeoutSeconds`      | Specify readiness `timeoutSeconds` parameter for the deployment      | `10` |
| `probes.startup.enabled`  | Use the startupProbe? (new in kubernetes 1.16)  | `false` |
| `probes.startup.scheme `  | Specify startup `scheme` parameter for the deployment  | `HTTP` |
| `probes.startup.failureThreshold`    | Specify startup `failureThreshold` parameter for the deployment    | `5`  |
| `probes.startup.periodSeconds`      | Specify startup `periodSeconds` parameter for the deployment      | `10` |
| `service.type`             | Kubernetes service type for the esphome GUI | `ClusterIP` |
| `service.port`             | Kubernetes port where the esphome GUI is exposed| `6052` |
| `service.portName`         | Kubernetes port name where the esphome GUI is exposed | `api` |
| `service.additionalPorts`  | Add additional ports exposed by the esphome container integrations. Example homematic needs to expose a proxy port | `{}` |
| `service.annotations`      | Service annotations for the esphome GUI | `{}` |
| `service.clusterIP`   | Cluster IP for the esphom GUI | `` |
| `service.externalIPs`   | External IPs for the esphome GUI | `[]` |
| `service.loadBalancerIP`   | Loadbalancer IP for the esphome GUI | `` |
| `service.loadBalancerSourceRanges`   | Loadbalancer client IP restriction range for the esphome GUI | `[]` |
| `service.publishNotReadyAddresses`   | Set to true if the notReadyAddresses should be published | `false` |
| `service.externalTrafficPolicy`   | Loadbalancer externalTrafficPolicy | `` |
| `hostNetwork`              | Enable hostNetwork - might be needed for discovery to work | `false` |
| `service.nodePort`   | nodePort to listen on for the esphome GUI | `` |
| `ingress.enabled`              | Enables Ingress | `false` |
| `ingress.annotations`          | Ingress annotations | `{}` |
| `ingress.path`                 | Ingress path | `/` |
| `ingress.hosts`                | Ingress accepted hostnames | `chart-example.local` |
| `ingress.tls`                  | Ingress TLS configuration | `[]` |
| `persistence.enabled`      | Use persistent volume to store data | `true` |
| `persistence.size`         | Size of persistent volume claim | `5Gi` |
| `persistence.existingClaim`| Use an existing PVC to persist data | `nil` |
| `persistence.hostPath`| The path to the config directory on the host, instead of a PVC | `nil` |
| `persistence.storageClass` | Type of persistent volume claim | `-` |
| `persistence.accessMode`  | Persistence access modes | `ReadWriteMany` |
| `hostMounts`        | Array of host directories to mount; can be used for devices | [] |
| `hostMounts.name`   | Name of the volume | `nil` |
| `hostMounts.hostPath` | The path on the host machine | `nil` |
| `hostMounts.mountPath` | The path at which to mount (optional; assumed same as hostPath) | `nil` |
| `hostMounts.type` | The type to mount (optional, i.e., `Directory`) | `nil` |
| `extraEnv`          | Extra ENV vars to pass to the esphome container | `{}` |
| `extraEnvSecrets`   | Extra env vars to pass to the esphome container from k8s secrets - see `values.yaml` for an example | `{}` |
| `resources`                | CPU/Memory resource requests/limits or the esphome GUI | `{}` |
| `nodeSelector`             | Node labels for pod assignment or the esphome GUI | `{}` |
| `tolerations`              | Toleration labels for pod assignment or the esphome GUI | `[]` |
| `affinity`                 | Affinity settings for pod assignment or the esphome GUI | `{}` |
| `podAnnotations`            | Key-value pairs to add as pod annotations  | `{}` |
| `extraVolumes`            | Any extra volumes to define for the pod  | `{}` |
| `extraVolumeMounts`       | Any extra volumes mounts to define for each container of the pod  | `{}` |



Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```shell
helm install --name my-release \
  --set image.tag=latest \
    billimek/esphome
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```shell
helm install --name my-release -f values.yaml billimek/esphome
```

Read through the [values.yaml](values.yaml) file. It has several commented out suggested values.
