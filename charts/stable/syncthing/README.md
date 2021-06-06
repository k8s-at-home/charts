# syncthing

![Version: 1.3.1](https://img.shields.io/badge/Version-1.3.1-informational?style=flat-square) ![AppVersion: 1.17.0](https://img.shields.io/badge/AppVersion-1.17.0-informational?style=flat-square)

Open Source Continuous File Synchronization

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://syncthing.net/>
* <https://github.com/syncthing/syncthing>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://library-charts.k8s-at-home.com | common | 2.5.0 |

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install syncthing k8s-at-home/syncthing
```

## Installing the Chart

To install the chart with the release name `syncthing`

```console
helm install syncthing k8s-at-home/syncthing
```

## Uninstalling the Chart

To uninstall the `syncthing` deployment

```console
helm uninstall syncthing
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install syncthing \
  --set env.TZ="America/New York" \
    k8s-at-home/syncthing
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install syncthing k8s-at-home/syncthing -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"syncthing/syncthing"` |  |
| image.tag | string | `"1.17.0"` |  |
| ingress.enabled | bool | `false` |  |
| persistence.data.emptyDir.enabled | bool | `false` |  |
| persistence.data.enabled | bool | `false` |  |
| persistence.data.mountPath | string | `"/var/syncthing"` |  |
| service.additionalServices[0].enabled | bool | `true` |  |
| service.additionalServices[0].externalTrafficPolicy | string | `"Local"` |  |
| service.additionalServices[0].nameSuffix | string | `"listen"` |  |
| service.additionalServices[0].port.name | string | `"listen"` |  |
| service.additionalServices[0].port.port | int | `22000` |  |
| service.additionalServices[0].port.protocol | string | `"TCP"` |  |
| service.additionalServices[0].port.targetPort | int | `22000` |  |
| service.additionalServices[0].type | string | `"NodePort"` |  |
| service.additionalServices[1].enabled | bool | `true` |  |
| service.additionalServices[1].externalTrafficPolicy | string | `"Local"` |  |
| service.additionalServices[1].nameSuffix | string | `"discovery"` |  |
| service.additionalServices[1].port.name | string | `"discovery"` |  |
| service.additionalServices[1].port.port | int | `21027` |  |
| service.additionalServices[1].port.protocol | string | `"UDP"` |  |
| service.additionalServices[1].port.targetPort | int | `21027` |  |
| service.additionalServices[1].type | string | `"NodePort"` |  |
| service.port.port | int | `8384` |  |
| strategy.type | string | `"Recreate"` |  |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [1.3.1]

#### Added

- N/A

#### Changed

- Updated syncthing container image version to `v1.17.0`.

#### Removed

- N/A

### [1.3.0]

#### Added

- N/A

#### Changed

- Updated syncthing container image version to `v1.16.1`.
- Updated common chart dependency to `2.5.0`.

#### Removed

- N/A

### [1.1.2]

#### Added

- N/A

#### Changed

- Updated icon url.

#### Removed

- N/A

### [1.0.0]

#### Added

- First version of the helm chart for syncthing

#### Changed

- N/A

#### Removed

- N/A

[1.3.1]: #1.3.1
[1.3.0]: #1.3.0
[1.1.2]: #1.1.2
[1.0.0]: #1.0.0

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
