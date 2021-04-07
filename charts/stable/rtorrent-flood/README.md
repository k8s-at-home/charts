# rtorrent-flood

![Version: 7.1.0](https://img.shields.io/badge/Version-7.1.0-informational?style=flat-square) ![AppVersion: latest](https://img.shields.io/badge/AppVersion-latest-informational?style=flat-square)

rTorrent is a stable, high-performance and low resource consumption BitTorrent client.

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/jesec/rtorrent>
* <https://github.com/jesec/flood>
* <https://hub.docker.com/r/jesec/rtorrent>
* <https://hub.docker.com/r/jesec/flood>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://library-charts.k8s-at-home.com | common | 2.2.0 |

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install rtorrent-flood k8s-at-home/rtorrent-flood
```

## Installing the Chart

To install the chart with the release name `rtorrent-flood`

```console
helm install rtorrent-flood k8s-at-home/rtorrent-flood
```

## Uninstalling the Chart

To uninstall the `rtorrent-flood` deployment

```console
helm uninstall rtorrent-flood
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install rtorrent-flood \
  --set env.TZ="America/New York" \
    k8s-at-home/rtorrent-flood
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install rtorrent-flood k8s-at-home/rtorrent-flood -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| config | string | string | Minimal configuration provided from https://github.com/jesec/rtorrent/blob/master/doc/rtorrent.rc |
| env.FLOOD_OPTION_ALLOWEDPATH | string | `"/downloads"` |  |
| env.FLOOD_OPTION_HOST | string | `"0.0.0.0"` |  |
| env.FLOOD_OPTION_PORT | string | `"3000"` |  |
| env.FLOOD_OPTION_RTORRENT | string | `"true"` |  |
| env.HOME | string | `"/config"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"jesec/rtorrent-flood"` |  |
| image.tag | string | `"latest@sha256:5ff0125ea0e2befbc2ba2f2143e130819db645cb5ef68b44a0712b8162a16f47"` |  |
| ingress.enabled | bool | `false` |  |
| persistence.config.emptyDir.enabled | bool | `false` |  |
| persistence.config.enabled | bool | `false` |  |
| persistence.downloads.emptyDir.enabled | bool | `false` |  |
| persistence.downloads.enabled | bool | `false` |  |
| service.additionalServices[0].enabled | bool | `true` |  |
| service.additionalServices[0].nameSuffix | string | `"bittorrent"` |  |
| service.additionalServices[0].port.name | string | `"bittorrent"` |  |
| service.additionalServices[0].port.port | int | `6881` |  |
| service.additionalServices[0].port.protocol | string | `"TCP"` |  |
| service.additionalServices[0].port.targetPort | int | `6881` |  |
| service.additionalServices[0].type | string | `"ClusterIP"` |  |
| service.port.port | int | `3000` |  |
| strategy.type | string | `"Recreate"` |  |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [6.0.0]

#### Added

- N/A

#### Changed

- **BREAKING** Migrate rtorrent-flood to the common library, a lot of configuration has changed.

#### Removed

- N/A

### [5.0.1]

#### Added

- N/A

#### Changed

- use helm-docs

#### Removed

- N/A

[6.0.0]: #6.0.0
[5.0.1]: #5.0.1

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
