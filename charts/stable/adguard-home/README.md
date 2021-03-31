# adguard-home

![Version: 3.0.0](https://img.shields.io/badge/Version-3.0.0-informational?style=flat-square) ![AppVersion: v0.105.2](https://img.shields.io/badge/AppVersion-v0.105.2-informational?style=flat-square)

DNS proxy as ad-blocker for local network

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/AdguardTeam/AdGuardHome>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://library-charts.k8s-at-home.com | common | 2.1.0 |

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
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

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

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| args[0] | string | `"--no-check-update"` |  |
| config | string | `"bind_host: 0.0.0.0\nbind_port: 3000\nbeta_bind_port: 0\nusers: []\nhttp_proxy: \"\"\nlanguage: en\nrlimit_nofile: 0\ndebug_pprof: false\nweb_session_ttl: 720\ndns:\n  bind_host: 0.0.0.0\n  port: 53\n  statistics_interval: 1\n  querylog_enabled: true\n  querylog_file_enabled: true\n  querylog_interval: 90\n  querylog_size_memory: 1000\n  anonymize_client_ip: false\n  protection_enabled: true\n  blocking_mode: default\n  blocking_ipv4: \"\"\n  blocking_ipv6: \"\"\n  blocked_response_ttl: 10\n  parental_block_host: family-block.dns.adguard.com\n  safebrowsing_block_host: standard-block.dns.adguard.com\n  ratelimit: 0\n  ratelimit_whitelist: []\n  refuse_any: true\n  upstream_dns:\n  - https://dns10.quad9.net/dns-query\n  upstream_dns_file: \"\"\n  bootstrap_dns:\n  - 9.9.9.10\n  - 149.112.112.10\n  - 2620:fe::10\n  - 2620:fe::fe:10\n  all_servers: false\n  fastest_addr: false\n  allowed_clients: []\n  disallowed_clients: []\n  blocked_hosts: []\n  cache_size: 4194304\n  cache_ttl_min: 0\n  cache_ttl_max: 0\n  bogus_nxdomain: []\n  aaaa_disabled: false\n  enable_dnssec: false\n  edns_client_subnet: false\n  max_goroutines: 300\n  ipset: []\n  filtering_enabled: true\n  filters_update_interval: 24\n  parental_enabled: false\n  safesearch_enabled: false\n  safebrowsing_enabled: false\n  safebrowsing_cache_size: 1048576\n  safesearch_cache_size: 1048576\n  parental_cache_size: 1048576\n  cache_time: 30\n  rewrites: []\n  blocked_services: []\n  customresolver: null\ntls:\n  enabled: false\n  server_name: \"\"\n  force_https: false\n  port_https: 443\n  port_dns_over_tls: 853\n  port_dns_over_quic: 784\n  port_dnscrypt: 0\n  dnscrypt_config_file: \"\"\n  allow_unencrypted_doh: false\n  strict_sni_check: false\n  certificate_chain: \"\"\n  private_key: \"\"\n  certificate_path: \"\"\n  private_key_path: \"\"\nfilters:\n- enabled: true\n  url: https://adguardteam.github.io/AdGuardSDNSFilter/Filters/filter.txt\n  name: AdGuard DNS filter\n  id: 1\n- enabled: false\n  url: https://adaway.org/hosts.txt\n  name: AdAway\n  id: 2\n- enabled: false\n  url: https://www.malwaredomainlist.com/hostslist/hosts.txt\n  name: MalwareDomainList.com Hosts List\n  id: 4\nwhitelist_filters: []\nuser_rules: []\ndhcp:\n  enabled: false\n  interface_name: \"\"\n  dhcpv4:\n    gateway_ip: \"\"\n    subnet_mask: \"\"\n    range_start: \"\"\n    range_end: \"\"\n    lease_duration: 86400\n    icmp_timeout_msec: 1000\n    options: []\n  dhcpv6:\n    range_start: \"\"\n    lease_duration: 86400\n    ra_slaac_only: false\n    ra_allow_slaac: false\nclients: []\nlog_compress: false\nlog_localtime: false\nlog_max_backups: 0\nlog_max_size: 100\nlog_max_age: 3\nlog_file: \"\"\nverbose: false\nschema_version: 7\n"` |  |
| env | object | `{}` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"adguard/adguardhome"` |  |
| image.tag | string | `"v0.105.2"` |  |
| persistence.data.emptyDir.enabled | bool | `false` |  |
| persistence.data.enabled | bool | `false` |  |
| persistence.data.mountPath | string | `"/opt/adguardhome/work"` |  |
| prometheus.serviceMonitor.additionalLabels | object | `{}` |  |
| prometheus.serviceMonitor.enabled | bool | `false` |  |
| prometheus.serviceMonitor.interval | string | `"30s"` |  |
| replicas | int | `1` | (int) Number of pods to load balance between |
| service.port.port | int | `3000` |  |
| strategy.type | string | `"Recreate"` |  |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [3.0.0]

#### Added

- N/A

#### Changed

- **BREAKING** Migrate Adguard Home to the common library, a lot of configuration has changed.

#### Removed

- N/A

[3.0.0]: #3.0.0

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
