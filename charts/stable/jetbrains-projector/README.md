# jetbrains-projector

![Version: 3.0.1](https://img.shields.io/badge/Version-3.0.1-informational?style=flat-square)

Projector is a technology to run and access JetBrains IDEs remotely

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/JetBrains/projector-server>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://library-charts.k8s-at-home.com | common | 4.0.1 |

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install jetbrains-projector k8s-at-home/jetbrains-projector
```

## Installing the Chart

To install the chart with the release name `jetbrains-projector`

```console
helm install jetbrains-projector k8s-at-home/jetbrains-projector
```

## Uninstalling the Chart

To uninstall the `jetbrains-projector` deployment

```console
helm uninstall jetbrains-projector
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install jetbrains-projector \
  --set env.TZ="America/New York" \
    k8s-at-home/jetbrains-projector
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install jetbrains-projector k8s-at-home/jetbrains-projector -f values.yaml
```

## Custom configuration
  These environment variables will set write and read-only keys respectively:
  ```yaml
  env:
    ORG_JETBRAINS_PROJECTOR_SERVER_HANDSHAKE_TOKEN: "admin-password"
    ORG_JETBRAINS_PROJECTOR_SERVER_RO_HANDSHAKE_TOKEN: "read-only-password"
  ```

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env | object | See below | environment variables. See [image docs](https://github.com/JetBrains/projector-docker) for more details. |
| env.TZ | string | `"UTC"` | Set the container timezone |
| idea | object | `{}` | IDE settings overrides. See the prospective IDE docs (like pycharm)[https://www.jetbrains.com/help/pycharm/tuning-the-ide.html#common-platform-properties] for more info. Default config paths will be /config/* E.G. `idea.system.path=/config/system` |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.registry | string | `"ghcr.io/k8s-at-home"` | image registry |
| image.repository | string | `""` | image repository. *MUST SPECIFY AN IMAGE* |
| image.tag | string | `"v2021.1"` | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| service | object | See values.yaml | Configures service settings for the chart. |
| sslGen.certs.crt | string | `"tls.crt"` | key that holds the tls crt |
| sslGen.certs.key | string | `"tls.key"` | key that holds the tls key |
| sslGen.certs.secret | string | `""` | name of secret to mount that has the TLS certs |
| sslGen.enabled | bool | `false` | enable automatic conversion of mounted TLS certs to JKS for WSS protocol |
| sslGen.jks.dest | string | `"/tmp/cert.jks"` | location of generated cert.jks used |
| sslGen.properties.existingSecret | string | `""` | pre-existing ssl.properties secret |
| sslGen.properties.key | string | `"ssl.properties"` | key that holds ssl.properties file |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [3.0.0]

#### Changed

- Upgraded the common library dependency to version 4.0.0. This introduced (potentially) breaking changes to `initContainers` and `additionalContainers`. Be sure to check out the [library chart](https://github.com/k8s-at-home/library-charts/blob/common-4.0.0/charts/stable/common/) for the up-to-date values.

### [2.0.0]

#### Changed

- **BREAKING**: Upgraded the common library dependency to version 3.2.0. This introduces several breaking changes (`service`, `ingress` and `persistence` keys have been refactored).
  Be sure to check out the [library chart](https://github.com/k8s-at-home/library-charts/blob/common-3.2.0/charts/stable/common/) for the up-to-date values.

### [1.0.0]

#### Added

- Initial version

[3.0.0]: #300
[2.0.0]: #200
[1.0.0]: #100

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/introduction/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
