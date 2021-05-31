# pod-gateway-setter

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

Admision controller to change the default gateway and DNS server of PODs

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/pod-gateway-setter/pod-gateway-setter-docker>

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
helm install pod-gateway-setter k8s-at-home/pod-gateway-setter
```

## Installing the Chart

To install the chart with the release name `pod-gateway-setter`

```console
helm install pod-gateway-setter k8s-at-home/pod-gateway-setter
```

## Uninstalling the Chart

To uninstall the `pod-gateway-setter` deployment

```console
helm uninstall pod-gateway-setter
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install pod-gateway-setter \
  --set env.TZ="America/New York" \
    k8s-at-home/pod-gateway-setter
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install pod-gateway-setter k8s-at-home/pod-gateway-setter -f values.yaml
```

## Custom configuration

You need to set `gateway` to the hostname or address of your gateway. Then
all PODs in namespaces with the matching label (`routed-gateway=true` by default)
will be processed by the webhook.

The webhook by default changes all processed pods (remove `--setGatewayDefault`
if you want to change the default). You can also change the default for a
POD by adding a label or annotation (`setGateway` by default).

Processed PODs will get their default gateway changed. DNS server will
also be set to the gateway (at least the option `--keepDNS` is used).

Multiple instances of this chart might be installed that use different label
values. This is usufull, for example, to route multiple pod groups, each with
a different gateway.

**IMPORTANT**: Do not deploy this chart to a namespace controlled by this
webhook. This would result in a likelly deathlock when upgrading the chart.

**NOTE**: This char requires the cert-manager CRD to generate the required
certificates.

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| additionalVolumeMounts[0].mountPath | string | `"/tls"` |  |
| additionalVolumeMounts[0].name | string | `"certs"` |  |
| additionalVolumeMounts[0].readOnly | bool | `true` |  |
| args[0] | string | `"--tls-cert-file-path=/tls/tls.crt"` |  |
| args[1] | string | `"--tls-key-file-path=/tls/tls.key"` |  |
| args[2] | string | `"--setGatewayDefault"` |  |
| args[3] | string | `"--setGatewayLabel=setGateway"` |  |
| args[4] | string | `"--setGatewayAnnotation=setGateway"` |  |
| gateway | string | `"10.0.2.7"` | Gateway to route traffic to. Can be an hostname or an IP |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"ghcr.io/k8s-at-home/gateway-admision-controller"` |  |
| image.tag | string | `"v2.0.0"` |  |
| ingress.enabled | bool | `false` |  |
| namespaceSelector | object | `{"matchLabels":{"routed-gateway":"true"}}` | Selector for namespace. All pods in this namespace will get their default gateway changed |
| probes.liveness.custom | bool | `true` |  |
| probes.liveness.enabled | bool | `true` |  |
| probes.liveness.spec.failureThreshold | int | `5` |  |
| probes.liveness.spec.httpGet.path | string | `"/wh/health"` |  |
| probes.liveness.spec.httpGet.port | int | `8080` |  |
| probes.liveness.spec.httpGet.scheme | string | `"HTTPS"` |  |
| probes.liveness.spec.initialDelaySeconds | int | `1` |  |
| probes.liveness.spec.timeoutSeconds | int | `10` |  |
| probes.readiness.custom | bool | `true` |  |
| probes.readiness.enabled | bool | `true` |  |
| probes.readiness.spec.failureThreshold | int | `5` |  |
| probes.readiness.spec.httpGet.path | string | `"/wh/health"` |  |
| probes.readiness.spec.httpGet.port | int | `8080` |  |
| probes.readiness.spec.httpGet.scheme | string | `"HTTPS"` |  |
| probes.readiness.spec.initialDelaySeconds | int | `1` |  |
| probes.readiness.spec.timeoutSeconds | int | `10` |  |
| probes.startup.custom | bool | `true` |  |
| probes.startup.enabled | bool | `false` |  |
| probes.startup.spec.failureThreshold | int | `30` |  |
| probes.startup.spec.httpGet.path | string | `"/wh/health"` |  |
| probes.startup.spec.httpGet.port | int | `8080` |  |
| probes.startup.spec.httpGet.scheme | string | `"HTTPS"` |  |
| probes.startup.spec.periodSeconds | int | `1` |  |
| service.port.path | string | `"/wh/mutating/setgateway"` |  |
| service.port.port | int | `8080` |  |
| strategy.type | string | `"RollingUpdate"` |  |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [1.0.0]

#### Added

- Initial version

#### Changed

- N/A

#### Removed

- N/A

[1.0.0]: #1.0.0

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
