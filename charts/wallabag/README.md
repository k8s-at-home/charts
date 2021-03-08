# wallabag

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![AppVersion: 2.4.1](https://img.shields.io/badge/AppVersion-2.4.1-informational?style=flat-square)

A self hostable application for saving web pages, freely.

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/wallabag/docker>
* <https://hub.docker.com/wallabag/wallabag>

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
helm install wallabag k8s-at-home/wallabag
```

## Installing the Chart

To install the chart with the release name `wallabag`

```console
helm install wallabag k8s-at-home/wallabag
```

## Uninstalling the Chart

To uninstall the `wallabag` deployment

```console
helm uninstall wallabag
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](../common/values.yaml) from the [common library](../common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install wallabag \
  --set env.TZ="America/New York" \
    k8s-at-home/wallabag
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install wallabag k8s-at-home/wallabag -f values.yaml
```

## Custom configuration

Default login is `wallabag:wallabag`.

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/charts/tree/master/charts/common/)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| controllerType | string | `"statefulset"` |  |
| env | object | `{}` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"wallabag/wallabag"` |  |
| image.tag | string | `"2.4.1"` |  |
| ingress.enabled | bool | `false` |  |
| persistence.cache.emptyDir | bool | `false` |  |
| persistence.cache.enabled | bool | `false` |  |
| persistence.cache.mountPath | string | `"/var/www/wallabag/var/cache"` |  |
| persistence.images.emptyDir | bool | `false` |  |
| persistence.images.enabled | bool | `false` |  |
| persistence.images.mountPath | string | `"/var/www/wallabag/web/assets/images"` |  |
| service.port.port | int | `80` |  |
| strategy.type | string | `"RollingUpdate"` |  |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/charts/tree/master/charts/common/README.md#Changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [1.0.0]

#### Added

- Initial version of the chart

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

