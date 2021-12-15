# focalboard

![Version: 4.2.0](https://img.shields.io/badge/Version-4.2.0-informational?style=flat-square) ![AppVersion: 0.11.0](https://img.shields.io/badge/AppVersion-0.11.0-informational?style=flat-square)

Focalboard is an open source, self-hosted alternative to Trello, Notion, and Asana.

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://www.focalboard.com/>
* <https://github.com/mattermost/focalboard>
* <https://github.com/FlipEnergy/container-images/blob/main/focalboard>

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
helm install focalboard k8s-at-home/focalboard
```

## Installing the Chart

To install the chart with the release name `focalboard`

```console
helm install focalboard k8s-at-home/focalboard
```

## Uninstalling the Chart

To uninstall the `focalboard` deployment

```console
helm uninstall focalboard
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install focalboard \
  --set env.TZ="America/New York" \
    k8s-at-home/focalboard
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install focalboard k8s-at-home/focalboard -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| config | string | `"{\n  \"serverRoot\": \"http://localhost:8000\",\n  \"port\": 8000,\n  \"dbtype\": \"sqlite3\",\n  \"dbconfig\": \"/data/focalboard.db\",\n  \"postgres_dbconfig\": \"dbname=focalboard sslmode=disable\",\n  \"useSSL\": false,\n  \"webpath\": \"./pack\",\n  \"filespath\": \"/data/files\",\n  \"telemetry\": true,\n  \"session_expire_time\": 2592000,\n  \"session_refresh_time\": 18000,\n  \"localOnly\": false,\n  \"enableLocalMode\": true,\n  \"localModeSocketLocation\": \"/var/tmp/focalboard_local.socket\"\n}\n"` |  |
| enableServiceLinks | bool | `true` | Change value to false if naming the Pod focalboard in your release |
| env | object | See below | environment variables. |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"mattermost/focalboard"` | image repository |
| image.tag | string | `"0.11.0"` | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| service | object | See values.yaml | Configures service settings for the chart. |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [4.2.0]
- Added `enableServiceLinks: true` to values.yaml which is required for the Pod to start successfully if it is named focalboard
- Updated App version to 0.11.0

### [4.0.0]

#### Changed

- Changed image to official mattermost/focalboard image
- Removes unsupported environment variables
- add configmap for config

### [3.0.0]

#### Changed

- Upgraded the common library dependency to version 4.0.0. This introduced (potentially) breaking changes to `initContainers` and `additionalContainers`. Be sure to check out the [library chart](https://github.com/k8s-at-home/library-charts/blob/common-4.0.0/charts/stable/common/) for the up-to-date values.

### [2.0.0]

#### Changed

- **BREAKING**: Upgraded the common library dependency to version 3.0.2. This introduces several breaking changes (`service`, `ingress` and `persistence` keys have been refactored).
  Be sure to check out the [library chart](https://github.com/k8s-at-home/library-charts/blob/common-3.0.2/charts/stable/common/) for the up-to-date values.
- Changed image tag to `0.6.7`.

### [1.0.2]

#### Changed

- Updated icon url

### [1.0.1]

#### Added

- Updated source url

### [1.0.0]

#### Added

- First version of the helm chart for Focalboard

[4.2.0]: #420
[4.0.0]: #400
[3.0.0]: #300
[2.0.0]: #200
[1.0.2]: #102
[1.0.1]: #101
[1.0.0]: #100

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
