# blocky

![Version: 5.0.1](https://img.shields.io/badge/Version-5.0.1-informational?style=flat-square) ![AppVersion: v0.12](https://img.shields.io/badge/AppVersion-v0.12-informational?style=flat-square)

DNS proxy as ad-blocker for local network

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/0xERR0R/blocky>

## Requirements

## Dependencies

| Repository | Name | Version |
|------------|------|---------|

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install blocky k8s-at-home/blocky
```

## Installing the Chart

To install the chart with the release name `blocky`

```console
helm install blocky k8s-at-home/blocky
```

## Uninstalling the Chart

To uninstall the `blocky` deployment

```console
helm uninstall blocky
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install blocky \
  --set env.TZ="America/New York" \
    k8s-at-home/blocky
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install blocky k8s-at-home/blocky -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| config | string | `"upstream:\n  # these external DNS resolvers will be used. Blocky picks 2 random resolvers from the list for each query\n  # format for resolver: [net:]host:[port][/path]. net could be empty (default, shortcut for tcp+udp), tcp+udp, tcp, udp, tcp-tls or https (DoH). If port is empty, default port will be used (53 for udp and tcp, 853 for tcp-tls, 443 for https (Doh))\n  externalResolvers:\n    - 46.182.19.48\n    - 80.241.218.68\n    - tcp-tls:fdns1.dismail.de:853\n    - https://dns.digitale-gesellschaft.ch/dns-query\n\n# optional: custom IP address for domain name (with all sub-domains)\n# example: query \"printer.lan\" or \"my.printer.lan\" will return 192.168.178.3\ncustomDNS:\n  mapping:\n    printer.lan: 192.168.178.3\n\n# optional: definition, which DNS resolver(s) should be used for queries to the domain (with all sub-domains). Multiple resolvers must be separated by comma\n# Example: Query client.fritz.box will ask DNS server 192.168.178.1. This is necessary for local network, to resolve clients by host name\nconditional:\n  mapping:\n    fritz.box: udp:192.168.178.1\n    lan.net: udp:192.168.178.1,udp:192.168.178.2\n\n# optional: use black and white lists to block queries (for example ads, trackers, adult pages etc.)\nblocking:\n  # definition of blacklist groups. Can be external link (http/https) or local file\n  blackLists:\n    ads:\n      - https://s3.amazonaws.com/lists.disconnect.me/simple_ad.txt\n      - https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts\n      - https://mirror1.malwaredomains.com/files/justdomains\n      - http://sysctl.org/cameleon/hosts\n      - https://zeustracker.abuse.ch/blocklist.php?download=domainblocklist\n      - https://s3.amazonaws.com/lists.disconnect.me/simple_tracking.txt\n    special:\n      - https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews/hosts\n  # definition of whitelist groups. Attention: if the same group has black and whitelists, whitelists will be used to disable particular blacklist entries. If a group has only whitelist entries -> this means only domains from this list are allowed, all other domains will be blocked\n  whiteLists:\n    ads:\n      - whitelist.txt\n  # definition: which groups should be applied for which client\n  clientGroupsBlock:\n    # default will be used, if no special definition for a client name exists\n    default:\n      - ads\n      - special\n    # use client name (with wildcard support: * - sequence of any characters, [0-9] - range)\n    # or single ip address / client subnet as CIDR notation\n    laptop*:\n      - ads\n    192.168.178.1/24:\n      - special\n  # which response will be sent, if query is blocked:\n  # zeroIp: 0.0.0.0 will be returned (default)\n  # nxDomain: return NXDOMAIN as return code\n  # comma separated list of destination IP adresses (for example: 192.100.100.15, 2001:0db8:85a3:08d3:1319:8a2e:0370:7344). Should contain ipv4 and ipv6 to cover all query types. Useful with running web server on this address to display the \"blocked\" page.\n  blockType: zeroIp\n  # optional: automatically list refresh period in minutes. Default: 4h.\n  # Negative value -> deactivate automatically refresh.\n  # 0 value -> use default\n  refreshPeriod: 0\n\n# optional: configuration for caching of DNS responses\ncaching:\n  # amount in minutes, how long a response must be cached (min value).\n  # If <=0, use response's TTL, if >0 use this value, if TTL is smaller\n  # Default: 0\n  minTime: 5\n  # amount in minutes, how long a response must be cached (max value).\n  # If <0, do not cache responses\n  # If 0, use TTL\n  # If > 0, use this value, if TTL is greater\n  # Default: 0\n  maxTime: -1\n  # if true, will preload DNS results for often used queries (names queried more than 5 times in a 2 hour time window)\n  # this improves the response time for often used queries, but significantly increases external traffic\n  # default: false\n  prefetching: true\n\n# optional: configuration of client name resolution\nclientLookup:\n  # optional: this DNS resolver will be used to perform reverse DNS lookup (typically local router)\n  upstream: udp:192.168.178.1\n  # optional: some routers return multiple names for client (host name and user defined name). Define which single name should be used.\n  # Example: take second name if present, if not take first name\n  singleNameOrder:\n    - 2\n    - 1\n  # optional: custom mapping of client name to IP addresses. Useful if reverse DNS does not work properly or just to have custom client names.\n  clients:\n    laptop:\n      - 192.168.178.29\n\n# optional: configuration for prometheus metrics endpoint\n# prometheus:\n#   # enabled if true\n#   enable: true\n#   # url path, optional (default '/metrics')\n#   path: /metrics\n\n# optional: write query information (question, answer, client, duration etc) to daily csv file\n# queryLog:\n#   # directory (should be mounted as volume in docker)\n#   dir: /logs\n#   # if true, write one file per client. Writes all queries to single file otherwise\n#   perClient: true\n#   # if > 0, deletes log files which are older than ... days\n#   logRetentionDays: 7\n\n# optional: DNS listener port and bind ip address, default 53 (UDP and TCP). Example: 53, :53, 127.0.0.1:53\nport: 53\n# optional: HTTP listener port, default 0 = no http listener. If > 0, will be used for prometheus metrics, pprof, REST API, DoH ...\nhttpPort: 4000\n# optional: HTTPS listener port, default 0 = no http listener. If > 0, will be used for prometheus metrics, pprof, REST API, DoH...\n#httpsPort: 443\n# mandatory, if https port > 0: path to cert and key file for SSL encryption\n#httpsCertFile: server.crt\n#httpsKeyFile: server.key\n# optional: use this DNS server to resolve blacklist urls and upstream DNS servers (DOH). Useful if no DNS resolver is configured and blocky needs to resolve a host name. Format net:IP:port, net must be udp or tcp\nbootstrapDns: tcp:1.1.1.1\n# optional: Log level (one from debug, info, warn, error). Default: info\nlogLevel: info\n# optional: Log format (text or json). Default: text\nlogFormat: text\n"` |  |
| extraLists | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"spx01/blocky"` |  |
| image.tag | string | `"v0.12"` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| persistence.enabled | bool | `false` |  |
| persistence.finalizers[0] | string | `"kubernetes.io/pvc-protection"` |  |
| persistence.size | string | `"10Gi"` |  |
| podAnnotations."prometheus.io/port" | string | `"api"` |  |
| podAnnotations."prometheus.io/scrape" | string | `"true"` |  |
| probes.liveness.failureThreshold | int | `5` |  |
| probes.liveness.periodSeconds | int | `10` |  |
| probes.readiness.failureThreshold | int | `5` |  |
| probes.readiness.periodSeconds | int | `10` |  |
| probes.startup.failureThreshold | int | `30` |  |
| probes.startup.initialDelaySeconds | int | `5` |  |
| probes.startup.periodSeconds | int | `10` |  |
| replicas | int | `1` |  |
| resources | object | `{}` |  |
| service.annotations | object | `{}` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceMonitor.additionalLabels | object | `{}` |  |
| serviceMonitor.enabled | bool | `false` |  |
| serviceTCP.annotations | object | `{}` |  |
| serviceTCP.enabled | bool | `false` |  |
| serviceTCP.externalIPs | list | `[]` |  |
| serviceTCP.externalTrafficPolicy | string | `"Local"` |  |
| serviceTCP.loadBalancerIP | string | `""` |  |
| serviceTCP.type | string | `"NodePort"` |  |
| serviceUDP.annotations | object | `{}` |  |
| serviceUDP.enabled | bool | `true` |  |
| serviceUDP.externalIPs | list | `[]` |  |
| serviceUDP.externalTrafficPolicy | string | `"Local"` |  |
| serviceUDP.loadBalancerIP | string | `""` |  |
| serviceUDP.type | string | `"NodePort"` |  |
| timeZone | string | `"UTC"` |  |
| tolerations | list | `[]` |  |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [5.0.1]

#### Added

- N/A

#### Changed

- configuration inside `config` is no longer a yaml object, it is now a multiline string
- moved to helm-docs

#### Removed

- N/A

[5.0.1]: #5.0.1

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)