# rtorrent-flood

![Version: 5.0.1](https://img.shields.io/badge/Version-5.0.1-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

rtorrent and flood co-located in the same deployment

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://hub.docker.com/r/looselyrigorous/rtorrent>
* <https://github.com/looselyrigorous/docker-rtorrent>
* <https://github.com/Flood-UI/flood>

## Requirements

## Dependencies

| Repository | Name | Version |
|------------|------|---------|

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
Other values may be used from the [values.yaml](../common/values.yaml) from the [common library](../common).

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

### Setup

NB: This chart will start 2 containers in a single pod, when both containers are started, you will be able to configure flood.

1. Install the chart `helm install rtorrent k8s-at-home/rtorrent-flood`

2. Port-forward to the container `kubectl port-forward $(kubectl get pods -A -o json | jq '.items[] | select(.metadata.labels."app.kubernetes.io/name"=="rtorrent-flood")' | jq .metadata.name -r) 3000:3000`

3. To connect flood to rtorrent, provide the socket path : `/tmp/rtorrent.sock`

4. When connected with flood to rtorrent, go to the settings and change the download path to `/data` which is set by default by the chart

5. You should be able to start downloading torrents now :)

### Pitfalls

You may need to change the StorageClass depending on your kubernetes setup or the containers won't start, use a custom `values.yaml` file to do so.

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/charts/tree/master/charts/common/)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| btService.annotations | object | `{}` |  |
| btService.labels | object | `{}` |  |
| btService.loadBalancerIP | string | `nil` |  |
| btService.port | int | `49161` |  |
| btService.type | string | `"NodePort"` |  |
| flood.enabled | bool | `true` |  |
| flood.image.pullPolicy | string | `"Always"` |  |
| flood.image.repository | string | `"jfurrow/flood-ui"` |  |
| flood.image.tag | string | `"latest"` |  |
| flood.resources.limits.memory | string | `"250Mi"` |  |
| flood.resources.requests.cpu | string | `"10m"` |  |
| flood.resources.requests.memory | string | `"100Mi"` |  |
| floodSecret | string | `"supersecret"` |  |
| fullnameOverride | string | `""` |  |
| gid | int | `1001` |  |
| guiService.annotations | object | `{}` |  |
| guiService.labels | object | `{}` |  |
| guiService.loadBalancerIP | string | `nil` |  |
| guiService.port | int | `3000` |  |
| guiService.type | string | `"ClusterIP"` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0] | string | `"chart-example.local"` |  |
| ingress.path | string | `"/"` |  |
| ingress.tls | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| persistence.config.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.config.enabled | bool | `true` |  |
| persistence.config.size | string | `"1Gi"` |  |
| persistence.config.skipuninstall | bool | `false` |  |
| persistence.data.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.data.enabled | bool | `true` |  |
| persistence.data.size | string | `"10Gi"` |  |
| persistence.data.skipuninstall | bool | `false` |  |
| podAnnotations | object | `{}` |  |
| rtorrent.enabled | bool | `true` |  |
| rtorrent.image.pullPolicy | string | `"Always"` |  |
| rtorrent.image.repository | string | `"billimek/rtorrent"` |  |
| rtorrent.image.tag | string | `"latest"` |  |
| rtorrent.resources.limits.memory | string | `"1Gi"` |  |
| rtorrent.resources.requests.cpu | string | `"50m"` |  |
| rtorrent.resources.requests.memory | string | `"50Mi"` |  |
| strategyType | string | `"Recreate"` |  |
| tolerations | list | `[]` |  |
| uid | int | `1001` |  |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/charts/tree/master/charts/common/README.md#Changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [5.0.1]

#### Added

- N/A

#### Changed

- use helm-docs

#### Removed

- N/A

[5.0.1]: #5.0.1

## Support

- See the [Wiki](https://github.com/k8s-at-home/charts/wiki)
- Open a [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/charts/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)