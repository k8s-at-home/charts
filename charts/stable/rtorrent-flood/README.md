# rtorrent-flood

![Version: 9.0.0](https://img.shields.io/badge/Version-9.0.0-informational?style=flat-square) ![AppVersion: latest](https://img.shields.io/badge/AppVersion-latest-informational?style=flat-square)

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
| https://library-charts.k8s-at-home.com | common | 4.0.0 |

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
| env | object | See below | environment variables. See [image docs](https://github.com/jesec/flood#configuration) for more details. |
| env.FLOOD_OPTION_ALLOWEDPATH | string | `"/downloads"` | Allowed path for file operations |
| env.FLOOD_OPTION_HOST | string | `"0.0.0.0"` | The host that Flood should listen for web connections on |
| env.FLOOD_OPTION_PORT | string | `"3000"` | The port that Flood should listen for web connections on |
| env.FLOOD_OPTION_RTORRENT | string | `"true"` | ADVANCED: rTorrent daemon managed by Flood |
| env.HOME | string | `"/config"` | Folder where Flood stores it's configuration |
| env.TZ | string | `"UTC"` | Set the container timezone |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"jesec/rtorrent-flood"` | image repository |
| image.tag | string | `"latest@sha256:f0c894ec459e52d85bc69685247ddbd8e8fcf3709b50bf8ee8b0df3bf69b7b49"` | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| initContainers | object | See values.yaml | Use an initContainer to delete the rtorrent.lock file when the pod starts this is only required if `session.use_lock.set = no` is NOT set |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| service | object | See values.yaml | Configures service settings for the chart. |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [8.0.0]

#### Changed

- **BREAKING**: Upgraded the common library dependency to version 3.2.0. This introduces several breaking changes (`service`, `ingress` and `persistence` keys have been refactored).
  Be sure to check out the [library chart](https://github.com/k8s-at-home/library-charts/blob/common-3.2.0/charts/stable/common/) for the up-to-date values.
- Changed image tag to `latest@sha256:f0c894ec459e52d85bc69685247ddbd8e8fcf3709b50bf8ee8b0df3bf69b7b49`.

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

[8.0.0]: #800
[6.0.0]: #600
[5.0.1]: #501

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
