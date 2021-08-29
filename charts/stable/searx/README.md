# searx

![Version: 5.1.0](https://img.shields.io/badge/Version-5.1.0-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

Searx is a privacy-respecting, hackable metasearch engine

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/searx/searx>
* <https://searx.github.io/searx/>
* <https://hub.docker.com/r/searx/searx>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://library-charts.k8s-at-home.com | common | 4.0.0 |

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install searx k8s-at-home/searx
```

## Installing the Chart

To install the chart with the release name `searx`

```console
helm install searx k8s-at-home/searx
```

## Uninstalling the Chart

To uninstall the `searx` deployment

```console
helm uninstall searx
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install searx \
  --set env.TZ="America/New York" \
    k8s-at-home/searx
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install searx k8s-at-home/searx -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| caddy.noTls | bool | `false` | caddy sidecar disable auto tls if behind another loadbalancer or ingress |
| caddy.pullPolicy | string | `"IfNotPresent"` | caddy sidecar image pull policy |
| caddy.repository | string | `"caddy"` | caddy sidecar image repository |
| caddy.tag | string | `"2.2.0-alpine"` | caddy sidecar image tag |
| filtron.pullPolicy | string | `"Always"` | filtron sidecar image pull policy |
| filtron.repository | string | `"dalf/filtron"` | filtron sidecar image repository |
| filtron.tag | string | `"latest"` | filtron sidecar image tag |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"searx/searx"` | image repository |
| image.tag | string | `"1.0.0-211-968b2899"` | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| morty.pullPolicy | string | `"Always"` | morty sidecar image pull policy |
| morty.repository | string | `"dalf/morty"` | morty sidecar image repository |
| morty.tag | string | `"latest"` | morty sidecar image tag |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| searx.baseUrl | string | `"https://searx.DOMAIN"` | External URL where the application is reachable |
| searx.existingSecret | string | `nil` | Specify an existing secret that contains the environment variables required for the application configuration. |
| searx.mortyKey | string | `"changeme"` | Generate a random key used by Morty (Privacy aware web content sanitizer proxy as a service). Example : `openssl rand -base64 24` |
| service | object | See values.yaml | Configures service settings for the chart. |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [5.1.0]

#### Changed

- Removed searx-checker container from Helm chart because it's integrated into Searx.
- Added the `caddy.noTls` option to disable automatic Let's Encrypt certificates for situations where Searx is running behind another Ingress controller that handles certificates.
- Changed image tag to `1.0.0-211-968b2899`.

### [5.0.0]

#### Changed

- Upgraded the common library dependency to version 4.0.0. This introduced (potentially) breaking changes to `initContainers` and `additionalContainers`. Be sure to check out the [library chart](https://github.com/k8s-at-home/library-charts/blob/common-4.0.0/charts/stable/common/) for the up-to-date values.

### [4.0.0]

#### Changed

- **BREAKING**: Upgraded the common library dependency to version 3.2.0. This introduces several breaking changes (`service`, `ingress` and `persistence` keys have been refactored).
  Be sure to check out the [library chart](https://github.com/k8s-at-home/library-charts/blob/common-3.2.0/charts/stable/common/) for the up-to-date values.
- **BREAKING**: The additional containers have been moved to a hardcoded list
- Changed image tag to `1.0.0`.

### [1.0.0]

#### Added

- Initial version

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
