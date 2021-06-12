# plex

![Version: 5.0.1](https://img.shields.io/badge/Version-5.0.1-informational?style=flat-square) ![AppVersion: v1.23.2.4656-85f0adf5b](https://img.shields.io/badge/AppVersion-v1.23.2.4656--85f0adf5b-informational?style=flat-square)

Plex Media Server

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/k8s-at-home/charts/tree/master/charts/stable/plex>
* <https://github.com/k8s-at-home/container-images/>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://library-charts.k8s-at-home.com | common | 3.0.2 |

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install plex k8s-at-home/plex
```

## Installing the Chart

To install the chart with the release name `plex`

```console
helm install plex k8s-at-home/plex
```

## Uninstalling the Chart

To uninstall the `plex` deployment

```console
helm uninstall plex
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install plex \
  --set env.TZ="America/New York" \
    k8s-at-home/plex
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install plex k8s-at-home/plex -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env | object | See below | environment variables. See [plex docs](https://support.plex.tv/articles/201105343-advanced-hidden-server-settings/) for more details. **NOTE:** Plex preference options are camelCase and CASE SENSITIVE! You can do horrible things to your Plex configuration if you are not careful |
| env.TZ | string | `"UTC"` | Set the container timezone |
| hostNetwork | bool | `false` | Enable devices to be discoverable |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"ghcr.io/k8s-at-home/plex"` | image repository |
| image.tag | string | `"v1.23.2.4656-85f0adf5b"` | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| podSecurityContext | object | `{}` | Configure the Security Context for the Pod |
| resources | object | `{}` | Configure the resource requests and/or limits for the Pod |
| service | object | See values.yaml | Configures service settings for the chart. |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [5.0.0]

#### Changed

- **BREAKING**: Upgraded the common library dependency to version 3.0.1. This introduces several breaking changes (`service`, `ingress` and `persistence` keys have been refactored).
  Be sure to check out the [library chart](https://github.com/k8s-at-home/library-charts/blob/common-3.0.1/charts/stable/common/) for the up-to-date values.
- Changed image tag to `v1.23.2.4656-85f0adf5b`.

### [3.0.0]

#### Added

- **BREAKING** this chart is now using the common library, do not upgrade unless you know what you are doing. In most cases it is better to stay with `v2.3.1` unless you know what you are doing. There is no clear migration path since everyones deployment can vary.

### [2.3.1]

#### Added

- N/A

#### Changed

- use helm-docs

#### Removed

- N/A

[5.0.0]: #500
[3.0.0]: #300
[2.3.1]: #231

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
