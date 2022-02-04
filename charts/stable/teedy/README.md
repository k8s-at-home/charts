# teedy

![Version: 5.5.0](https://img.shields.io/badge/Version-5.5.0-informational?style=flat-square) ![AppVersion: v1.9](https://img.shields.io/badge/AppVersion-v1.9-informational?style=flat-square)

Teedy is an open source, lightweight document management system for individuals and businesses.

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/sismics/docs>
* <https://github.com/k8s-at-home/charts/tree/master/charts/teedy>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | postgresql | 10.14.4 |
| https://library-charts.k8s-at-home.com | common | 4.3.0 |

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install teedy k8s-at-home/teedy
```

## Installing the Chart

To install the chart with the release name `teedy`

```console
helm install teedy k8s-at-home/teedy
```

## Uninstalling the Chart

To uninstall the `teedy` deployment

```console
helm uninstall teedy
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install teedy \
  --set env.TZ="America/New York" \
    k8s-at-home/teedy
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install teedy k8s-at-home/teedy -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env | object | See below | environment variables. See [application docs](https://github.com/sismics/docs) for more details. |
| env.DATABASE_PASSWORD | string | `nil` | The password to be used for the database connection. |
| env.DATABASE_URL | string | `nil` | The jdbc connection string to be used by hibernate |
| env.DATABASE_USER | string | `nil` | The user which should be used for the database connection |
| env.DOCS_ADMIN_EMAIL_INIT | string | `nil` | Defines the e-mail-address the admin user should have upon initialization |
| env.DOCS_ADMIN_PASSWORD_INIT | string | `nil` | Defines the password the admin user should have upon initialization. Needs to be a bcrypt hash. |
| env.DOCS_BASE_URL | string | `nil` | The base url used by the application |
| env.DOCS_DEFAULT_LANGUAGE | string | `"eng"` | The language which will be used as default |
| env.DOCS_SMTP_HOSTNAME | string | `nil` | Hostname of the SMTP-Server to be used by Teedy |
| env.DOCS_SMTP_PASSWORD | string | `nil` | The password of the SMTP-Server which should be used |
| env.DOCS_SMTP_PORT | string | `nil` | The port of the SMTP-Server which should be used |
| env.DOCS_SMTP_USERNAME | string | `nil` | The username of the SMTP-Server which should be used |
| env.TZ | string | `"UTC"` | Set the container timezone |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"sismics/docs"` | image repository |
| image.tag | string | `"v1.9"` | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| postgresql | object | See values.yaml | Enable and configure postgresql database subchart under this key.    For more options see [postgresql chart documentation](https://github.com/bitnami/charts/tree/master/bitnami/postgresql) |
| service | object | See values.yaml | Configures service settings for the chart. |

## Changelog

### Version 5.5.0

#### Added

N/A

#### Changed

* Upgraded `common` chart dependency to version `4.3.0`.

#### Fixed

N/A

### Older versions

A historical overview of changes can be found on [ArtifactHUB](https://artifacthub.io/packages/helm/k8s-at-home/teedy?modal=changelog)

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v0.1.1](https://github.com/k8s-at-home/helm-docs/releases/v0.1.1)
