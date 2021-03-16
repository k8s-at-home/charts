# plex

![Version: 2.3.2](https://img.shields.io/badge/Version-2.3.2-informational?style=flat-square) ![AppVersion: 1.20.2.3402](https://img.shields.io/badge/AppVersion-1.20.2.3402-informational?style=flat-square)

Plex Media Server

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/k8s-at-home/charts/tree/master/charts/plex>
* <https://hub.docker.com/r/plexinc/pms-docker/>

## Requirements

## Dependencies

| Repository | Name | Version |
|------------|------|---------|

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install plex k8s-at-home/plex
```

## Installing the Chart

To install the chart with the release name `plex`

```console
helm install plex k8s-at-home/plex
```

## Uninstalling the Chart

To uninstall the `plex` deployment

```console
helm uninstall plex
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install plex \
  --set env.TZ="America/New York" \
    k8s-at-home/plex
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install plex k8s-at-home/plex -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/)

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

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [2.3.1]

#### Added

- N/A

#### Changed

- use helm-docs

#### Removed

- N/A

[2.3.1]: #2.3.1

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)