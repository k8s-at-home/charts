# readarr

![Version: 6.1.0](https://img.shields.io/badge/Version-6.1.0-informational?style=flat-square) ![AppVersion: v0.1.0.715](https://img.shields.io/badge/AppVersion-v0.1.0.715-informational?style=flat-square)

A fork of Radarr to work with Books & AudioBooks

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/Readarr/Readarr>
* <https://github.com/k8s-at-home/container-images>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://library-charts.k8s-at-home.com | common | 4.2.0 |

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install readarr k8s-at-home/readarr
```

## Installing the Chart

To install the chart with the release name `readarr`

```console
helm install readarr k8s-at-home/readarr
```

## Uninstalling the Chart

To uninstall the `readarr` deployment

```console
helm uninstall readarr
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install readarr \
  --set env.TZ="America/New York" \
    k8s-at-home/readarr
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install readarr k8s-at-home/readarr -f values.yaml
```

## Custom configuration

**Readarr is still in early development, and this chart will install a nightly build of Readarr.
[See the project readme for more information](https://github.com/Readarr/Readarr#readarr-is-in-early-stages-of-development-alphabeta-binary-builds-are-not-yet-available-use-of-any-test-builds-isnt-recommend-and-may-have-detrimental-effects-on-your-library). Take back-up's if you decide to use this on an existing library as the project is considered unstable**

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env | object | See below | environment variables. |
| env.TZ | string | `"UTC"` | Set the container timezone |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"ghcr.io/k8s-at-home/readarr"` | image repository |
| image.tag | string | `"v0.1.0.715"` | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| probes | object | See values.yaml | Configures the probes for the main Pod. |
| service | object | See values.yaml | Configures service settings for the chart. |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [6.0.0]

#### Changed

- Upgraded the common library dependency to version 4.0.0. This introduced (potentially) breaking changes to `initContainers` and `additionalContainers`. Be sure to check out the [library chart](https://github.com/k8s-at-home/library-charts/blob/common-4.0.0/charts/stable/common/) for the up-to-date values.

### [5.0.0]

#### Changed

- **BREAKING**: Upgraded the common library dependency to version 3.0.2. This introduces several breaking changes (`service`, `ingress` and `persistence` keys have been refactored).
  Be sure to check out the [library chart](https://github.com/k8s-at-home/library-charts/blob/common-3.0.2/charts/stable/common/) for the up-to-date values.
- Changed image tag to `v0.1.0.715`.

### [4.0.0]

#### Changed

- **Breaking**: swap linuxserver.io images for k8s@home image

### [1.0.0]

#### Added

- Initial version

[6.0.0]: #600
[5.0.0]: #500
[4.0.0]: #400
[1.0.0]: #100

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
