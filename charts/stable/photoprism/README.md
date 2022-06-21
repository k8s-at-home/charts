# photoprism

![Version: 6.6.4](https://img.shields.io/badge/Version-6.6.3-informational?style=flat-square) ![AppVersion: 220617-jammy](https://img.shields.io/badge/AppVersion-220617--jammy-informational?style=flat-square)

PhotoPrism® is a server-based application for browsing, organizing and sharing your personal photo collection

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/photoprism/photoprism>
* <https://hub.docker.com/r/photoprism/photoprism>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | mariadb | 10.5.1 |
| https://library-charts.k8s-at-home.com | common | 4.4.2 |

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install photoprism k8s-at-home/photoprism
```

## Installing the Chart

To install the chart with the release name `photoprism`

```console
helm install photoprism k8s-at-home/photoprism
```

## Uninstalling the Chart

To uninstall the `photoprism` deployment

```console
helm uninstall photoprism
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install photoprism \
  --set env.TZ="America/New York" \
    k8s-at-home/photoprism
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install photoprism k8s-at-home/photoprism -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env | object | See below | environment variables. See [image docs](https://docs.photoprism.org/getting-started/config-options/) for more details. |
| env.GID | string | `nil` | Sets GID Photoprism runs under. |
| env.PHOTOPRISM_ADMIN_PASSWORD | string | `"please-change"` | Initial admin password. **BE SURE TO CHANGE THIS!** |
| env.PHOTOPRISM_DATABASE_DRIVER | string | `"sqlite"` | Database driver (sqlite, mysql) |
| env.PHOTOPRISM_DATABASE_NAME | string | `"photoprism"` | Database schema name |
| env.PHOTOPRISM_DATABASE_PASSWORD | string | `"photoprism"` | Database user password |
| env.PHOTOPRISM_DATABASE_SERVER | string | `"photoprism-mariadb:3306"` | Database host incl. port |
| env.PHOTOPRISM_DATABASE_USER | string | `"photoprism"` | Database user name |
| env.PHOTOPRISM_ORIGINALS_PATH | string | `"/photoprism/originals"` | Photoprism originals path |
| env.PHOTOPRISM_PUBLIC | string | `"false"` | Disable authentication / password protection |
| env.PHOTOPRISM_STORAGE_PATH | string | `"/photoprism/storage"` | Photoprism storage path |
| env.TZ | string | `"UTC"` | Set the container timezone |
| env.UID | string | `nil` | Sets UID Photoprism runs under. |
| env.UMASK | string | `nil` | Sets UMASK. |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"photoprism/photoprism"` | image repository |
| image.tag | string | chart.appVersion | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| mariadb | object | See values.yaml | Enable and configure mariadb database subchart under this key.    For more options see [mariadb chart documentation](https://github.com/bitnami/charts/tree/master/bitnami/mariadb) |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| service | object | See values.yaml | Configures service settings for the chart. |

## Changelog

### Version 6.6.3

#### Added

N/A

#### Changed

* Upgraded `common` chart dependency to version 4.4.2

#### Fixed

N/A

### Older versions

A historical overview of changes can be found on [ArtifactHUB](https://artifacthub.io/packages/helm/k8s-at-home/photoprism?modal=changelog)

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v0.1.1](https://github.com/k8s-at-home/helm-docs/releases/v0.1.1)
