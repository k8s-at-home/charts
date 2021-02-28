# common

![Version: 3.1.0](https://img.shields.io/badge/Version-3.1.0-informational?style=flat-square) ![Type: library](https://img.shields.io/badge/Type-library-informational?style=flat-square)

Function library for k8s-at-home charts

**WARNING: THIS CHART IS NOT MEANT TO BE INSTALLED DIRECTLY**

This is a [Helm Library Chart](https://helm.sh/docs/topics/library_charts/#helm). It's purpose is for grouping common logic between the k8s@home charts.

Since a lot of charts follow the same pattern this library was built to reduce maintenance cost between the charts that use it and try achieve a goal of being DRY.

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install common k8s-at-home/common
```

## Installing the Chart

To install the chart with the release name `common`

```console
helm install common k8s-at-home/common
```

## Uninstalling the Chart

To uninstall the `common` deployment

```console
helm uninstall common
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](../common/values.yaml) from the [common library](../common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install common \
  --set env.TZ="America/New York" \
    k8s-at-home/common
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install common k8s-at-home/common -f values.yaml
```

## Creating a new chart

First be sure to checkout the many charts that already use this like [qBittorrent](../qbittorrent/), [node-red](../node-red/) or the many others in this repository.

Include this chart as a dependency in your `Chart.yaml` e.g.

```yaml
# Chart.yaml
dependencies:
- name: common
  version: 3.1.0
  repository: https://k8s-at-home.com/charts/
```
Write a `values.yaml` with some basic defaults you want to present to the user e.g.

```yaml
#
# IMPORTANT NOTE
#
# This chart inherits from our common library chart. You can check the default values/options here:
# https://github.com/k8s-at-home/charts/tree/master/charts/common/values.yaml
#

image:
  repository: nodered/node-red
  pullPolicy: IfNotPresent
  tag: 1.2.5

strategy:
  type: Recreate

# See more environment variables in the node-red documentation
# https://nodered.org/docs/getting-started/docker
env: {}
  # TZ:
  # NODE_OPTIONS:
  # NODE_RED_ENABLE_PROJECTS:
  # NODE_RED_ENABLE_SAFE_MODE:
  # FLOWS:

service:
  port:
    port: 1880

ingress:
  enabled: false

persistence:
  data:
    enabled: false
    emptyDir: false
    mountPath: /data
```

If not using a service, set the `service.enabled` to `false`.
```yaml
...
service:
  enabled: false
...
```

Add files to the `templates` folder.
```yaml
# templates/common.yaml
{{ include "common.all . }}

# templates/NOTES.txt
{{ include "common.notes.defaultNotes" . }}
```

If testing locally make sure you update the dependencies with:

```bash
helm dependency update
```

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/charts/tree/master/charts/common/)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| additionalContainers | list | `[]` |  |
| additionalVolumeMounts | list | `[]` |  |
| additionalVolumes | list | `[]` |  |
| addons.codeserver.args[0] | string | `"--auth"` |  |
| addons.codeserver.args[1] | string | `"none"` |  |
| addons.codeserver.enabled | bool | `false` |  |
| addons.codeserver.env | object | `{}` |  |
| addons.codeserver.image.pullPolicy | string | `"IfNotPresent"` |  |
| addons.codeserver.image.repository | string | `"codercom/code-server"` |  |
| addons.codeserver.image.tag | string | `"3.7.4"` |  |
| addons.codeserver.ingress.annotations | object | `{}` |  |
| addons.codeserver.ingress.enabled | bool | `false` |  |
| addons.codeserver.ingress.hosts[0].host | string | `"code.chart-example.local"` |  |
| addons.codeserver.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| addons.codeserver.ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| addons.codeserver.ingress.labels | object | `{}` |  |
| addons.codeserver.ingress.nameSuffix | string | `"codeserver"` |  |
| addons.codeserver.ingress.tls | list | `[]` |  |
| addons.codeserver.securityContext.runAsUser | int | `0` |  |
| addons.codeserver.service.annotations | object | `{}` |  |
| addons.codeserver.service.enabled | bool | `true` |  |
| addons.codeserver.service.labels | object | `{}` |  |
| addons.codeserver.service.port.name | string | `"codeserver"` |  |
| addons.codeserver.service.port.port | int | `12321` |  |
| addons.codeserver.service.port.protocol | string | `"TCP"` |  |
| addons.codeserver.service.port.targetPort | string | `"codeserver"` |  |
| addons.codeserver.service.type | string | `"ClusterIP"` |  |
| addons.codeserver.volumeMounts | list | `[]` |  |
| addons.codeserver.workingDir | string | `""` |  |
| addons.vpn.additionalVolumeMounts | list | `[]` |  |
| addons.vpn.configFile | string | `nil` |  |
| addons.vpn.enabled | bool | `false` |  |
| addons.vpn.env | object | `{}` |  |
| addons.vpn.livenessProbe | object | `{}` |  |
| addons.vpn.networkPolicy.egress | string | `nil` |  |
| addons.vpn.networkPolicy.enabled | bool | `false` |  |
| addons.vpn.openvpn.auth | string | `nil` |  |
| addons.vpn.openvpn.authSecret | string | `nil` |  |
| addons.vpn.openvpn.image.pullPolicy | string | `"IfNotPresent"` |  |
| addons.vpn.openvpn.image.repository | string | `"dperson/openvpn-client"` |  |
| addons.vpn.openvpn.image.tag | string | `"latest"` |  |
| addons.vpn.scripts.down | string | `nil` |  |
| addons.vpn.scripts.up | string | `nil` |  |
| addons.vpn.securityContext.capabilities.add[0] | string | `"NET_ADMIN"` |  |
| addons.vpn.securityContext.capabilities.add[1] | string | `"SYS_MODULE"` |  |
| addons.vpn.type | string | `"openvpn"` |  |
| addons.vpn.wireguard.image.pullPolicy | string | `"IfNotPresent"` |  |
| addons.vpn.wireguard.image.repository | string | `"k8sathome/wireguard"` |  |
| addons.vpn.wireguard.image.tag | string | `"1.0.20200827"` |  |
| affinity | object | `{}` |  |
| args | list | `[]` |  |
| command | list | `[]` |  |
| controllerAnnotations | object | `{}` |  |
| controllerLabels | object | `{}` |  |
| controllerType | string | `"deployment"` |  |
| dnsPolicy | string | `"ClusterFirst"` |  |
| enableServiceLinks | bool | `true` |  |
| env | object | `{}` |  |
| envFrom | list | `[]` |  |
| envTpl | object | `{}` |  |
| envValueFrom | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| hostAliases | list | `[]` |  |
| hostNetwork | bool | `false` |  |
| ingress.additionalIngresses | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| ingress.labels | object | `{}` |  |
| ingress.tls | list | `[]` |  |
| initContainers | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| persistence.config.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.config.enabled | bool | `false` |  |
| persistence.config.mountPath | string | `"/config"` |  |
| persistence.config.size | string | `"1Gi"` |  |
| persistence.config.skipuninstall | bool | `false` |  |
| persistence.shared.emptyDir | bool | `true` |  |
| persistence.shared.enabled | bool | `false` |  |
| persistence.shared.mountPath | string | `"/shared"` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| probes.liveness.custom | bool | `false` |  |
| probes.liveness.enabled | bool | `true` |  |
| probes.liveness.spec.failureThreshold | int | `3` |  |
| probes.liveness.spec.initialDelaySeconds | int | `0` |  |
| probes.liveness.spec.periodSeconds | int | `10` |  |
| probes.liveness.spec.timeoutSeconds | int | `1` |  |
| probes.readiness.custom | bool | `false` |  |
| probes.readiness.enabled | bool | `true` |  |
| probes.readiness.spec.failureThreshold | int | `3` |  |
| probes.readiness.spec.initialDelaySeconds | int | `0` |  |
| probes.readiness.spec.periodSeconds | int | `10` |  |
| probes.readiness.spec.timeoutSeconds | int | `1` |  |
| probes.startup.custom | bool | `false` |  |
| probes.startup.enabled | bool | `true` |  |
| probes.startup.spec.failureThreshold | int | `30` |  |
| probes.startup.spec.initialDelaySeconds | int | `0` |  |
| probes.startup.spec.periodSeconds | int | `5` |  |
| probes.startup.spec.timeoutSeconds | int | `1` |  |
| replicas | int | `1` |  |
| resources | object | `{}` |  |
| secret | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.additionalPorts | list | `[]` |  |
| service.additionalServices | list | `[]` |  |
| service.annotations | object | `{}` |  |
| service.enabled | bool | `true` |  |
| service.labels | object | `{}` |  |
| service.port.name | string | `nil` |  |
| service.port.port | string | `nil` |  |
| service.port.protocol | string | `"TCP"` |  |
| service.port.targetPort | string | `nil` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `false` |  |
| serviceAccount.name | string | `""` |  |
| strategy.type | string | `"RollingUpdate"` |  |
| tolerations | list | `[]` |  |
| volumeClaimTemplates | list | `[]` |  |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](../common/README.md).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [3.1.0]

#### Added

- Allow setting secret values through Helm values file.

### [3.0.1]

#### Fixed

- Fixed `kubeVersion` in `Chart.yaml` not working with people running k8s pre-releases
- Added `ingressClassName` to `values.yaml`

### [3.0.0]

#### Changed

- `probes.startupProbe` is now enabled by default. This will allow for quicker `Ready` states on Pods. It will precede the liveness and readiness Probes. *Note:* This requires that you are running [Kubernetes 1.16](https://kubernetes.io/docs/reference/command-line-tools-reference/feature-gates/)
- Aligned our default values for liveness and readiness Probes with the Kubernetes defaults:
  - `initialDelaySeconds` is now `0`
  - `timeoutSeconds` is now `1`
  - `failureThreshold` is now `3`

### [2.5.1]

#### Added

- Fixed a small typo in `values.yaml`: `ingress.tls.hostTpl` -> `ingress.tls.hostsTpl`

### [2.5.0]

#### Added

- Allow setting ingress values through Helm templates:
  - `ingress.hosts.hostTpl`
  - `ingress.tls.secretNameTpl`
  - `ingress.tls.hostsTpl`

### [2.4.0]

#### Added

- Allow setting environment variables from Downward API via `envValueFrom`. See [the Kubernetes docs](https://kubernetes.io/docs/tasks/inject-data-application/environment-variable-expose-pod-information/) for more information.

### [2.3.0]

#### Added

- Allow overriding the main container command.
- Allow setting Helm templates as environment variables via `envTpl`. The given value is parsed through Helm's `tpl` function, allowing for powerful variable substitution.
- Support for defining volumeClaimTemplates for StatefulSet.
- Allow the following Pod spec fields to be configurable:
  - `priorityClassName`
  - `schedulerName`
  - `hostname`

#### Fixed

- `values.yaml` now contains the following sections, these were already functional but were previously undocumented:
  - `podSecurityContext`
  - `securityContext`
  - `resources`

### [2.2.1]

#### Fixed

- Made explicit that `service.port.targetPort` cannot be a named port.

### [2.2.0]

#### Added

- Allow serviceLinks to be enabled/disabled.
- Support for ingressClassName on apiVersion `networking.k8s.io/v1` by setting `ingress.ingressClassName`.
- Added some initial proper unit tests for the `common` chart.

#### Changed

- `service.port.targetPort` is now used in the container spec instead of `service.port.port` if specified. This allows for different service and container ports. (Implements [#465](https://github.com/k8s-at-home/charts/issues/465)).

#### Fixed

- Document setting environment variables for code-server add-on in `values.yaml` (Fixes [#436](https://github.com/k8s-at-home/charts/issues/436)).
- Set service targetPort to the service port name first if no `targetPort` value is given.

### [2.1.0]

#### Added

- Allow for additional arguments to be added to code-server runtime via `addons.codeserver.args`

### [2.0.4]

#### Fixed

- `periodSeconds` now works for all probe types.

### [2.0.0]

#### Changed

- :warning: Updated `probes` logic to support custom probes, it is now possible to set your own custom probes by setting the `probes.[liveness|readiness|startup].custom` value to `true` and configuring them. Default is `false`.
- :warning: `addon.vpn.imagePullPolicy` is now `addon.vpn.[openvpn|wireguard].image.pullPolicy`. Default is `IfNotPresent`
- [code-server](https://github.com/cdr/code-server) is now an `addon` like `vpn`. This enables a code-server container inside the pod which allows you to modify a configuration in a volume attached to the pod. Default for `addons.codeserver.enabled` is `false`
- Added `envFrom` for more configuration with environment variables
- Added `dnsConfig` to be configurable
- Added support for 1.19+ ingress spec
- Added this [CHANGELOG.md](CHANGELOG.md)

#### Fixed

- `nameOverride` and `fullNameOverride` not in `values.yaml`

### [1.7.0]

This is the last version before starting this changelog. All sorts of cool stuff was changed, but only `git log` remembers what that was :slightly_frowning_face:

[3.1.0]: #3.1.0

[3.0.1]: #3.0.1

[3.0.0]: #3.0.0

[2.5.1]: #2.5.1

[2.5.0]: #2.5.0

[2.4.0]: #2.4.0

[2.3.0]: #2.3.0

[2.2.1]: #2.2.1

[2.2.0]: #2.2.0

[2.1.0]: #2.1.0

[2.0.4]: #2.0.4

[2.0.0]: #2.0.0

[1.7.0]: #1.7.0

## Support

- See the [Wiki](https://github.com/k8s-at-home/charts/wiki).
- Open a [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/charts/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
