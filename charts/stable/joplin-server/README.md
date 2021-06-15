# joplin-server

![Version: 3.0.0](https://img.shields.io/badge/Version-3.0.0-informational?style=flat-square) ![AppVersion: 1.8.5](https://img.shields.io/badge/AppVersion-1.8.5-informational?style=flat-square)

This server allows you to sync any Joplin client

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/laurent22/joplin/tree/dev/packages/server>
* <https://github.com/laurent22/joplin>
* <https://hub.docker.com/r/joplin/server>

## Requirements

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | postgresql | 10.4.9 |
| https://library-charts.k8s-at-home.com | common | 3.1.1 |

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install joplin-server k8s-at-home/joplin-server
```

## Installing the Chart

To install the chart with the release name `joplin-server`

```console
helm install joplin-server k8s-at-home/joplin-server
```

## Uninstalling the Chart

To uninstall the `joplin-server` deployment

```console
helm uninstall joplin-server
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install joplin-server \
  --set env.TZ="America/New York" \
    k8s-at-home/joplin-server
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install joplin-server k8s-at-home/joplin-server -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env | object | See below | environment variables. See [image docs](https://github.com/laurent22/joplin) for more details. |
| env.APP_BASE_URL | string | `"https://joplin.domain"` | joplin-server base URL |
| env.APP_PORT | int | `22300` | joplin-server listening port (same as Service port) |
| env.DB_CLIENT | string | `nil` | Use pg for postgres |
| env.POSTGRES_DATABASE | string | `nil` | Postgres DB name |
| env.POSTGRES_HOST | string | `nil` | Postgres DB Host |
| env.POSTGRES_PASSWORD | string | `nil` | Postgres DB password |
| env.POSTGRES_PORT | string | `nil` | Postgres DB port |
| env.POSTGRES_USER | string | `nil` | Postgres DB Username |
| env.TZ | string | `"UTC"` | Set the container timezone |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"joplin/server"` | image repository |
| image.tag | string | `"1.8.5"` | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| postgresql | object | See values.yaml | Enable and configure postgresql database subchart under this key.    For more options see [postgresql chart documentation](https://github.com/bitnami/charts/tree/master/bitnami/postgresql) |
| service | object | See values.yaml | Configures service settings for the chart. |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [3.0.0]

#### Added

- Added support for installing a postgresql database along with this chart.

#### Changed

- **BREAKING**: Upgraded the common library dependency to version 3.1.1. This introduces several breaking changes (`service`, `ingress` and `persistence` keys have been refactored).
  Be sure to check out the [library chart](https://github.com/k8s-at-home/library-charts/blob/common-3.1.1/charts/stable/common/) for the up-to-date values.
- Changed image tag to `1.8.5`.

### [1.0.0]

#### Added

- Initial version

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

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
