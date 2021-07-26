# unifi

![Version: 2.0.5](https://img.shields.io/badge/Version-2.0.5-informational?style=flat-square) ![AppVersion: 6.2.25](https://img.shields.io/badge/AppVersion-6.2.25-informational?style=flat-square)

Ubiquiti Network's Unifi Controller

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/jacobalberty/unifi-docker>

## Requirements

## Dependencies

| Repository | Name | Version |
|------------|------|---------|

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install unifi k8s-at-home/unifi
```

## Installing the Chart

To install the chart with the release name `unifi`

```console
helm install unifi k8s-at-home/unifi
```

## Uninstalling the Chart

To uninstall the `unifi` deployment

```console
helm uninstall unifi
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install unifi \
  --set env.TZ="America/New York" \
    k8s-at-home/unifi
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install unifi k8s-at-home/unifi -f values.yaml
```

## Custom configuration

### Regarding the services

- `guiService`: Represents the main web UI and is what one would normally point
  the ingress to.
- `captivePortalService`: This service is used to allow the captive portal webpage
  to be accessible. It needs to be reachable by the clients connecting to your guest
  network.
- `controllerService`: This is needed in order for the unifi devices to talk to
  the controller and must be otherwise exposed to the network where the unifi
  devices run. If you run this as a `NodePort` (the default setting), make sure
  that there is an external load balancer that is directing traffic from port
  8080 to the `NodePort` for this service.
- `discoveryService`: This needs to be reachable by the unifi devices on the
  network similar to the controller `Service` but only during the discovery
  phase. This is a UDP service.
- `stunService`: Also used periodically by the unifi devices to communicate
  with the controller using UDP. See [this article][ubnt 3] and [this other
  article][ubnt 4] for more information.
- `syslogService`: Used to capture syslog from Unifi devices if the feature is
  enabled in the site configuration. This needs to be reachable by Unifi devices
  on port 5514/UDP.
- `speedtestService`: Used for mobile speedtest inside the UniFi Mobile app.
  This needs to be reachable by clients connecting to port 6789/TCP.

### Ingress and HTTPS

Unifi does [not support HTTP][unifi] so if you wish to use the guiService, you
need to ensure that you use a backend transport of HTTPS.

An example entry in `values.yaml` to achieve this is as follows:

```
ingress:
  enabled: true
  annotations:
    nginx.ingress.kubernetes.io/backend-protocol: "HTTPS"
```

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| GID | int | `999` |  |
| UID | int | `999` |  |
| affinity | object | `{}` |  |
| captivePortalService.annotations | object | `{}` | Provide any additional annotations which may be required. This can be used to set the LoadBalancer service type to internal only. ref: https://kubernetes.io/docs/concepts/services-networking/service/#internal-load-balancer |
| captivePortalService.enabled | bool | `false` |  |
| captivePortalService.externalTrafficPolicy | string | `nil` | Set the externalTrafficPolicy in the Service to either Cluster or Local |
| captivePortalService.http | int | `8880` | Kubernetes port where the http service is exposed |
| captivePortalService.https | int | `8843` | Kubernetes port where the https service is exposed |
| captivePortalService.ingress | object | `{"annotations":{},"enabled":false,"hosts":["chart-example.local"],"path":"/","tls":[]}` | Ingress settings |
| captivePortalService.labels | object | `{}` |  |
| captivePortalService.loadBalancerIP | string | `nil` | Use loadBalancerIP to request a specific static IP, otherwise leave blank |
| captivePortalService.loadBalancerSourceRanges | list | `nil` | loadBalancerSourceRanges |
| captivePortalService.type | string | `"ClusterIP"` | Kubernetes service type |
| controllerService.annotations | object | `{}` | Provide any additional annotations which may be required. This can be used to set the LoadBalancer service type to internal only. ref: https://kubernetes.io/docs/concepts/services-networking/service/#internal-load-balancer |
| controllerService.externalTrafficPolicy | string | `nil` | Set the externalTrafficPolicy in the Service to either Cluster or Local |
| controllerService.ingress | object | `{"annotations":{},"enabled":false,"hosts":["chart-example.local"],"path":"/","tls":[]}` | Ingress settings |
| controllerService.labels | object | `{}` |  |
| controllerService.loadBalancerIP | string | `nil` | Use loadBalancerIP to request a specific static IP, otherwise leave blank |
| controllerService.loadBalancerSourceRanges | list | `nil` | loadBalancerSourceRanges |
| controllerService.port | int | `8080` | Kubernetes port where the service is exposed |
| controllerService.type | string | `"NodePort"` | Kubernetes service type |
| customCert | object | `{"certName":"tls.crt","enabled":false,"isChain":false,"keyName":"tls.key"}` | If you provide your own custom certificate in <unifi-data>/cert you can define the following parameters to configure the controller |
| deploymentAnnotations | object | `{}` |  |
| discoveryService.annotations | object | `{}` | Provide any additional annotations which may be required. This can be used to set the LoadBalancer service type to internal only. ref: https://kubernetes.io/docs/concepts/services-networking/service/#internal-load-balancer |
| discoveryService.externalTrafficPolicy | string | `nil` | Set the externalTrafficPolicy in the Service to either Cluster or Local |
| discoveryService.labels | object | `{}` |  |
| discoveryService.loadBalancerIP | string | `nil` | Use loadBalancerIP to request a specific static IP, otherwise leave blank |
| discoveryService.loadBalancerSourceRanges | list | `nil` | loadBalancerSourceRanges |
| discoveryService.port | int | `10001` | Kubernetes port where the service is exposed |
| discoveryService.type | string | `"NodePort"` | Kubernetes service type |
| extraConfigFiles | object | `{}` |  |
| extraEnvVars | list | `[]` |  |
| extraJvmOpts | list | `[]` |  |
| extraVolumeMounts | list | `[]` |  |
| extraVolumes | list | `[]` |  |
| guiService.annotations | object | `{}` | Provide any additional annotations which may be required. This can be used to set the LoadBalancer service type to internal only. ref: https://kubernetes.io/docs/concepts/services-networking/service/#internal-load-balancer |
| guiService.externalTrafficPolicy | string | `nil` | Set the externalTrafficPolicy in the Service to either Cluster or Local |
| guiService.labels | object | `{}` |  |
| guiService.loadBalancerIP | string | `nil` | Use loadBalancerIP to request a specific static IP, otherwise leave blank |
| guiService.loadBalancerSourceRanges | list | `nil` | loadBalancerSourceRanges |
| guiService.nodePort | int | `nil` | Specify the nodePort value for the LoadBalancer and NodePort service types. ref: https://kubernetes.io/docs/concepts/services-networking/service/#type-nodeport |
| guiService.port | int | `8443` | Kubernetes port where the service is exposed |
| guiService.type | string | `"ClusterIP"` | Kubernetes service type |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"jacobalberty/unifi"` |  |
| image.tag | string | `"6.2.25"` |  |
| ingress | object | `{"annotations":{},"enabled":false,"hosts":["chart-example.local"],"path":"/","tls":[]}` | Ingress settings |
| jvmInitHeapSize | string | `nil` | Java Virtual Machine (JVM) initial, and minimum, heap size Unset value means there is no lower limit |
| jvmMaxHeapSize | string | `"1024M"` | Java Virtual Machine (JVM) maximum heap size For larger installations a larger value is recommended. For memory constrained system this value can be lowered. |
| livenessProbe | object | `{"enabled":true,"failureThreshold":3,"initialDelaySeconds":30,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":1}` | Liveness probe values Ref: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle/#container-probes |
| logging | object | `{"promtail":{"enabled":false,"image":{"pullPolicy":"IfNotPresent","repository":"grafana/promtail","tag":"1.6.0"},"loki":{"url":"http://loki.logs.svc.cluster.local:3100/loki/api/v1/push"}}}` | If you provider your own custom env vars  value: value -- Logging configuration |
| mongodb | object | `{"databaseName":"unifi","dbUri":"mongodb://mongo/unifi","enabled":false,"statDbUri":"mongodb://mongo/unifi_stat"}` | define an external mongoDB instead of using the built-in mongodb |
| nodeSelector | object | `{}` |  |
| persistence.accessMode | string | `"ReadWriteOnce"` | Persistence access modes |
| persistence.enabled | bool | `false` | Use persistent volume to store data |
| persistence.existingClaim | string | `nil` | Use an existing PVC to persist data |
| persistence.hostPath | string | `nil` | Use hostPath and not volume |
| persistence.size | string | `"5Gi"` | Size of persistent volume claim |
| persistence.skipuninstall | bool | `false` | Do not delete the pvc upon helm uninstall |
| persistence.storageClass | string | `nil` | Type of persistent volume claim |
| podAnnotations | object | `{}` |  |
| readinessProbe | object | `{"enabled":true,"failureThreshold":3,"initialDelaySeconds":15,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":1}` | Readiness probe values Ref: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle/#container-probes |
| resources | object | `{}` |  |
| runAsRoot | bool | `false` |  |
| speedtestService.annotations | object | `{}` | Provide any additional annotations which may be required. This can be used to set the LoadBalancer service type to internal only. ref: https://kubernetes.io/docs/concepts/services-networking/service/#internal-load-balancer |
| speedtestService.externalTrafficPolicy | string | `nil` | Set the externalTrafficPolicy in the Service to either Cluster or Local |
| speedtestService.labels | object | `{}` |  |
| speedtestService.loadBalancerIP | string | `nil` | Use loadBalancerIP to request a specific static IP, otherwise leave blank |
| speedtestService.loadBalancerSourceRanges | list | `nil` | loadBalancerSourceRanges |
| speedtestService.port | int | `6789` | Kubernetes port where the service is exposed |
| speedtestService.type | string | `"ClusterIP"` | Kubernetes service type |
| strategyType | string | `"Recreate"` | upgrade strategy type (e.g. Recreate or RollingUpdate) |
| stunService.annotations | object | `{}` | Provide any additional annotations which may be required. This can be used to set the LoadBalancer service type to internal only. ref: https://kubernetes.io/docs/concepts/services-networking/service/#internal-load-balancer |
| stunService.externalTrafficPolicy | string | `nil` | Set the externalTrafficPolicy in the Service to either Cluster or Local |
| stunService.labels | object | `{}` |  |
| stunService.loadBalancerIP | string | `nil` | Use loadBalancerIP to request a specific static IP, otherwise leave blank |
| stunService.loadBalancerSourceRanges | list | `nil` | loadBalancerSourceRanges |
| stunService.port | int | `3478` | Kubernetes port where the service is exposed |
| stunService.type | string | `"NodePort"` | Kubernetes service type |
| syslogService.annotations | object | `{}` | Provide any additional annotations which may be required. This can be used to set the LoadBalancer service type to internal only. ref: https://kubernetes.io/docs/concepts/services-networking/service/#internal-load-balancer |
| syslogService.enabled | bool | `false` |  |
| syslogService.externalTrafficPolicy | string | `nil` | Set the externalTrafficPolicy in the Service to either Cluster or Local |
| syslogService.labels | object | `{}` |  |
| syslogService.loadBalancerIP | string | `nil` | Use loadBalancerIP to request a specific static IP, otherwise leave blank |
| syslogService.loadBalancerSourceRanges | list | `nil` | loadBalancerSourceRanges |
| syslogService.port | int | `5514` | Kubernetes port where the service is exposed |
| syslogService.type | string | `"NodePort"` | Kubernetes service type |
| timezone | string | `"UTC"` |  |
| tolerations | list | `[]` |  |
| unifiedService.annotations | object | `{}` | Provide any additional annotations which may be required. This can be used to set the LoadBalancer service type to internal only. ref: https://kubernetes.io/docs/concepts/services-networking/service/#internal-load-balancer |
| unifiedService.enabled | bool | `false` |  |
| unifiedService.externalTrafficPolicy | string | `nil` | Set the externalTrafficPolicy in the Service to either Cluster or Local |
| unifiedService.labels | object | `{}` |  |
| unifiedService.loadBalancerIP | string | `nil` | Use loadBalancerIP to request a specific static IP, otherwise leave blank |
| unifiedService.loadBalancerSourceRanges | list | `nil` | loadBalancerSourceRanges |
| unifiedService.nodePort | int | `nil` | Specify the nodePort value for the LoadBalancer and NodePort service types. ref: https://kubernetes.io/docs/concepts/services-networking/service/#type-nodeport |
| unifiedService.type | string | `"ClusterIP"` | Kubernetes service type |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [2.0.5]

#### Added

- Add ExtraEnvVars for unifi controller pod
- Add HosPath support for unifi controller pod

#### Changed

- N/A

#### Removed

- N/A

### [2.0.4]

#### Added

- N/A

#### Changed

- Bump controller version to 6.2.25

#### Removed

- N/A

### [2.0.2]

#### Fixed

- Separate syslog service is only created when enabled and unifiedService is disabled.

### [2.0.1]

#### Added

- N/A

#### Changed

- Updated icon url

#### Removed

- N/A

### [1.5.3]

#### Added

- N/A

#### Changed

- Use helm-docs

#### Removed

- N/A

[2.0.2]: #2.0.2
[2.0.1]: #2.0.1
[1.5.3]: #1.5.3

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
