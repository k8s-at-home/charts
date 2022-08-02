# miniflux

![Version: 5.1.2](https://img.shields.io/badge/Version-5.1.2-informational?style=flat-square) ![AppVersion: 2.0.36](https://img.shields.io/badge/AppVersion-2.0.36-informational?style=flat-square)

Miniflux is a minimalist and opinionated feed reader.

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/miniflux/v2>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | postgresql | 11.6.12 |
| https://library-charts.k8s-at-home.com | common | 4.5.2 |

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install miniflux k8s-at-home/miniflux
```

## Installing the Chart

To install the chart with the release name `miniflux`

```console
helm install miniflux k8s-at-home/miniflux
```

## Uninstalling the Chart

To uninstall the `miniflux` deployment

```console
helm uninstall miniflux
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install miniflux \
  --set env.TZ="America/New York" \
    k8s-at-home/miniflux
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install miniflux k8s-at-home/miniflux -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env | object | See below | environment variables. See [miniflux docs](https://miniflux.app/docs/configuration.html) for more details. |
| env.ADMIN_PASSWORD | string | `"changeme"` | Admin user password, it's used only if `CREATE_ADMIN` is enabled. |
| env.ADMIN_USERNAME | string | `"admin"` | Admin user login, it's used only if `CREATE_ADMIN` is enabled. |
| env.CREATE_ADMIN | string | `"1"` | Set to `1` to create an admin user from environment variables. |
| env.DATABASE_URL | string | `"postgres://{{ .Values.postgresql.auth.username }}:{{ .Values.postgresql.auth.password }}@{{ include \"common.names.fullname\" .}}-postgresql/{{ .Values.postgresql.auth.database }}?sslmode=disable"` | Postgresql connection parameters. See [lib/pq](https://pkg.go.dev/github.com/lib/pq#hdr-Connection_String_Parameters) for more details. |
| env.RUN_MIGRATIONS | string | `"1"` | Set to `1` to run database migrations during application startup. |
| env.TZ | string | `"UTC"` | Set the container timezone. |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"miniflux/miniflux"` |  |
| image.tag | string | `nil` |  |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| postgresql | object | Enabled (see values.yaml for more details) | Enable and configure postgresql database subchart under this key.    For more options see [postgresql chart documentation](https://github.com/bitnami/charts/tree/master/bitnami/postgresql) |
| postgresql.auth.database | string | `"miniflux"` | Postgres database |
| postgresql.auth.password | string | `"miniflux"` | Postgres database password |
| postgresql.auth.username | string | `"miniflux"` | Postgres database user name |
| postgresql.enabled | bool | `true` | By default uses an internal postgress. Dissable if you use your own Postgres. |
| probes | object | See values.yaml | Configures the probes for the main Pod. |
| service | object | See values.yaml | Configures service settings for the chart. |

## Changelog

### Version 5.1.2

#### Added

N/A

#### Changed

* Upgraded `common` chart dependency to version 4.5.2

#### Fixed

N/A

### Older versions

A historical overview of changes can be found on [ArtifactHUB](https://artifacthub.io/packages/helm/k8s-at-home/miniflux?modal=changelog)

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v0.1.1](https://github.com/k8s-at-home/helm-docs/releases/v0.1.1)
