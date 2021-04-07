# bitwardenrs

![Version: 2.1.3](https://img.shields.io/badge/Version-2.1.3-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.18.0](https://img.shields.io/badge/AppVersion-1.18.0-informational?style=flat-square)

Unofficial Bitwarden compatible server written in Rust

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/dani-garcia/bitwarden_rs>

## Requirements

## Dependencies

| Repository | Name | Version |
|------------|------|---------|

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install bitwardenrs k8s-at-home/bitwardenrs
```

## Installing the Chart

To install the chart with the release name `bitwardenrs`

```console
helm install bitwardenrs k8s-at-home/bitwardenrs
```

## Uninstalling the Chart

To uninstall the `bitwardenrs` deployment

```console
helm uninstall bitwardenrs
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install bitwardenrs \
  --set env.TZ="America/New York" \
    k8s-at-home/bitwardenrs
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install bitwardenrs k8s-at-home/bitwardenrs -f values.yaml
```

### Ldap-Sync

Via [vividboarder/bitwarden_rs_ldap](https://github.com/ViViDboarder/bitwarden_rs_ldap) it is possible to fetch your user base from an ldap server of your choosing. If ldapSync.enabled is true you will get the opportunity to use an ldap server which could assist with inviting users.

With the ldapSync.extraContainers and ldapSync.extraVolumes values you're able to customize the ldap-sync pod.

For example with environments that require a secure connection to an LDAP server you can add a VPN container, which enables the sync container to communicate over a VPN.

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| bitwardenrs.admin.disableAdminToken | bool | `false` |  |
| bitwardenrs.admin.enabled | bool | `true` |  |
| bitwardenrs.admin.existingSecret.enabled | bool | `false` |  |
| bitwardenrs.admin.existingSecret.name | string | `""` |  |
| bitwardenrs.admin.existingSecret.tokenKey | string | `""` |  |
| bitwardenrs.domain | string | `""` |  |
| bitwardenrs.externalDatabase.database | string | `""` |  |
| bitwardenrs.externalDatabase.enabled | bool | `false` |  |
| bitwardenrs.externalDatabase.existingSecret.enabled | bool | `false` |  |
| bitwardenrs.externalDatabase.existingSecret.name | string | `""` |  |
| bitwardenrs.externalDatabase.existingSecret.passwordKey | string | `""` |  |
| bitwardenrs.externalDatabase.existingSecret.userKey | string | `""` |  |
| bitwardenrs.externalDatabase.host | string | `""` |  |
| bitwardenrs.externalDatabase.password | string | `""` |  |
| bitwardenrs.externalDatabase.port | string | `""` |  |
| bitwardenrs.externalDatabase.type | string | `""` |  |
| bitwardenrs.externalDatabase.user | string | `""` |  |
| bitwardenrs.gui.port | int | `80` |  |
| bitwardenrs.signupsAllowed | bool | `false` |  |
| bitwardenrs.smtp.enabled | bool | `false` |  |
| bitwardenrs.smtp.existingSecret.enabled | bool | `false` |  |
| bitwardenrs.smtp.existingSecret.name | string | `""` |  |
| bitwardenrs.smtp.existingSecret.passwordKey | string | `""` |  |
| bitwardenrs.smtp.existingSecret.userKey | string | `""` |  |
| bitwardenrs.smtp.from | string | `""` |  |
| bitwardenrs.smtp.fromName | string | `""` |  |
| bitwardenrs.smtp.host | string | `""` |  |
| bitwardenrs.smtp.password | string | `""` |  |
| bitwardenrs.smtp.port | int | `587` |  |
| bitwardenrs.smtp.ssl | bool | `true` |  |
| bitwardenrs.smtp.user | string | `""` |  |
| bitwardenrs.websockets.enabled | bool | `true` |  |
| bitwardenrs.websockets.port | int | `3012` |  |
| bitwardenrs.yubico.clientId | string | `""` |  |
| bitwardenrs.yubico.enabled | bool | `false` |  |
| bitwardenrs.yubico.existingSecret.clientIdKey | string | `""` |  |
| bitwardenrs.yubico.existingSecret.enabled | bool | `false` |  |
| bitwardenrs.yubico.existingSecret.name | string | `""` |  |
| bitwardenrs.yubico.existingSecret.secretKeyKey | string | `""` |  |
| bitwardenrs.yubico.secretKey | string | `""` |  |
| bitwardenrs.yubico.server | string | `""` |  |
| env | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"bitwardenrs/server"` |  |
| image.tag | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths | list | `[]` |  |
| ingress.tls | list | `[]` |  |
| ldapSync.configToml | string | `"bitwarden_url = \"http://bitwarden:80\"\nbitwarden_admin_token = \"admin\"\nldap_host = \"ldap\"\nldap_bind_dn = \"cn=admin,dc=example,dc=org\"\nldap_bind_password = \"admin\"\nldap_search_base_dn = \"dc=example,dc=org\"\nldap_search_filter = \"(&(objectClass=*)(uid=*))\"\nldap_sync_interval_seconds = 10"` |  |
| ldapSync.enabled | bool | `false` |  |
| ldapSync.existingSecret | string | `""` |  |
| ldapSync.extraContainers | list | `[]` |  |
| ldapSync.extraVolumes | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| persistence.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.enabled | bool | `false` |  |
| persistence.size | string | `"1Gi"` |  |
| persistence.type | string | `"statefulset"` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.additionalSpec | object | `{}` |  |
| service.annotations | object | `{}` |  |
| service.labels | object | `{}` |  |
| service.port | int | `80` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| tolerations | list | `[]` |  |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [2.0.1]

#### Added

- external database support
  * No actions required to continue with the default sqlite backend.
  * Refer to the `bitwardenrs.externalDatabase` section of [values.yaml](https://github.com/k8s-at-home/charts/blob/master/charts/bitwardenrs/values.yaml) to configure MySQL or PostgreSQL database backends.

#### Changed

- Use helm-docs

#### Removed

- N/A

[2.1.3]: #2.1.3

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)