# tdarr

![Version: 4.5.2](https://img.shields.io/badge/Version-4.5.2-informational?style=flat-square) ![AppVersion: 2.00.18](https://img.shields.io/badge/AppVersion-2.00.18-informational?style=flat-square)

Tdarr is a self hosted web-app for automating media library transcode/remux management and making sure your files are exactly how you need them to be in terms of codecs/streams/containers etc.

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://www.github.com/HaveAGitGat/Tdarr>
* <https://hub.docker.com/r/haveagitgat/tdarr/>
* <https://tdarr.io/docs/>

## Requirements

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://library-charts.k8s-at-home.com | common | 4.4.2 |

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install tdarr k8s-at-home/tdarr
```

## Installing the Chart

To install the chart with the release name `tdarr`

```console
helm install tdarr k8s-at-home/tdarr
```

## Uninstalling the Chart

To uninstall the `tdarr` deployment

```console
helm uninstall tdarr
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install tdarr \
  --set env.TZ="America/New York" \
    k8s-at-home/tdarr
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install tdarr k8s-at-home/tdarr -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env | object | See below | environment variables. See [image docs](https://hub.docker.com/r/haveagitgat/tdarr) for more details. |
| env.PGID | string | `"1000"` | Set the container group id |
| env.PUID | string | `"1000"` | Set the container user id |
| env.TZ | string | `"UTC"` | Set the container timezone |
| env.ffmpegPath | string | `""` | Allow override for the pre-compiled tdarr ffmpeg binary |
| env.serverIP | string | `"0.0.0.0"` | tdarr server binding address |
| env.serverPort | string | `"{{ .Values.service.main.ports.server.port }}"` | tdarr server listening port |
| env.webUIPort | string | `"{{ .Values.service.main.ports.http.port }}"` | tdarr web UI listening port (same as Service port) |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"haveagitgat/tdarr"` | image repository |
| image.tag | string | chart.appVersion | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| node.enabled | bool | `true` | Deploy a tdarr node. |
| node.id | string | `"node"` | Node ID |
| node.image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| node.image.repository | string | `"haveagitgat/tdarr_node"` | image repository |
| node.image.tag | string | `"2.00.10"` | image tag |
| node.resources | object | `{}` | Node resources |
| persistence | object | See below | Configure persistence settings for the chart under this key. |
| persistence.config | object | See values.yaml | Volume used for configuration |
| persistence.data | object | See values.yaml | Volume used for tdarr server database |
| persistence.media | object | See values.yaml | Volume used for media libraries |
| persistence.shared | object | See values.yaml | Volume used for shared storage. e.g. emptydir transcode |
| service | object | See values.yaml | Configures service settings for the chart. |

## Changelog

### Version 4.5.2

#### Added

N/A

#### Changed

* Upgraded `common` chart dependency to version 4.4.2

#### Fixed

N/A

### Older versions

A historical overview of changes can be found on [ArtifactHUB](https://artifacthub.io/packages/helm/k8s-at-home/tdarr?modal=changelog)

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v0.1.1](https://github.com/k8s-at-home/helm-docs/releases/v0.1.1)
