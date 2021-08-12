# reverse-proxy

![Version: 2.0.0](https://img.shields.io/badge/Version-2.0.0-informational?style=flat-square) ![AppVersion: 1.2.0](https://img.shields.io/badge/AppVersion-1.2.0-informational?style=flat-square)

Creates ingress reverse-proxies for external hosts with minimum boilerplate

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://kubernetes.io/docs/concepts/services-networking/ingress/>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://library-charts.k8s-at-home.com | common | 4.0.0 |

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install reverse-proxy k8s-at-home/reverse-proxy
```

## Installing the Chart

To install the chart with the release name `reverse-proxy`

```console
helm install reverse-proxy k8s-at-home/reverse-proxy
```

## Uninstalling the Chart

To uninstall the `reverse-proxy` deployment

```console
helm uninstall reverse-proxy
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install reverse-proxy \
  --set env.TZ="America/New York" \
    k8s-at-home/reverse-proxy
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install reverse-proxy k8s-at-home/reverse-proxy -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| connectionTest.readtimeout | int | `2` | second to wait in case no data is received and then try again |
| connectionTest.tries | int | `30` | tries to connect |
| connectionTest.waitretry | int | `2` | seconds to wait before next retry |
| generateTLS.enabled | bool | `true` | Enable automatic generation of ingress TLS section based on ingress.hosts.*.host |
| generateTLS.secretName | string | default ingress TLS certificate | certificate to use |
| ingressPort.http | int | `80` | Ingress port for non-TLS |
| ingressPort.tls | int | `443` | Ingress port for TLS |
| instances[0].enabled | bool | true | enable this reverse proxy. |
| instances[0].externalName | string | `"google.com"` | host name behind this reverse proxy |
| instances[0].ingress.annotations | object | `{}` | Provide additional annotations which may be required |
| instances[0].ingress.hosts[0].host | string | `"example.cluster.local"` |  |
| instances[0].ingress.hosts[0].path | string | / | Path.  Helm template can be passed |
| instances[0].ingress.tls | list | `[{"hosts":["example.cluster.local"],"secretName":null}]` | Configure TLS for the ingress. Both secretName and hosts can process a Helm template. if not set the generateTLS settigs are used |
| instances[0].ip | string | `"192.168.1.1"` | IP address behind this reverse proxy Has no effect if externalName is set |
| instances[0].name | string | `"example"` |  |
| instances[0].port | int | 80 | Port used by host behind this reverse proxy |
| instances[0].test | bool | true | add a test for this reverse proxy. It can be tested with `helm test <chart_name>` |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [2.0.0]

#### Changed

- Upgraded the common library dependency to version 4.0.0. This introduced (potentially) breaking changes to `initContainers` and `additionalContainers`. Be sure to check out the [library chart](https://github.com/k8s-at-home/library-charts/blob/common-4.0.0/charts/stable/common/) for the up-to-date values.

### [1.0.0]

#### Added

- Initial version

[2.0.0]: #200
[1.0.0]: #100

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
