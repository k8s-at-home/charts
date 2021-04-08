# calibre

![Version: 3.1.1](https://img.shields.io/badge/Version-3.1.1-informational?style=flat-square) ![AppVersion: 5.14.0](https://img.shields.io/badge/AppVersion-5.14.0-informational?style=flat-square)

Calibre is a powerful and easy to use e-book manager.

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://hub.docker.com/r/linuxserver/calibre/>
* <https://github.com/kovidgoyal/calibre/>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://library-charts.k8s-at-home.com | common | 2.2.0 |

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install calibre k8s-at-home/calibre
```

## Installing the Chart

To install the chart with the release name `calibre`

```console
helm install calibre k8s-at-home/calibre
```

## Uninstalling the Chart

To uninstall the `calibre` deployment

```console
helm uninstall calibre
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install calibre \
  --set env.TZ="America/New York" \
    k8s-at-home/calibre
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install calibre k8s-at-home/calibre -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env.CLI_ARGS | string | `nil` | Optionally pass cli start arguments to calibre. |
| env.GUAC_PASS | string | `nil` | Password's md5 hash for the calibre gui |
| env.GUAC_USER | string | `nil` | Username for the calibre gui |
| env.PGID | string | `"1000"` | for GroupID |
| env.PUID | string | `"1000"` | for UserID |
| env.TZ | string | `nil` | Set the time zone, e.g. Europe/Amsterdam |
| env.UMASK_SET | string | `"022"` | for umask setting of Calibre, default if left unset is 022. |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"linuxserver/calibre"` |  |
| image.tag | string | `"version-v5.14.0"` |  |
| ingress.enabled | bool | `false` |  |
| persistence.config.emptyDir.enabled | bool | `false` |  |
| persistence.config.enabled | bool | `false` |  |
| service.additionalServices[0].enabled | bool | `false` |  |
| service.additionalServices[0].nameSuffix | string | `"webserver"` |  |
| service.additionalServices[0].port.name | string | `"webserver"` |  |
| service.additionalServices[0].port.port | int | `8081` |  |
| service.additionalServices[0].port.protocol | string | `"TCP"` |  |
| service.additionalServices[0].port.targetPort | int | `8081` |  |
| service.additionalServices[0].type | string | `"ClusterIP"` |  |
| service.port | object | `{"name":"gui","port":8080}` | The default port is 8080 |
| strategy.type | string | `"Recreate"` |  |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [3.1.1]

#### Fixed

- Change `additionalPorts` to `additionalServices`

### [3.0.0]

#### Added

- Added additional port to the service for when calibre-server is running.

#### Changed

- Updated default image tag to `version-v5.14.0`
- Renamed default port from `desktopgui` to `gui`

#### Removed

- Removed default `nodeSelector`
- Removed default values for `accessMode` and `size` under `persistence.config`.

### [1.0.0]

#### Added

- Initial version

[3.1.1]: #3.1.1
[3.0.0]: #3.0.0
[1.0.0]: #1.0.0

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)