# tdarr

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![AppVersion: 2.00.07](https://img.shields.io/badge/AppVersion-2.00.07-informational?style=flat-square)

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
| https://library-charts.k8s-at-home.com | common | 1.0.0 |

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
Other values may be used from the [values.yaml](../common/values.yaml) from the [common library](../common).

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
| additionalContainers[0].env[0].name | string | `"TZ"` |  |
| additionalContainers[0].env[0].value | string | `"America/New York"` | Node Timezone |
| additionalContainers[0].env[1].name | string | `"nodeID"` |  |
| additionalContainers[0].env[1].value | string | `"node"` | Node name |
| additionalContainers[0].env[2].name | string | `"serverIP"` |  |
| additionalContainers[0].env[2].value | string | `"localhost"` | tdarr server IP/hostname |
| additionalContainers[0].env[3].name | string | `"serverPort"` |  |
| additionalContainers[0].env[3].value | string | `"8266"` | tdar server port |
| additionalContainers[0].image | string | `"haveagitgat/tdarr_node:2.00.07"` | Node image and tag |
| additionalContainers[0].name | string | `"node"` |  |
| affinity | object | `{}` | Affinity settings for pod assignment of the GUI |
| env.TZ | string | `"America/New York"` | Timezone |
| env.serverIP | string | `"0.0.0.0"` | tdarr server binding address |
| env.serverPort | int | `8266` | tdarr server listening port |
| env.webUIPort | int | `8265` | tdarr web UI listening port (same as Service port) |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"haveagitgat/tdarr"` | tdarr image |
| image.tag | string | `"2.00.07"` | tdarr image tag |
| nodeSelector | object | `{}` | Node labels for pod assignment of the GUI |
| persistence.config | object | `{"emptyDir":false,"enabled":false,"mountpath":"/app/configs"}` | Volume used for configuration |
| persistence.data.emptyDir | bool | `false` |  |
| persistence.data.enabled | bool | `false` | Volume used for tdarr server database |
| persistence.data.mountpath | string | `"/app/server"` |  |
| persistence.media.emptyDir | bool | `false` |  |
| persistence.media.enabled | bool | `false` | Volume used for media libraries |
| persistence.media.mountpath | string | `"/media"` |  |
| podAnnotations | object | `{}` | Pod annotations |
| resources | object | `{}` |  |
| service.port.port | int | `8265` | Kubernetes port where the GUI is exposed |
| tolerations | list | `[]` | Toleration labels for pod assignment of the GUI |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)