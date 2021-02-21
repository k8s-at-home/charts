# unifi

![Version: 1.5.1](https://img.shields.io/badge/Version-1.5.1-informational?style=flat-square) ![AppVersion: 5.14.23](https://img.shields.io/badge/AppVersion-5.14.23-informational?style=flat-square)

Ubiquiti Network's Unifi Controller

**Homepage:** <https://github.com/k8s-at-home/charts/tree/master/charts/unifi>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| billimek | jeff@billimek.com |  |
| mcronce | mike@quadra-tec.net |  |

## Source Code

* <https://github.com/jacobalberty/unifi-docker>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| GID | int | `999` |  |
| UID | int | `999` |  |
| affinity | object | `{}` |  |
| captivePortalService.annotations | object | `{}` |  |
| captivePortalService.enabled | bool | `false` |  |
| captivePortalService.http | int | `8880` |  |
| captivePortalService.https | int | `8843` |  |
| captivePortalService.ingress.annotations | object | `{}` |  |
| captivePortalService.ingress.enabled | bool | `false` |  |
| captivePortalService.ingress.hosts[0] | string | `"chart-example.local"` |  |
| captivePortalService.ingress.path | string | `"/"` |  |
| captivePortalService.ingress.tls | list | `[]` |  |
| captivePortalService.labels | object | `{}` |  |
| captivePortalService.loadBalancerIP | string | `nil` |  |
| captivePortalService.type | string | `"ClusterIP"` |  |
| controllerService.annotations | object | `{}` |  |
| controllerService.ingress.annotations | object | `{}` |  |
| controllerService.ingress.enabled | bool | `false` |  |
| controllerService.ingress.hosts[0] | string | `"chart-example.local"` |  |
| controllerService.ingress.path | string | `"/"` |  |
| controllerService.ingress.tls | list | `[]` |  |
| controllerService.labels | object | `{}` |  |
| controllerService.loadBalancerIP | string | `nil` |  |
| controllerService.port | int | `8080` |  |
| controllerService.type | string | `"NodePort"` |  |
| customCert.certName | string | `"tls.crt"` |  |
| customCert.enabled | bool | `false` |  |
| customCert.isChain | bool | `false` |  |
| customCert.keyName | string | `"tls.key"` |  |
| deploymentAnnotations | object | `{}` |  |
| discoveryService.annotations | object | `{}` |  |
| discoveryService.labels | object | `{}` |  |
| discoveryService.loadBalancerIP | string | `nil` |  |
| discoveryService.port | int | `10001` |  |
| discoveryService.type | string | `"NodePort"` |  |
| extraConfigFiles | object | `{}` |  |
| extraJvmOpts | list | `[]` |  |
| extraVolumeMounts | list | `[]` |  |
| extraVolumes | list | `[]` |  |
| guiService.annotations | object | `{}` |  |
| guiService.labels | object | `{}` |  |
| guiService.loadBalancerIP | string | `nil` |  |
| guiService.port | int | `8443` |  |
| guiService.type | string | `"ClusterIP"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"jacobalberty/unifi"` |  |
| image.tag | string | `"5.14.23"` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0] | string | `"chart-example.local"` |  |
| ingress.path | string | `"/"` |  |
| ingress.tls | list | `[]` |  |
| jvmInitHeapSize | string | `nil` |  |
| jvmMaxHeapSize | string | `"1024M"` |  |
| livenessProbe.enabled | bool | `true` |  |
| livenessProbe.failureThreshold | int | `3` |  |
| livenessProbe.initialDelaySeconds | int | `30` |  |
| livenessProbe.periodSeconds | int | `10` |  |
| livenessProbe.successThreshold | int | `1` |  |
| livenessProbe.timeoutSeconds | int | `1` |  |
| logging.promtail.enabled | bool | `false` |  |
| logging.promtail.image.pullPolicy | string | `"IfNotPresent"` |  |
| logging.promtail.image.repository | string | `"grafana/promtail"` |  |
| logging.promtail.image.tag | string | `"1.6.0"` |  |
| logging.promtail.loki.url | string | `"http://loki.logs.svc.cluster.local:3100/loki/api/v1/push"` |  |
| mongodb.databaseName | string | `"unifi"` |  |
| mongodb.dbUri | string | `"mongodb://mongo/unifi"` |  |
| mongodb.enabled | bool | `false` |  |
| mongodb.statDbUri | string | `"mongodb://mongo/unifi_stat"` |  |
| nodeSelector | object | `{}` |  |
| persistence.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.enabled | bool | `true` |  |
| persistence.size | string | `"5Gi"` |  |
| podAnnotations | object | `{}` |  |
| readinessProbe.enabled | bool | `true` |  |
| readinessProbe.failureThreshold | int | `3` |  |
| readinessProbe.initialDelaySeconds | int | `15` |  |
| readinessProbe.periodSeconds | int | `10` |  |
| readinessProbe.successThreshold | int | `1` |  |
| readinessProbe.timeoutSeconds | int | `1` |  |
| resources | object | `{}` |  |
| runAsRoot | bool | `false` |  |
| speedtestService.annotations | object | `{}` |  |
| speedtestService.labels | object | `{}` |  |
| speedtestService.loadBalancerIP | string | `nil` |  |
| speedtestService.port | int | `6789` |  |
| speedtestService.type | string | `"ClusterIP"` |  |
| strategyType | string | `"Recreate"` |  |
| stunService.annotations | object | `{}` |  |
| stunService.labels | object | `{}` |  |
| stunService.loadBalancerIP | string | `nil` |  |
| stunService.port | int | `3478` |  |
| stunService.type | string | `"NodePort"` |  |
| syslogService.annotations | object | `{}` |  |
| syslogService.labels | object | `{}` |  |
| syslogService.loadBalancerIP | string | `nil` |  |
| syslogService.port | int | `5514` |  |
| syslogService.type | string | `"NodePort"` |  |
| timezone | string | `"UTC"` |  |
| tolerations | list | `[]` |  |
| unifiedService.annotations | object | `{}` |  |
| unifiedService.enabled | bool | `false` |  |
| unifiedService.labels | object | `{}` |  |
| unifiedService.loadBalancerIP | string | `nil` |  |
| unifiedService.type | string | `"ClusterIP"` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
