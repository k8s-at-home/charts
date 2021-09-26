# airsonic

![Version: 6.0.0](https://img.shields.io/badge/Version-6.0.0-informational?style=flat-square) ![AppVersion: 10.6.2](https://img.shields.io/badge/AppVersion-10.6.2-informational?style=flat-square)

Airsonic is a Free and Open Source community driven media server

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/airsonic-advanced/airsonic-advanced>
* <https://github.com/k8s-at-home/charts/tree/master/charts/airsonic>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://library-charts.k8s-at-home.com | common | 4.0.1 |

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install airsonic k8s-at-home/airsonic
```

## Installing the Chart

To install the chart with the release name `airsonic`

```console
helm install airsonic k8s-at-home/airsonic
```

## Uninstalling the Chart

To uninstall the `airsonic` deployment

```console
helm uninstall airsonic
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install airsonic \
  --set env.TZ="America/New York" \
    k8s-at-home/airsonic
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install airsonic k8s-at-home/airsonic -f values.yaml
```

## Custom configuration

If you plan to use networked storage to store your media or config for Airsonic, (NFS, etc.) please take a look at the
Fast Access option in the Airsonic settings. This will help improve the performance of the application
by not constantly monitoring media folders.

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| enableServiceLinks | bool | `false` | Enable Kubernetes service links. Disabled by default, since AIRSONIC_* environment vars potentially clash with the application. |
| env | object | See below | environment variables. |
| env.CONTEXT_PATH | string | `nil` | Used to set the base path for reverse proxies eg. /airsonic, /music, etc. |
| env.JAVA_OPTS | string | `nil` | For passing additional java options. For some reverse proxies, you may need to pass `JAVA_OPTS=-Dserver.use-forward-headers=true` for airsonic to generate the proper URL schemes. |
| env.TZ | string | `"UTC"` | Set the container timezone |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"airsonicadvanced/airsonic-advanced"` | image repository |
| image.tag | string | `"latest@sha256:f7cbafac28063dce99b443037547b4fe40ae270b7bc5e47efea9bb5d6751ca9d"` | image tag The specific digest is for the `amd64` image, but arm compatible images are also available. |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| probes | object | See values.yaml | Configures the probes for the main Pod. |
| service | object | See values.yaml | Configures service settings for the chart. Normally this does not need to be modified. |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [6.0.0]

#### Changed

- Use the default volume mount locations as specified by airsonic-advanced (https://github.com/airsonic-advanced/airsonic-advanced).

### [5.0.0]

#### Changed

- Upgraded the common library dependency to version 4.0.0. This introduced (potentially) breaking changes to `initContainers` and `additionalContainers`. Be sure to check out the [library chart](https://github.com/k8s-at-home/library-charts/blob/common-4.0.0/charts/stable/common/) for the up-to-date values.

### [4.0.0]

#### Changed

- **BREAKING**: Changed image from linuxserver.io image to airsonic-advanced (https://github.com/airsonic-advanced/airsonic-advanced).

#### Removed

- Default values for `PGID` and `PUID` environment variables have been removed.

### [3.0.0]

#### Changed

- **BREAKING**: Upgraded the common library dependency to version 3.0.0. This introduces several breaking changes (`service`, `ingress` and `persistence` keys have been refactored).
  Be sure to check out the [library chart](https://github.com/k8s-at-home/library-charts/blob/common-3.0.0/charts/stable/common/) for the up-to-date values.
- Changed image tag to `version-v10.6.2`.

### [1.0.0]

#### Added

- Initial version

#### Changed

- N/A

#### Removed

- N/A

[5.0.0]: #500
[4.0.0]: #400
[3.0.0]: #300
[1.0.0]: #100

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
