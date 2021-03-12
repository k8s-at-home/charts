# transmission

![Version: 2.0.0](https://img.shields.io/badge/Version-2.0.0-informational?style=flat-square) ![AppVersion: 3.0.0](https://img.shields.io/badge/AppVersion-3.0.0-informational?style=flat-square)

Transmission is a cross-platform BitTorrent client

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://hub.docker.com/r/linuxserver/transmission>
* <https://github.com/k8s-at-home/charts/tree/master/charts/transmission>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://k8s-at-home.com/charts/ | common | 3.0.1 |

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install transmission k8s-at-home/transmission
```

## Installing the Chart

To install the chart with the release name `transmission`

```console
helm install transmission k8s-at-home/transmission
```

## Uninstalling the Chart

To uninstall the `transmission` deployment

```console
helm uninstall transmission
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](../common/values.yaml) from the [common library](../common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install transmission \
  --set env.TZ="America/New York" \
    k8s-at-home/transmission
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install transmission k8s-at-home/transmission -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/charts/tree/master/charts/common/)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env | object | `{}` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"linuxserver/transmission"` |  |
| image.tag | string | `"version-3.00-r2"` |  |
| ingress.enabled | bool | `false` |  |
| persistence.config.emptyDir | bool | `false` |  |
| persistence.config.enabled | bool | `false` |  |
| persistence.config.mountPath | string | `"/config"` |  |
| persistence.downloads.emptyDir | bool | `false` |  |
| persistence.downloads.enabled | bool | `false` |  |
| persistence.downloads.mountPath | string | `"/downloads"` |  |
| persistence.watch.emptyDir | bool | `false` |  |
| persistence.watch.enabled | bool | `false` |  |
| persistence.watch.mountPath | string | `"/watch"` |  |
| probes.liveness.spec.timeoutSeconds | int | `30` |  |
| probes.readiness.spec.timeoutSeconds | int | `30` |  |
| service.additionalServices[0].annotations | object | `{}` |  |
| service.additionalServices[0].enabled | bool | `true` |  |
| service.additionalServices[0].nameSuffix | string | `"utptcp"` |  |
| service.additionalServices[0].port.name | string | `"utptcp"` |  |
| service.additionalServices[0].port.port | int | `51413` |  |
| service.additionalServices[0].port.protocol | string | `"TCP"` |  |
| service.additionalServices[0].port.targetport | int | `51413` |  |
| service.additionalServices[0].type | string | `"ClusterIP"` |  |
| service.additionalServices[1].annotations | object | `{}` |  |
| service.additionalServices[1].enabled | bool | `true` |  |
| service.additionalServices[1].nameSuffix | string | `"utpudp"` |  |
| service.additionalServices[1].port.name | string | `"utpudp"` |  |
| service.additionalServices[1].port.port | int | `51413` |  |
| service.additionalServices[1].port.protocol | string | `"UDP"` |  |
| service.additionalServices[1].port.targetport | int | `51413` |  |
| service.additionalServices[1].type | string | `"ClusterIP"` |  |
| service.port.name | string | `"http"` |  |
| service.port.port | int | `9091` |  |
| strategy.type | string | `"Recreate"` |  |
| transmissionConfig.alt-speed-down | int | `50` |  |
| transmissionConfig.alt-speed-enabled | bool | `false` |  |
| transmissionConfig.alt-speed-time-begin | int | `540` |  |
| transmissionConfig.alt-speed-time-day | int | `127` |  |
| transmissionConfig.alt-speed-time-enabled | bool | `false` |  |
| transmissionConfig.alt-speed-time-end | int | `1020` |  |
| transmissionConfig.alt-speed-up | int | `50` |  |
| transmissionConfig.bind-address-ipv4 | string | `"0.0.0.0"` |  |
| transmissionConfig.bind-address-ipv6 | string | `"::\""` |  |
| transmissionConfig.blocklist-enabled | bool | `true` |  |
| transmissionConfig.blocklist-url | string | `"http://john.bitsurge.net/public/biglist.p2p.gz"` |  |
| transmissionConfig.cache-size-mb | int | `4` |  |
| transmissionConfig.dht-enabled | bool | `true` |  |
| transmissionConfig.download-dir | string | `"/downloads/complete"` |  |
| transmissionConfig.download-queue-enabled | bool | `true` |  |
| transmissionConfig.download-queue-size | int | `5` |  |
| transmissionConfig.encryption | int | `1` |  |
| transmissionConfig.idle-seeding-limit | int | `30` |  |
| transmissionConfig.idle-seeding-limit-enabled | bool | `false` |  |
| transmissionConfig.incomplete-dir | string | `"/downloads/incomplete"` |  |
| transmissionConfig.incomplete-dir-enabled | bool | `true` |  |
| transmissionConfig.lpd-enabled | bool | `false` |  |
| transmissionConfig.message-level | int | `2` |  |
| transmissionConfig.peer-congestion-algorithm | string | `""` |  |
| transmissionConfig.peer-id-ttl-hours | int | `6` |  |
| transmissionConfig.peer-limit-global | int | `200` |  |
| transmissionConfig.peer-limit-per-torrent | int | `50` |  |
| transmissionConfig.peer-port | int | `51413` |  |
| transmissionConfig.peer-port-random-high | int | `65535` |  |
| transmissionConfig.peer-port-random-low | int | `49152` |  |
| transmissionConfig.peer-port-random-on-start | bool | `false` |  |
| transmissionConfig.peer-socket-tos | string | `"default"` |  |
| transmissionConfig.pex-enabled | bool | `true` |  |
| transmissionConfig.port-forwarding-enabled | bool | `false` |  |
| transmissionConfig.preallocation | int | `1` |  |
| transmissionConfig.prefetch-enabled | bool | `true` |  |
| transmissionConfig.queue-stalled-enabled | bool | `true` |  |
| transmissionConfig.queue-stalled-minutes | int | `30` |  |
| transmissionConfig.ratio-limit | int | `2` |  |
| transmissionConfig.ratio-limit-enabled | bool | `false` |  |
| transmissionConfig.rename-partial-files | bool | `true` |  |
| transmissionConfig.rpc-authentication-required | bool | `false` |  |
| transmissionConfig.rpc-bind-address | string | `"0.0.0.0"` |  |
| transmissionConfig.rpc-enabled | bool | `true` |  |
| transmissionConfig.rpc-host-whitelist | string | `""` |  |
| transmissionConfig.rpc-host-whitelist-enabled | bool | `false` |  |
| transmissionConfig.rpc-password | string | `"CHANGEME"` |  |
| transmissionConfig.rpc-port | int | `9091` |  |
| transmissionConfig.rpc-url | string | `"/transmission/"` |  |
| transmissionConfig.rpc-username | string | `""` |  |
| transmissionConfig.rpc-whitelist | string | `""` |  |
| transmissionConfig.rpc-whitelist-enabled | bool | `false` |  |
| transmissionConfig.scrape-paused-torrents-enabled | bool | `true` |  |
| transmissionConfig.script-torrent-done-enabled | bool | `false` |  |
| transmissionConfig.script-torrent-done-filename | string | `""` |  |
| transmissionConfig.seed-queue-enabled | bool | `false` |  |
| transmissionConfig.seed-queue-size | int | `10` |  |
| transmissionConfig.speed-limit-down | int | `100` |  |
| transmissionConfig.speed-limit-down-enabled | bool | `false` |  |
| transmissionConfig.speed-limit-up | int | `100` |  |
| transmissionConfig.speed-limit-up-enabled | bool | `false` |  |
| transmissionConfig.start-added-torrents | bool | `true` |  |
| transmissionConfig.trash-original-torrent-files | bool | `false` |  |
| transmissionConfig.umask | int | `2` |  |
| transmissionConfig.upload-slots-per-torrent | int | `14` |  |
| transmissionConfig.utp-enabled | bool | `true` |  |
| transmissionConfig.watch-dir | string | `"/watch"` |  |
| transmissionConfig.watch-dir-enabled | bool | `false` |  |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/charts/tree/master/charts/common/README.md#Changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [2.0.0]

#### Changed

- customConfig became transmissionConfig and is always used

### [1.0.0]

#### Added

- Initial commit

[1.0.0]: #1.0.0

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)