# transmission

![Version: 7.1.0](https://img.shields.io/badge/Version-7.1.0-informational?style=flat-square) ![AppVersion: v3.00](https://img.shields.io/badge/AppVersion-v3.00-informational?style=flat-square)

Transmission is a cross-platform BitTorrent client

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/transmission/transmission>
* <https://github.com/k8s-at-home/container-images>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://library-charts.k8s-at-home.com | common | 3.3.0 |

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
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

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

To view more environment variables [see here](https://github.com/k8s-at-home/container-images/tree/main/apps/transmission/settings.json.tmpl)

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env | object | See below | environment variables. See [image docs](https://github.com/k8s-at-home/container-images/tree/main/apps/transmission/settings.json.tmpl) for more details. |
| env.TRANSMISSION_DOWNLOAD_DIR | string | `"/downloads/complete"` | Torrent download directory |
| env.TRANSMISSION_INCOMPLETE_DIR | string | `"/downloads/incomplete"` | Incomplete download directory |
| env.TRANSMISSION_INCOMPLETE_DIR_ENABLED | bool | `false` | Enable incomplete download directory |
| env.TRANSMISSION_RPC_PASSWORD | string | `"CHANGEME"` | Password to access the Web UI |
| env.TRANSMISSION_WATCH_DIR | string | `"/watch"` | Watch directory |
| env.TRANSMISSION_WATCH_DIR_ENABLED | bool | `false` | Enable watch directory |
| env.TRANSMISSION_WEB_HOME | string | `"/web"` | Path in container where the Web UI is located |
| env.TZ | string | `"UTC"` | Set the container timezone |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"ghcr.io/k8s-at-home/transmission"` | image repository |
| image.tag | string | `"v3.00"` | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| initContainers | list | See values.yaml | Use an initContainer to download the Flood web ui Set UI with env `TRANSMISSION_WEB_HOME` set to `/config/flood-for-transmission/` |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| probes | object | See values.yaml | Configures the probes for the main Pod. |
| service | object | See values.yaml | Configures service settings for the chart. |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [7.0.0]

#### Changed

- **BREAKING**: Upgraded the common library dependency to version 3.2.0. This introduces several breaking changes (`service`, `ingress` and `persistence` keys have been refactored).
  Be sure to check out the [library chart](https://github.com/k8s-at-home/library-charts/blob/common-3.2.0/charts/stable/common/) for the up-to-date values.

### [6.0.0]

#### Changed

- **Breaking**: `.Values.config` is deprecated in favor of using environment variables for configuration. See [here](https://github.com/k8s-at-home/container-images/tree/main/apps/transmission/settings.json.tmpl) for more options.

### [5.0.0]

#### Added

- Example initContainer to showcase adding a custom web ui

#### Changed

- **Breaking**: `transmissionConfig` became `config` and is now a string not an object

### [4.0.0]

#### Changed

- **Breaking**: swap linuxserver.io images for k8s@home image

### [2.0.0]

#### Changed

- customConfig became transmissionConfig and is always used

### [1.0.0]

#### Added

- Initial commit

[6.0.0]: #6.0.0
[5.0.0]: #5.0.0
[4.0.0]: #4.0.0
[1.0.0]: #1.0.0

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
