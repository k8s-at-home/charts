# healthchecks

![Version: 3.1.0](https://img.shields.io/badge/Version-3.1.0-informational?style=flat-square) ![AppVersion: version-v1.20.0](https://img.shields.io/badge/AppVersion-version--v1.20.0-informational?style=flat-square)

Healthchecks is a cron job monitoring service. It listens for HTTP requests and email messages ("pings") from your cron jobs and scheduled tasks ("checks"). When a ping does not arrive on time, Healthchecks sends out alerts.

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/healthchecks/healthchecks>
* <https://hub.docker.com/r/linuxserver/healthchecks>

## Requirements

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://library-charts.k8s-at-home.com | common | 3.2.0 |

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install healthchecks k8s-at-home/healthchecks
```

## Installing the Chart

To install the chart with the release name `healthchecks`

```console
helm install healthchecks k8s-at-home/healthchecks
```

## Uninstalling the Chart

To uninstall the `healthchecks` deployment

```console
helm uninstall healthchecks
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install healthchecks \
  --set env.TZ="America/New York" \
    k8s-at-home/healthchecks
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install healthchecks k8s-at-home/healthchecks -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env | object | See below | environment variables. See [image docs](https://github.com/linuxserver/docker-healthchecks#parameters) for more details. |
| env.REGENERATE_SETTINGS | string | `"True"` | Set to true to always override the local_settings.py file with values from environment variables. Do not set to True if you have made manual modifications to this file. |
| env.SITE_NAME | int | `8265` | The site's name (e.g., "Example Corp HealthChecks") |
| env.SITE_ROOT | string | `"https://healthchecks.domain"` | The site's top-level URL and the port it listens to |
| env.SUPERUSER_EMAIL | string | `"email@healthchecks.io"` | Superuser email |
| env.SUPERUSER_PASSWORD | string | `"myVeryStrongPassword"` | Superuser password |
| env.TZ | string | `"UTC"` | Set the container timezone |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"linuxserver/healthchecks"` | image repository |
| image.tag | string | `"version-v1.20.0"` | image tag |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| persistence.config | object | `{"enabled":false,"mountpath":"/config"}` | Volume used for configuration |
| service | object | See values.yaml | Configures service settings for the chart. |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [3.0.0]

#### Changed

- **BREAKING**: Upgraded the common library dependency to version 3.1.0. This introduces several breaking changes (`service`, `ingress` and `persistence` keys have been refactored).
  Be sure to check out the [library chart](https://github.com/k8s-at-home/library-charts/blob/common-3.1.0/charts/stable/common/) for the up-to-date values.
- Changed image tag to `version-v1.20.0`.

### [1.0.0]

#### Added

- Initial version

#### Changed

- N/A

#### Removed

- N/A

[3.0.0]: #3.0.0
[1.0.0]: #1.0.0

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
