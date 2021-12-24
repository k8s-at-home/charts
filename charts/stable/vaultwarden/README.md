# vaultwarden

![Version: 3.3.2](https://img.shields.io/badge/Version-3.3.2-informational?style=flat-square) ![AppVersion: 1.22.2](https://img.shields.io/badge/AppVersion-1.22.2-informational?style=flat-square)

Vaultwarden is a Bitwarden compatable server in Rust

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/dani-garcia/vaultwarden>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | mariadb | 9.7.1 |
| https://charts.bitnami.com/bitnami | postgresql | 10.13.10 |
| https://library-charts.k8s-at-home.com | common | 4.2.0 |

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install vaultwarden k8s-at-home/vaultwarden
```

## Installing the Chart

To install the chart with the release name `vaultwarden`

```console
helm install vaultwarden k8s-at-home/vaultwarden
```

## Uninstalling the Chart

To uninstall the `vaultwarden` deployment

```console
helm uninstall vaultwarden
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install vaultwarden \
  --set env.TZ="America/New York" \
    k8s-at-home/vaultwarden
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install vaultwarden k8s-at-home/vaultwarden -f values.yaml
```

## Custom configuration

The Vaultwarden chart requires the `/config` folder to exist. In order to provide this, some type of storage needs to be implemented.
For testing purposes, the following config snippet will work:

````yaml
persistence:
  config:
    enabled: true
    type: emptyDir
````

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env | object | See below | environment variables. See [image docs](https://github.com/dani-garcia/vaultwarden/blob/main/.env.template) for more details. |
| env.DATA_FOLDER | string | `"config"` | Config dir |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"vaultwarden/server"` | image repository |
| image.tag | string | `"1.22.2"` | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| mariadb.enabled | bool | `false` |  |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| postgresql.enabled | bool | `false` |  |
| service | object | See values.yaml | Configures service settings for the chart. Normally this does not need to be modified. |
| strategy.type | string | `"Recreate"` |  |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [3.3.2]

#### Changed

- Ingress config uses port names. Now there is no need to update port in both service and rember to change it in ingress

### [3.2.1]

#### Added

- Mentioned that some kind of persistence is required on `/config` mountpoint.

#### Fixed

- Updated ct-values to properly create emptyDir

### [3.1.3]

#### Changed

- Bump version to 1.22.2

### [3.0.0]

#### Changed

- Upgraded the common library dependency to version 4.0.0. This introduced (potentially) breaking changes to `initContainers` and `additionalContainers`. Be sure to check out the [library chart](https://github.com/k8s-at-home/library-charts/blob/common-4.0.0/charts/stable/common/) for the up-to-date values.

### [2.0.0]

#### Added

- Pre-rendered Ingress example (disabled by default)

#### Changed

- **BREAKING**: Upgraded the common library dependency to version 3.0.1. This introduces several breaking changes (`service`, `ingress` and `persistence` keys have been refactored).
  Be sure to check out the [library chart](https://github.com/k8s-at-home/library-charts/blob/common-3.0.1/charts/stable/common/) for the up-to-date values.

### [1.0.0]

#### Added

- Initial version, Succeding Bitwarden_RS.

[3.1.3]: #313
[3.0.0]: #300
[2.0.0]: #200
[1.0.0]: #100

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
