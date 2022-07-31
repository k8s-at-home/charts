# teamspeak

![Version: 0.7.0](https://img.shields.io/badge/Version-0.7.0-informational?style=flat-square) ![AppVersion: 3.13.6](https://img.shields.io/badge/AppVersion-3.13.6-informational?style=flat-square)

TeamSpeak Server

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://hub.docker.com/_/teamspeak>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://library-charts.k8s-at-home.com | common | 4.5.0 |

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install teamspeak k8s-at-home/teamspeak
```

## Installing the Chart

To install the chart with the release name `teamspeak`

```console
helm install teamspeak k8s-at-home/teamspeak
```

## Uninstalling the Chart

To uninstall the `teamspeak` deployment

```console
helm uninstall teamspeak
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install teamspeak \
  --set env.TZ="America/New York" \
    k8s-at-home/teamspeak
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install teamspeak k8s-at-home/teamspeak -f values.yaml
```

## Custom configuration

### Regarding the services

By default, it is not yet possible to combine TCP and UDP ports on a service with `type: LoadBalancer`. This can be solved in a number of ways:

1. Create a separate service containing the UDP ports. This could be done by disabling the UDP ports under `service.main.ports` and adding the following in your `values.yaml`:

```yaml
service:
  udp:
    enabled: true
    type: LoadBalancer
    # <your other service configuration>
    ports:
      voice:
        enabled: true
        port: 9987
        protocol: UDP
```

2. Since Kubernetes 1.20 there is a feature gate that can be enabled to allow TCP and UDP ports to coexist on Services with `type: Loadbalancer`.
   You will need to enable the `MixedProtocolLBService` feature gate in order to achieve this.

   For more information about feature gates, please see [the docs](https://kubernetes.io/docs/reference/command-line-tools-reference/feature-gates/).

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env | object | See below | environment variables. See more environment variables in the [teamspeak image documentation](https://hub.docker.com/_/teamspeak). |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"teamspeak"` | image repository |
| image.tag | string | `"3.13.6"` | image tag |
| metrics.enabled | bool | See values.yaml | Enable and configure ts3exporter sidecar and Prometheus serviceMonitor. |
| metrics.exporter.env.enableChannelMetrics | bool | `false` | Set to true to enable gathering of channel metrics |
| metrics.exporter.env.port | int | `9189` | metrics port |
| metrics.exporter.env.remote | string | `"localhost:10011"` | TeamSpeak query endpoint |
| metrics.exporter.image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| metrics.exporter.image.repository | string | `"quay.io/ricardbejarano/ts3exporter"` | image repository |
| metrics.exporter.image.tag | string | `"0.0.7"` | image tag |
| metrics.prometheusRule | object | See values.yaml | Enable and configure Prometheus Rules for the chart under this key. |
| metrics.prometheusRule.rules | list | See prometheusrules.yaml | Configure additionial rules for the chart under this key. |
| metrics.serviceMonitor.interval | string | `"1m"` |  |
| metrics.serviceMonitor.labels | object | `{}` |  |
| metrics.serviceMonitor.scrapeTimeout | string | `"30s"` |  |
| nodeSelector | object | `{"kubernetes.io/arch":"amd64"}` | The TeamSpeak server binary is only available for x86_64. |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| probes.liveness.custom | bool | `true` |  |
| probes.liveness.spec.tcpSocket.port | int | `10011` |  |
| probes.readiness.custom | bool | `true` |  |
| probes.readiness.spec.tcpSocket.port | int | `10011` |  |
| probes.startup.custom | bool | `true` |  |
| probes.startup.spec.tcpSocket.port | int | `10011` |  |
| service | object | See values.yaml | Configures service settings for the chart. |

## Changelog

### Version 0.7.0

#### Added

N/A

#### Changed

* Upgraded `common` chart dependency to version 4.5.0

#### Fixed

N/A

### Older versions

A historical overview of changes can be found on [ArtifactHUB](https://artifacthub.io/packages/helm/k8s-at-home/teamspeak?modal=changelog)

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v0.1.1](https://github.com/k8s-at-home/helm-docs/releases/v0.1.1)
