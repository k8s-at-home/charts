# adguard-home

![Version: 2.2.0](https://img.shields.io/badge/Version-2.2.0-informational?style=flat-square) ![AppVersion: v0.102.0](https://img.shields.io/badge/AppVersion-v0.102.0-informational?style=flat-square)

DNS proxy as ad-blocker for local network

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/AdguardTeam/AdGuardHome>

## Requirements

## Dependencies

| Repository | Name | Version |
|------------|------|---------|

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install adguard-home k8s-at-home/adguard-home
```

## Installing the Chart

To install the chart with the release name `adguard-home`

```console
helm install adguard-home k8s-at-home/adguard-home
```

## Uninstalling the Chart

To uninstall the `adguard-home` deployment

```console
helm uninstall adguard-home
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](../common/values.yaml) from the [common library](../common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install adguard-home \
  --set env.TZ="America/New York" \
    k8s-at-home/adguard-home
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install adguard-home k8s-at-home/adguard-home -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| configAsCode.config.bind_host | string | `"0.0.0.0"` |  |
| configAsCode.config.bind_port | int | `3000` |  |
| configAsCode.config.clients | list | `[]` |  |
| configAsCode.config.debug_pprof | bool | `false` |  |
| configAsCode.config.dhcp.enabled | bool | `false` |  |
| configAsCode.config.dhcp.gateway_ip | string | `""` |  |
| configAsCode.config.dhcp.icmp_timeout_msec | int | `1000` |  |
| configAsCode.config.dhcp.interface_name | string | `""` |  |
| configAsCode.config.dhcp.lease_duration | int | `86400` |  |
| configAsCode.config.dhcp.range_end | string | `""` |  |
| configAsCode.config.dhcp.range_start | string | `""` |  |
| configAsCode.config.dhcp.subnet_mask | string | `""` |  |
| configAsCode.config.dns.aaaa_disabled | bool | `false` |  |
| configAsCode.config.dns.all_servers | bool | `false` |  |
| configAsCode.config.dns.allowed_clients | list | `[]` |  |
| configAsCode.config.dns.anonymize_client_ip | bool | `false` |  |
| configAsCode.config.dns.bind_host | string | `"0.0.0.0"` |  |
| configAsCode.config.dns.blocked_hosts | list | `[]` |  |
| configAsCode.config.dns.blocked_response_ttl | int | `10` |  |
| configAsCode.config.dns.blocked_services | list | `[]` |  |
| configAsCode.config.dns.blocking_ipv4 | string | `""` |  |
| configAsCode.config.dns.blocking_ipv6 | string | `""` |  |
| configAsCode.config.dns.blocking_mode | string | `"default"` |  |
| configAsCode.config.dns.bogus_nxdomain | list | `[]` |  |
| configAsCode.config.dns.bootstrap_dns[0] | string | `"9.9.9.10"` |  |
| configAsCode.config.dns.bootstrap_dns[1] | string | `"149.112.112.10"` |  |
| configAsCode.config.dns.bootstrap_dns[2] | string | `"2620:fe::10"` |  |
| configAsCode.config.dns.bootstrap_dns[3] | string | `"2620:fe::fe:10"` |  |
| configAsCode.config.dns.cache_size | int | `4194304` |  |
| configAsCode.config.dns.cache_time | int | `30` |  |
| configAsCode.config.dns.cache_ttl_max | int | `0` |  |
| configAsCode.config.dns.cache_ttl_min | int | `0` |  |
| configAsCode.config.dns.disallowed_clients | list | `[]` |  |
| configAsCode.config.dns.edns_client_subnet | bool | `false` |  |
| configAsCode.config.dns.enable_dnssec | bool | `false` |  |
| configAsCode.config.dns.fastest_addr | bool | `false` |  |
| configAsCode.config.dns.filtering_enabled | bool | `true` |  |
| configAsCode.config.dns.filters_update_interval | int | `24` |  |
| configAsCode.config.dns.parental_block_host | string | `"family-block.dns.adguard.com"` |  |
| configAsCode.config.dns.parental_cache_size | int | `1048576` |  |
| configAsCode.config.dns.parental_enabled | bool | `false` |  |
| configAsCode.config.dns.port | int | `53` |  |
| configAsCode.config.dns.protection_enabled | bool | `true` |  |
| configAsCode.config.dns.querylog_enabled | bool | `true` |  |
| configAsCode.config.dns.querylog_interval | int | `90` |  |
| configAsCode.config.dns.querylog_size_memory | int | `1000` |  |
| configAsCode.config.dns.ratelimit | int | `0` |  |
| configAsCode.config.dns.ratelimit_whitelist | list | `[]` |  |
| configAsCode.config.dns.refuse_any | bool | `true` |  |
| configAsCode.config.dns.rewrites | list | `[]` |  |
| configAsCode.config.dns.safebrowsing_block_host | string | `"standard-block.dns.adguard.com"` |  |
| configAsCode.config.dns.safebrowsing_cache_size | int | `1048576` |  |
| configAsCode.config.dns.safebrowsing_enabled | bool | `false` |  |
| configAsCode.config.dns.safesearch_cache_size | int | `1048576` |  |
| configAsCode.config.dns.safesearch_enabled | bool | `false` |  |
| configAsCode.config.dns.statistics_interval | int | `1` |  |
| configAsCode.config.dns.upstream_dns[0] | string | `"https://dns10.quad9.net/dns-query"` |  |
| configAsCode.config.filters[0].enabled | bool | `true` |  |
| configAsCode.config.filters[0].id | int | `1` |  |
| configAsCode.config.filters[0].name | string | `"AdGuard DNS filter"` |  |
| configAsCode.config.filters[0].url | string | `"https://adguardteam.github.io/AdGuardSDNSFilter/Filters/filter.txt"` |  |
| configAsCode.config.filters[1].enabled | bool | `false` |  |
| configAsCode.config.filters[1].id | int | `2` |  |
| configAsCode.config.filters[1].name | string | `"AdAway"` |  |
| configAsCode.config.filters[1].url | string | `"https://adaway.org/hosts.txt"` |  |
| configAsCode.config.filters[2].enabled | bool | `false` |  |
| configAsCode.config.filters[2].id | int | `4` |  |
| configAsCode.config.filters[2].name | string | `"MalwareDomainList.com Hosts List"` |  |
| configAsCode.config.filters[2].url | string | `"https://www.malwaredomainlist.com/hostslist/hosts.txt"` |  |
| configAsCode.config.http_proxy | string | `""` |  |
| configAsCode.config.language | string | `"en"` |  |
| configAsCode.config.log_file | string | `""` |  |
| configAsCode.config.rlimit_nofile | int | `0` |  |
| configAsCode.config.schema_version | int | `6` |  |
| configAsCode.config.tls.allow_unencrypted_doh | bool | `false` |  |
| configAsCode.config.tls.certificate_chain | string | `""` |  |
| configAsCode.config.tls.certificate_path | string | `""` |  |
| configAsCode.config.tls.enabled | bool | `false` |  |
| configAsCode.config.tls.force_https | bool | `false` |  |
| configAsCode.config.tls.port_dns_over_tls | int | `853` |  |
| configAsCode.config.tls.port_https | int | `443` |  |
| configAsCode.config.tls.private_key | string | `""` |  |
| configAsCode.config.tls.private_key_path | string | `""` |  |
| configAsCode.config.tls.server_name | string | `""` |  |
| configAsCode.config.tls.strict_sni_check | bool | `false` |  |
| configAsCode.config.user_rules | list | `[]` |  |
| configAsCode.config.users | list | `[]` |  |
| configAsCode.config.verbose | bool | `false` |  |
| configAsCode.config.web_session_ttl | int | `720` |  |
| configAsCode.config.whitelist_filters | list | `[]` |  |
| configAsCode.enabled | bool | `false` |  |
| configAsCode.image.pullPolicy | string | `"Always"` |  |
| configAsCode.image.repository | string | `"busybox"` |  |
| configAsCode.image.tag | string | `"latest"` |  |
| configAsCode.resources | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"adguard/adguardhome"` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0] | string | `"chart-example.local"` |  |
| ingress.path | string | `"/"` |  |
| ingress.tls | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| persistence.config.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.config.enabled | bool | `true` |  |
| persistence.config.size | string | `"20Mi"` |  |
| persistence.config.skipuninstall | bool | `false` |  |
| persistence.work.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.work.enabled | bool | `true` |  |
| persistence.work.size | string | `"10Gi"` |  |
| persistence.work.skipuninstall | bool | `false` |  |
| podAnnotations."prometheus.io/port" | string | `"api"` |  |
| podAnnotations."prometheus.io/scrape" | string | `"true"` |  |
| podSecurityContext | object | `{}` |  |
| probes.liveness.enabled | bool | `true` |  |
| probes.liveness.failureThreshold | int | `5` |  |
| probes.liveness.initialDelaySeconds | int | `5` |  |
| probes.liveness.periodSeconds | int | `10` |  |
| probes.readiness.enabled | bool | `false` |  |
| probes.readiness.failureThreshold | int | `5` |  |
| probes.readiness.initialDelaySeconds | int | `5` |  |
| probes.readiness.periodSeconds | int | `10` |  |
| probes.startup.enabled | bool | `false` |  |
| probes.startup.failureThreshold | int | `30` |  |
| probes.startup.initialDelaySeconds | int | `5` |  |
| probes.startup.periodSeconds | int | `10` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.annotations | object | `{}` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceDHCP.annotations | object | `{}` |  |
| serviceDHCP.enabled | bool | `false` |  |
| serviceDHCP.loadBalancerIP | string | `""` |  |
| serviceDHCP.type | string | `"NodePort"` |  |
| serviceDNSOverTLS.annotations | object | `{}` |  |
| serviceDNSOverTLS.enabled | bool | `false` |  |
| serviceDNSOverTLS.loadBalancerIP | string | `""` |  |
| serviceDNSOverTLS.type | string | `"NodePort"` |  |
| serviceMonitor.additionalLabels | object | `{}` |  |
| serviceMonitor.enabled | bool | `false` |  |
| serviceTCP.annotations | object | `{}` |  |
| serviceTCP.enabled | bool | `false` |  |
| serviceTCP.loadBalancerIP | string | `""` |  |
| serviceTCP.type | string | `"NodePort"` |  |
| serviceUDP.annotations | object | `{}` |  |
| serviceUDP.enabled | bool | `true` |  |
| serviceUDP.loadBalancerIP | string | `""` |  |
| serviceUDP.type | string | `"NodePort"` |  |
| strategyType | string | `"Recreate"` |  |
| timezone | string | `"UTC"` |  |
| tlsSecretName | string | `""` |  |
| tolerations | list | `[]` |  |
| volumePermissions.image.pullPolicy | string | `"Always"` |  |
| volumePermissions.image.repository | string | `"busybox"` |  |
| volumePermissions.image.tag | string | `"latest"` |  |
| volumePermissions.resources | object | `{}` |  |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [2.2.0]

#### Added

- N/A

#### Changed

- Use helm-docs

#### Removed

- N/A

[2.2.0]: #2.2.0

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)