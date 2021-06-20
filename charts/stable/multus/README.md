# multus

![Version: 2.0.0](https://img.shields.io/badge/Version-2.0.0-informational?style=flat-square) ![AppVersion: v3.7.1](https://img.shields.io/badge/AppVersion-v3.7.1-informational?style=flat-square)

multus CNI allows multiple NICs per pod

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/k8snetworkplumbingwg/multus-cni>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://library-charts.k8s-at-home.com | common | 3.2.0 |

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install multus k8s-at-home/multus
```

## Installing the Chart

To install the chart with the release name `multus`

```console
helm install multus k8s-at-home/multus
```

## Uninstalling the Chart

To uninstall the `multus` deployment

```console
helm uninstall multus
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install multus \
  --set env.TZ="America/New York" \
    k8s-at-home/multus
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install multus k8s-at-home/multus -f values.yaml
```

## Custom configuration

### Error setting up network for sandbox

If you remove multus by force, the helm uninstall hook will not
be called. In this situation kubelet will still try to call
multus to during the creation of every single pod. you wil see
this error:

```
Failed to create pod sandbox: rpc error: code = Unknown desc = failed to setup network for sandbox
```

If you hit this problem you can manually remove multus config.
For k3s you can do so with:

```sh
rm -rf  /var/lib/rancher/k3s/agent/etc/cni/net.d/*multus*
```

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| args | list | `["--multus-conf-file=auto","--cleanup-config-on-exit=true","--cni-version=0.3.1","--multus-kubeconfig-file-host=/var/lib/rancher/k3s/agent/etc/cni/net.d/multus.d/multus.kubeconfig"]` | Arguments used by the Multus installer. See https://github.com/k8snetworkplumbingwg/multus-cni/blob/master/docs/how-to-use.md If you are not using k3s you will need to adjust the multus-kubeconfig. |
| command | list | `["/entrypoint.sh"]` | Command used by the Multus installer |
| controller.type | string | `"daemonset"` | deploy to all nodes |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"ghcr.io/k8snetworkplumbingwg/multus-cni"` | image repostory |
| image.tag | string | `"v3.7.1"` | image tag |
| initContainers | list | `[{"image":"ghcr.io/k8s-at-home/cni-plugins:v0.9.1","name":"cni-installer","volumeMounts":[{"mountPath":"/host/opt/cni/bin","name":"cnibin"}]}]` | Init container that install reference CNI plugins |
| initContainers[0].image | string | `"ghcr.io/k8s-at-home/cni-plugins:v0.9.1"` | CNI installer image |
| initContainers[0].volumeMounts | list | see values.yaml | Mounts host CNI binary folder |
| persistence | object | see values.yaml | Configures volumes used by the multus installer. Set by default for k3s. |
| probes | object | see values.yaml | Disable probes as installer completes after installing |
| securityContext | object | `{"privileged":true}` | Need to run as privileged to install |
| service | object | see values.yaml | Disable probes as installer completes after installing |
| serviceAccount.create | bool | `true` | create needed service account |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [2.0.0]

#### Changed

- **BREAKING**: Upgraded the common library dependency to version 3.2.0. This introduces several breaking changes (`service`, `ingress` and `persistence` keys have been refactored).
  Be sure to check out the [library chart](https://github.com/k8s-at-home/library-charts/blob/common-3.2.0/charts/stable/common/) for the up-to-date values.

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
