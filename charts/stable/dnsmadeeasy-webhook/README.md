# dnsmadeeasy-webhook

![Version: 2.5.0](https://img.shields.io/badge/Version-2.5.0-informational?style=flat-square) ![AppVersion: 1.1.0](https://img.shields.io/badge/AppVersion-1.1.0-informational?style=flat-square)

Cert-Manager Webhook for DNSMadeEasy

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/k8s-at-home/dnsmadeeasy-webhook>
* <https://cert-manager.io>

## Requirements

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://library-charts.k8s-at-home.com | common | 2.5.0 |

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install dnsmadeeasy-webhook k8s-at-home/dnsmadeeasy-webhook
```

## Installing the Chart

To install the chart with the release name `dnsmadeeasy-webhook`

```console
helm install dnsmadeeasy-webhook k8s-at-home/dnsmadeeasy-webhook
```

## Uninstalling the Chart

To uninstall the `dnsmadeeasy-webhook` deployment

```console
helm uninstall dnsmadeeasy-webhook
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install dnsmadeeasy-webhook \
  --set env.TZ="America/New York" \
    k8s-at-home/dnsmadeeasy-webhook
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install dnsmadeeasy-webhook k8s-at-home/dnsmadeeasy-webhook -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| additionalVolumeMounts[0].mountPath | string | `"/tls"` |  |
| additionalVolumeMounts[0].name | string | `"certs"` |  |
| additionalVolumeMounts[0].readOnly | bool | `true` |  |
| args | string | `"[\"--tls-cert-file=/tls/tls.crt\",\"--tls-private-key-file=/tls/tls.key\",\"--secure-port=4443\"]"` |  |
| certManager.namespace | string | `"cert-manager"` | Namespace where the cert-manager operator was installed to |
| certManager.serviceAccountName | string | `"cert-manager"` | Service account used by the cert-manager |
| groupName | string | `"acme.mycompany.com"` | The GroupName here is used to identify your company or business unit that created this webhook. This name will need to be referenced in each Issuer's `webhook` stanza to inform cert-manager of where to send ChallengePayload resources in order to solve the DNS01 challenge. This group name should be **unique**, hence using your own company's domain here is recommended. |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.repository | string | `"ghcr.io/k8s-at-home/dnsmadeeasy-webhook"` | Image repository |
| image.tag | string | `"v1.0.0"` | Image tag |
| probes.liveness.custom | bool | `true` |  |
| probes.liveness.enabled | bool | `true` |  |
| probes.liveness.spec.httpGet.path | string | `"/healthz"` |  |
| probes.liveness.spec.httpGet.port | string | `"https"` |  |
| probes.liveness.spec.httpGet.scheme | string | `"HTTPS"` |  |
| probes.readiness.custom | bool | `true` |  |
| probes.readiness.enabled | bool | `true` |  |
| probes.readiness.spec.httpGet.path | string | `"/healthz"` |  |
| probes.readiness.spec.httpGet.port | string | `"https"` |  |
| probes.readiness.spec.httpGet.scheme | string | `"HTTPS"` |  |
| probes.startup.custom | bool | `true` |  |
| probes.startup.enabled | bool | `true` |  |
| probes.startup.spec.httpGet.path | string | `"/healthz"` |  |
| probes.startup.spec.httpGet.port | string | `"https"` |  |
| probes.startup.spec.httpGet.scheme | string | `"HTTPS"` |  |
| service.port.name | string | `"https"` |  |
| service.port.port | int | `443` |  |
| service.port.targetPort | int | `4443` |  |
| serviceAccount.create | bool | `true` | Create service account |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [1.0.0]

#### Added

- N/A

#### Changed

- First release of chart into k8s-at-home

#### Removed

- N/A

[1.0.0]: #1.0.0

### [1.1.1]

#### Added

- N/A

#### Changed

- Use port 4443 for application

#### Removed

- N/A

[2.3.2]: #2.3.2

### [2.3.2]

#### Changed

- Fix: use created service account

[2.3.2]: #2.3.2

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
