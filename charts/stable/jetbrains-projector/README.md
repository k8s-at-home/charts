# jetbrains-projector

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square)

Projector is a technology to run and access Swing GUI applications remotely

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/JetBrains/projector-docker>

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
helm install jetbrains-projector k8s-at-home/jetbrains-projector
```

## Installing the Chart

To install the chart with the release name `jetbrains-projector`

```console
helm install jetbrains-projector k8s-at-home/jetbrains-projector
```

## Uninstalling the Chart

To uninstall the `jetbrains-projector` deployment

```console
helm uninstall jetbrains-projector
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install jetbrains-projector \
  --set env.TZ="America/New York" \
    k8s-at-home/jetbrains-projector
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install jetbrains-projector k8s-at-home/jetbrains-projector -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env | object | `{}` |  |
| idea.config.path | string | `"/data/config"` |  |
| idea.log.path | string | `"/data/plugins"` |  |
| idea.plugins.path | string | `"/data/plugins"` |  |
| idea.system.path | string | `"/data/system"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.registry | string | `"registry.jetbrains.team/p/prj/containers"` | See list of available images [here](https://github.com/JetBrains/projector-docker) |
| image.repository | string | `"projector-pycharm-c"` |  |
| image.tag | string | `"latest"` |  |
| ingress.enabled | bool | `false` |  |
| persistence.data.emptyDir.enabled | bool | `false` |  |
| persistence.data.enabled | bool | `false` |  |
| persistence.data.mountPath | string | `"/data"` |  |
| service.port.port | int | `8887` |  |
| strategy.type | string | `"Recreate"` |  |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [1.0.0]

#### Added

- N/A

#### Changed

- N/A

#### Removed

- N/A

[1.0.0]: #1.0.0

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

