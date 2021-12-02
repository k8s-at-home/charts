# tt-rss

![Version: 4.3.1](https://img.shields.io/badge/Version-4.3.1-informational?style=flat-square) ![AppVersion: v1.8723.0](https://img.shields.io/badge/AppVersion-v1.8723.0-informational?style=flat-square)

Tiny Tiny RSS is a free and open source web-based news feed (RSS/Atom) reader and aggregator

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://git.tt-rss.org/fox/tt-rss>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | postgresql | 10.13.10 |
| https://library-charts.k8s-at-home.com | common | 4.2.0 |

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install tt-rss k8s-at-home/tt-rss
```

## Installing the Chart

To install the chart with the release name `tt-rss`

```console
helm install tt-rss k8s-at-home/tt-rss
```

## Uninstalling the Chart

To uninstall the `tt-rss` deployment

```console
helm uninstall tt-rss
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install tt-rss \
  --set env.TZ="America/New York" \
    k8s-at-home/tt-rss
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install tt-rss k8s-at-home/tt-rss -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env | object | See below. | See more environment variables in the tt-rss documentation https://git.tt-rss.org/fox/tt-rss/src/branch/master/classes/config.php#L9 |
| env.TTRSS_DB_HOST | string | internal postgresql URL | Postgres database hostname |
| env.TTRSS_DB_NAME | string | postgresql.postgresqlDatabase value | Postgres database password |
| env.TTRSS_DB_PASS | string | postgresql.postgresqlPassword value | Postgres database password |
| env.TTRSS_DB_PORT | string | `"5432"` | Postgres database port. |
| env.TTRSS_DB_USER | string | postgresql.postgresqlUsername value | Postgres database user name |
| env.TTRSS_SELF_URL_PATH | string | `""` | External URL you use to connect to the RSS (the one you enter in your browser) |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"ghcr.io/k8s-at-home/tt-rss"` | image repository |
| image.tag | string | `"v1.8723.0"` | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| postgresql | object | see bellow | Bitnami postgres chart. For more options see https://github.com/bitnami/charts/tree/master/bitnami/postgresql |
| postgresql.enabled | bool | `true` | By default uses an internal postgress. Dissable if you use your own Postgres. |
| postgresql.persistence.enabled | bool | `false` | if database is stored to a PVC. Set to true when you are done testing. |
| postgresql.postgresqlDatabase | string | `"tt-rss"` | Postgres database password |
| postgresql.postgresqlPassword | string | `"changeme"` | Postgres database password |
| postgresql.postgresqlUsername | string | `"postgres"` | Postgres database user name |
| service | object | See below. | Configure the services for the chart here. |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [4.0.0]

#### Changed

- Upgraded the common library dependency to version 4.0.0. This introduced (potentially) breaking changes to `initContainers` and `additionalContainers`. Be sure to check out the [library chart](https://github.com/k8s-at-home/library-charts/blob/common-4.0.0/charts/stable/common/) for the up-to-date values.

### [3.0.0]

#### Changed

- **BREAKING**: Upgraded the common library dependency to version 3.1.0. This introduces several breaking changes (`service`, `ingress` and `persistence` keys have been refactored).
  Be sure to check out the [library chart](https://github.com/k8s-at-home/library-charts/blob/common-3.1.0/charts/stable/common/) for the up-to-date values.

### [1.0.6]

#### Changed

- Use generated template
- Use k8s-at-home repository
- Generate helm-docs

[4.0.0]: #400
[3.0.0]: #300
[1.0.6]: #106

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
