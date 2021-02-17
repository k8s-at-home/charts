# plex

![Version: 2.3.0](https://img.shields.io/badge/Version-2.3.0-informational?style=flat-square) ![AppVersion: 1.20.2.3402](https://img.shields.io/badge/AppVersion-1.20.2.3402-informational?style=flat-square)

Plex Media Server

**Homepage:** <https://plex.tv/>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| billimek | jeff@billimek.com |  |

## Source Code

* <https://github.com/k8s-at-home/charts/tree/master/charts/plex>
* <https://hub.docker.com/r/plexinc/pms-docker/>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| certificate.pkcsMangler.certificateSecret.crtName | string | `"tls.crt"` |  |
| certificate.pkcsMangler.certificateSecret.keyName | string | `"tls.key"` |  |
| certificate.pkcsMangler.certificateSecret.name | string | `""` |  |
| certificate.pkcsMangler.certificateSecret.volume.mountPath | string | `"/etc/plex-certs"` |  |
| certificate.pkcsMangler.certificateSecret.volume.name | string | `"plex-certs"` |  |
| certificate.pkcsMangler.configmap.annotations | object | `{}` |  |
| certificate.pkcsMangler.configmap.labels | object | `{}` |  |
| certificate.pkcsMangler.configmap.name | string | `"42-pkcs-mangler"` |  |
| certificate.pkcsMangler.enabled | bool | `false` |  |
| certificate.pkcsMangler.image.repository | string | `"tlsprint/openssl"` |  |
| certificate.pkcsMangler.image.tag | string | `"1.1.1f"` |  |
| certificate.pkcsMangler.pfxInContainerPath | string | `"/config/plex.pfx"` |  |
| certificate.pkcsMangler.pfxPassword.annotations | object | `{}` |  |
| certificate.pkcsMangler.pfxPassword.labels | object | `{}` |  |
| certificate.pkcsMangler.pfxPassword.passwordKey | string | `"pfx-password"` |  |
| certificate.pkcsMangler.pfxPassword.secretName | string | `"plex-media-server-pfx-password"` |  |
| certificate.pkcsMangler.pfxPassword.value | string | `"setpassword"` |  |
| certificate.pkcsMangler.setPlexPreferences.customCertificateDomain | string | `""` |  |
| certificate.pkcsMangler.setPlexPreferences.enabled | bool | `true` |  |
| certificate.pkcsMangler.volume.defaultMode | int | `493` |  |
| certificate.pkcsMangler.volume.mountPath | string | `"/etc/cont-init.d/42-pkcs-mangler"` |  |
| certificate.pkcsMangler.volume.name | string | `"42-pkcs-mangler"` |  |
| certificate.pkcsMangler.volume.subPath | string | `"42-pkcs-mangler"` |  |
| claimToken | string | `""` |  |
| deploymentAnnotations | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| hostNetwork | bool | `false` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"plexinc/pms-docker"` |  |
| image.tag | string | `"1.20.2.3402-0fec14d92"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0] | string | `"chart-example.local"` |  |
| ingress.path | string | `"/"` |  |
| ingress.tls | list | `[]` |  |
| logging.promtail.enabled | bool | `false` |  |
| logging.promtail.image.pullPolicy | string | `"IfNotPresent"` |  |
| logging.promtail.image.repository | string | `"grafana/promtail"` |  |
| logging.promtail.image.tag | string | `"1.6.0"` |  |
| logging.promtail.loki.url | string | `"http://loki.logs.svc.cluster.local:3100/loki/api/v1/push"` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| persistence.config.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.config.size | string | `"20Gi"` |  |
| persistence.config.storageClass | string | `""` |  |
| persistence.data.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.data.enabled | bool | `true` |  |
| persistence.data.size | string | `"40Gi"` |  |
| persistence.data.storageClass | string | `""` |  |
| persistence.extraData | list | `[]` |  |
| persistence.extraMounts | list | `[]` |  |
| persistence.transcode.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.transcode.emptyDir.medium | string | `""` |  |
| persistence.transcode.enabled | bool | `false` |  |
| persistence.transcode.size | string | `"20Gi"` |  |
| persistence.transcode.storageClass | string | `""` |  |
| plexPreferences.configmap.annotations | object | `{}` |  |
| plexPreferences.configmap.labels | object | `{}` |  |
| plexPreferences.configmap.name | string | `"41-plex-preferences"` |  |
| plexPreferences.enabled | bool | `false` |  |
| plexPreferences.volume.defaultMode | int | `493` |  |
| plexPreferences.volume.mountPath | string | `"/etc/cont-init.d/41-plex-preferences"` |  |
| plexPreferences.volume.name | string | `"41-plex-preferences"` |  |
| plexPreferences.volume.subPath | string | `"41-plex-preferences"` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| probes.liveness.enabled | bool | `true` |  |
| probes.liveness.failureThreshold | int | `5` |  |
| probes.liveness.httpGet.path | string | `"/identity"` |  |
| probes.liveness.httpGet.port | int | `32400` |  |
| probes.liveness.periodSeconds | int | `10` |  |
| probes.readiness.enabled | bool | `true` |  |
| probes.readiness.failureThreshold | int | `5` |  |
| probes.readiness.httpGet.path | string | `"/identity"` |  |
| probes.readiness.httpGet.port | int | `32400` |  |
| probes.readiness.periodSeconds | int | `10` |  |
| probes.startup.enabled | bool | `true` |  |
| probes.startup.failureThreshold | int | `30` |  |
| probes.startup.httpGet.path | string | `"/identity"` |  |
| probes.startup.httpGet.port | int | `32400` |  |
| probes.startup.initialDelaySeconds | int | `5` |  |
| probes.startup.periodSeconds | int | `10` |  |
| proxy.enabled | bool | `false` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| serviceTCP.annotations | object | `{}` |  |
| serviceTCP.labels | object | `{}` |  |
| serviceTCP.loadBalancerIP | string | `nil` |  |
| serviceTCP.port | int | `32400` |  |
| serviceTCP.type | string | `"ClusterIP"` |  |
| serviceUDP.annotations | object | `{}` |  |
| serviceUDP.labels | object | `{}` |  |
| serviceUDP.loadBalancerIP | string | `nil` |  |
| serviceUDP.type | string | `"ClusterIP"` |  |
| strategyType | string | `"Recreate"` |  |
| timezone | string | `"UTC"` |  |
| tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
