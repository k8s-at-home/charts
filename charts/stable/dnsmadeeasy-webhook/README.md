# dnsmadeeasy-webhook

![Version: 4.0.0](https://img.shields.io/badge/Version-4.0.0-informational?style=flat-square) ![AppVersion: 1.2.0](https://img.shields.io/badge/AppVersion-1.2.0-informational?style=flat-square)

Cert-Manager Webhook for DNSMadeEasy

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/k8s-at-home/dnsmadeeasy-webhook>
* <https://cert-manager.io>

## Requirements

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://charts.jetstack.io | cert-manager | v1.4.2 |
| https://library-charts.k8s-at-home.com | common | 4.0.0 |

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
| cert-manager.enabled | bool | `false` | Install cert-manager chart as dependency. Usually this is already installed in the cluster and not needed. |
| certManager.namespace | string | `"cert-manager"` | Namespace where the cert-manager operator was installed to |
| certManager.serviceAccountName | string | `"cert-manager"` | Service account used by the cert-manager |
| generateCerts | bool | `true` | Generate dedicated certs instead of re-using the cert-manager webhook certificate. |
| groupName | string | `"acme.mycompany.com"` | The GroupName here is used to identify your company or business unit that created this webhook. This name will need to be referenced in each Issuer's `webhook` stanza to inform cert-manager of where to send ChallengePayload resources in order to solve the DNS01 challenge. This group name should be **unique**, hence using your own company's domain here is recommended. |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.repository | string | `"ghcr.io/k8s-at-home/dnsmadeeasy-webhook"` | Image repository |
| image.tag | string | `"v1.2.0"` | Image tag |
| serviceAccount.create | bool | `true` | Create service account |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [4.0.0]

#### Changed

- Upgraded the common library dependency to version 4.0.0. This introduced (potentially) breaking changes to `initContainers` and `additionalContainers`. Be sure to check out the [library chart](https://github.com/k8s-at-home/library-charts/blob/common-4.0.0/charts/stable/common/) for the up-to-date values.

### [3.3.2]

#### Changed

- Fix: remove duplicated name in custome volume - needed for flux2 version > v0.15

### [3.3.1]

#### Changed

- Fix: remove new-line in webhook cert name

### [3.3.0]

#### Added

- Testcases

### [3.1.0]

#### Changed

- Upgrade to webhook 1.2 which uses cert-manager 1.4 and k8s-api 1.21.1
- Grant additional permisions required by webhook since K8S 1.20

### [3.0.3]

#### Changed

- fix webhook port names to match probes

### [3.0.1]

#### Changed

- fix service and arguments syntax

### [3.0.0]

#### Changed

- **BREAKING**: Upgraded the common library dependency to version 3.1.0. This introduces several breaking changes (`service`, `ingress` and `persistence` keys have been refactored).
  Be sure to check out the [library chart](https://github.com/k8s-at-home/library-charts/blob/common-3.1.0/charts/stable/common/) for the up-to-date values.
- moved harcoded values into common.tpl

### [2.3.2]

#### Changed

- Fix: use created service account

### [1.1.1]

#### Changed

- Use port 4443 for application

### [1.0.0]

#### Changed

- First release of chart into k8s-at-home

[4.0.0]: #400
[3.3.2]: #332
[3.3.1]: #331
[3.3.0]: #330
[3.1.0]: #310
[3.0.3]: #303
[3.0.1]: #301
[3.0.0]: #300
[2.3.2]: #232
[1.1.1]: #111
[1.0.0]: #100

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
