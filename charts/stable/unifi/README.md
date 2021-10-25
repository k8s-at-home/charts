# unifi

![Version: 4.2.4](https://img.shields.io/badge/Version-4.2.4-informational?style=flat-square) ![AppVersion: v6.2.26](https://img.shields.io/badge/AppVersion-v6.2.26-informational?style=flat-square)

Ubiquiti Network's Unifi Controller

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/jacobalberty/unifi-docker>

## Requirements

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | mongodb | 10.25.2 |
| https://library-charts.k8s-at-home.com | common | 4.0.1 |

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install unifi k8s-at-home/unifi
```

## Installing the Chart

To install the chart with the release name `unifi`

```console
helm install unifi k8s-at-home/unifi
```

## Uninstalling the Chart

To uninstall the `unifi` deployment

```console
helm uninstall unifi
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install unifi \
  --set env.TZ="America/New York" \
    k8s-at-home/unifi
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install unifi k8s-at-home/unifi -f values.yaml
```

## Custom configuration

### Running with separate MongoDB

By default the Unifi controller runs an internal MongoDB.
If you wish to run the chart with a separate MongoDB instance our chart provides the option to enable a MongoDB instance by adding the following in your `values.yaml`:

```yaml
mongodb:
  enabled: true
```

(For more configuration options see the [mongodb chart documentation](https://github.com/bitnami/charts/tree/master/bitnami/mongodb).)

If you do not specify any other configuration, the required environment variables will be inferred automatically.
It is also possible to override the environment variables to configure the image. See [here](https://github.com/jacobalberty/unifi-docker#external-mongodb-environment-variables) for more details.

### Regarding the services

By default it is not possible to combine TCP and UDP ports on a service with `type: LoadBalancer`. This can be solved in a number of ways:

1. Create a separate service containing the UDP ports. This could be done by setting disabling the UDP ports under `service.main.ports` and adding the following in your `values.yaml`:

```yaml
service:
  udp:
    enabled: true
    type: LoadBalancer
    # <your other service configuration>
    ports:
      stun:
        enabled: true
        port: 3478
        protocol: UDP
      syslog:
        enabled: true
        port: 5514
        protocol: UDP
      discovery:
        enabled: true
        port: 10001
        protocol: UDP
```

2. Since Kubernetes 1.20 there is a feature gate that can be enabled to allow TCP and UDP ports to coexist on Services with `type: Loadbalancer`.
   You will need to enable the `MixedProtocolLBService` feature gate in order to achieve this.

   For more information about feature gates, please see [the docs](https://kubernetes.io/docs/reference/command-line-tools-reference/feature-gates/).

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env | object | See below | environment variables. See more environment variables in the [image documentation](https://github.com/jacobalberty/unifi-docker#environment-variables). |
| env.JVM_INIT_HEAP_SIZE | string | `nil` | Java Virtual Machine (JVM) initial, and minimum, heap size Unset value means there is no lower limit |
| env.JVM_MAX_HEAP_SIZE | string | `"1024M"` | Java Virtual Machine (JVM) maximum heap size For larger installations a larger value is recommended. For memory constrained system this value can be lowered. |
| env.RUNAS_UID0 | string | `"false"` | Run UniFi as root |
| env.TZ | string | `"UTC"` | Set the container timezone |
| env.UNIFI_GID | string | `"999"` | Specify the group ID the application will run as |
| env.UNIFI_UID | string | `"999"` | Specify the user ID the application will run as |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"jacobalberty/unifi"` | image repository |
| image.tag | string | `"v6.2.26"` | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| ingress.portal | object | See values.yaml | Enable and configure settings for the captive portal ingress under this key. |
| mongodb | object | See values.yaml | Enable and configure mongodb database subchart under this key.    For more options see [mongodb chart documentation](https://github.com/bitnami/charts/tree/master/bitnami/mongodb) |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| service | object | See values.yaml | Configures service settings for the chart. |
| service.main.ports.controller | object | See values.yaml | Configure Controller port used for device command/control |
| service.main.ports.discovery | object | See values.yaml | Configure device discovery port |
| service.main.ports.http | object | See values.yaml | Configure Web interface + API port |
| service.main.ports.portal-http | object | See values.yaml | Configure Captive Portal HTTP port |
| service.main.ports.portal-https | object | See values.yaml | Configure Captive Portal HTTPS port |
| service.main.ports.speedtest | object | See values.yaml | Configure Speedtest port (used for UniFi mobile speed test) |
| service.main.ports.stun | object | See values.yaml | Configure STUN port |
| service.main.ports.syslog | object | See values.yaml | Configure remote syslog port |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [4.2.2]

### Fixed

- Move HTTPS protocol declaration for default web UI port from ingress annotations to service port attribute.

### [4.0.0]

#### Changed

- Upgraded the common library dependency to version 4.0.0. This introduced (potentially) breaking changes to `initContainers` and `additionalContainers`. Be sure to check out the [library chart](https://github.com/k8s-at-home/library-charts/blob/common-4.0.0/charts/stable/common/) for the up-to-date values.

### [3.1.0]

#### Added

- Support for running with an external MongoDB instance has been reimplemented.

#### Fixed

- The chart is now compatible again with PVC's that were created with chart versions < 3.0.0.

### [3.0.0]

#### Changed

- **BREAKING**: Migrated chart to common library. This means that there are many things that work different from before. Please check the `values.yaml` file for the current implementation.
- Changed image tag to `v6.2.26`.

#### Removed

- **BREAKING**: Removed support for deploying a separate MongoDB instance.
- **BREAKING**: Removed support for specifying custom configMaps in chart values.
- **BREAKING**: Removed chart-specific Promtail implementation. This can be replaced by using the common library charts Promtail add-on.

### [2.0.4]

#### Changed

- Bump controller version to 6.2.25

### [2.0.2]

#### Fixed

- Separate syslog service is only created when enabled and unifiedService is disabled.

### [2.0.1]

#### Changed

- Updated icon url

### [1.5.3]

#### Changed

- Use helm-docs

[4.0.0]: #400
[3.1.0]: #310
[3.0.0]: #300
[2.0.4]: #204
[2.0.2]: #202
[2.0.1]: #201
[1.5.3]: #153

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/introduction/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
