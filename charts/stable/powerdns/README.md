# powerdns

![Version: 3.3.2](https://img.shields.io/badge/Version-3.3.2-informational?style=flat-square) ![AppVersion: v4.3.1](https://img.shields.io/badge/AppVersion-v4.3.1-informational?style=flat-square)

PowerDNS is a DNS server, written in C++ and licensed under the GPL. It runs on most Unix derivatives. PowerDNS features a large number of different backends ranging from simple BIND style zonefiles to relational databases and load balancing/failover algorithms. A DNS recursor is provided as a separate program.

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <http://www.github.com/PowerDNS/>

## Requirements

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | mariadb | 9.3.19 |
| https://charts.bitnami.com/bitnami | postgresql | 10.5.3 |

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install powerdns k8s-at-home/powerdns
```

## Installing the Chart

To install the chart with the release name `powerdns`

```console
helm install powerdns k8s-at-home/powerdns
```

## Uninstalling the Chart

To uninstall the `powerdns` deployment

```console
helm uninstall powerdns
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install powerdns \
  --set env.TZ="America/New York" \
    k8s-at-home/powerdns
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install powerdns k8s-at-home/powerdns -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"Always"` |  |
| image.repository | string | `"naps/powerdns"` |  |
| image.tag | string | `"4.3.1"` |  |
| imagePullSecrets | list | `[]` |  |
| mariadb.architecture | string | `"standalone"` |  |
| mariadb.auth.database | string | `"pdns"` |  |
| mariadb.auth.password | string | `"pdns-pass"` |  |
| mariadb.auth.rootPassword | string | `"pdnsrootpass"` |  |
| mariadb.auth.username | string | `"pdns"` |  |
| mariadb.enabled | bool | `false` |  |
| mariadb.primary.persistence.enabled | bool | `false` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| postgresql.enabled | bool | `true` |  |
| postgresql.persistence.enabled | bool | `false` |  |
| postgresql.postgresqlDatabase | string | `"pdns"` |  |
| postgresql.postgresqlPassword | string | `"pdnspass"` |  |
| postgresql.postgresqlPostgresPassword | string | `"pdnsadminpass"` |  |
| postgresql.postgresqlUsername | string | `"pdns"` |  |
| powerdns.config | object | `{}` |  |
| powerdns.dnssec | bool | `true` |  |
| powerdns.domain | string | `"mydomain.local"` |  |
| powerdns.mysql.database | string | `"pdns"` |  |
| powerdns.mysql.password | string | `"pdnspass"` |  |
| powerdns.mysql.username | string | `"pdns"` |  |
| powerdns.postgres.database | string | `"pdns"` |  |
| powerdns.postgres.password | string | `"pdnspass"` |  |
| powerdns.postgres.username | string | `"pdns"` |  |
| probes.liveness.enabled | bool | `true` |  |
| probes.liveness.failureThreshold | int | `5` |  |
| probes.liveness.initialDelaySeconds | int | `30` |  |
| probes.liveness.timeoutSeconds | int | `10` |  |
| probes.readiness.enabled | bool | `true` |  |
| probes.readiness.failureThreshold | int | `5` |  |
| probes.readiness.initialDelaySeconds | int | `30` |  |
| probes.readiness.timeoutSeconds | int | `10` |  |
| probes.startup.enabled | bool | `false` |  |
| probes.startup.failureThreshold | int | `30` |  |
| probes.startup.periodSeconds | int | `10` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.externalTrafficPolicy | string | `""` |  |
| service.port | int | `53` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `nil` |  |
| strategyType | string | `"Recreate"` |  |
| tolerations | list | `[]` |  |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [3.3.2]

#### Changed

- Updated changelog

### [3.2.2]

#### Changed

- Updated icon url.

### [1.0.0]

#### Changed

- use helm-docs

[3.3.2]: #332
[3.2.2]: #322
[3.1.1]: #311

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
