# lancache

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

LanCache Monolithic - a caching proxy server for game download content

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/lancachenet/monolithic>
* <https://hub.docker.com/r/lancachenet/monolithic>
* <https://hub.docker.com/r/lancachenet/lancache-dns>

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
helm install lancache k8s-at-home/lancache
```

## Installing the Chart

To install the chart with the release name `lancache`

```console
helm install lancache k8s-at-home/lancache
```

## Uninstalling the Chart

To uninstall the `lancache` deployment

```console
helm uninstall lancache
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install lancache \
  --set env.TZ="America/New York" \
    k8s-at-home/lancache
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install lancache k8s-at-home/lancache -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| dns.enabled | bool | See values.yaml | Enable and configure LanCache DNS sidecar. |
| dns.env | object | `{}` | environment variables. See more environment variables in the [LanCache DNS documentation](https://lancache.net/docs/containers/dns/variables/). Most are inherited from the top-level `env`. `LANCACHE_IP` is auto-generated from the `loadBalancerIP` if specified. |
| dns.image.pullPolicy | string | `"Always"` | image pull policy |
| dns.image.repository | string | `"lancachenet/lancache-dns"` | image repository |
| dns.image.tag | string | `"latest"` | image tag |
| dnsConfig.nameservers[0] | string | `"127.0.0.1"` |  |
| dnsPolicy | string | `"None"` | LanCache uses custom upstream nameservers, overridable with the `UPSTREAM_DNS` variable. |
| env | object | See below | environment variables. See more environment variables in the [LanCache Monolithic documentation](https://lancache.net/docs/containers/monolithic/variables/). |
| image.pullPolicy | string | `"Always"` | image pull policy |
| image.repository | string | `"lancachenet/monolithic"` | image repository |
| image.tag | string | `"latest"` | image tag |
| nodeSelector | object | `{"kubernetes.io/arch":"amd64"}` | The official LanCache image is only available for x86_64. |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| probes.liveness.custom | bool | `true` |  |
| probes.liveness.spec.httpGet.path | string | `"/lancache-heartbeat"` |  |
| probes.liveness.spec.httpGet.port | int | `80` |  |
| probes.readiness.custom | bool | `true` |  |
| probes.readiness.spec.httpGet.path | string | `"/lancache-heartbeat"` |  |
| probes.readiness.spec.httpGet.port | int | `80` |  |
| probes.startup.custom | bool | `true` |  |
| probes.startup.spec.httpGet.path | string | `"/lancache-heartbeat"` |  |
| probes.startup.spec.httpGet.port | int | `80` |  |
| service | object | See values.yaml | Configures service settings for the chart. |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [0.1.0]

#### Added

- Initial version

#### Changed

- N/A

#### Removed

- N/A

[0.1.0]: #010

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
