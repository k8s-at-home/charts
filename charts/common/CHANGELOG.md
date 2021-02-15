# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [3.0.1]

### Changed

- Fixed `kubeVersion` in `Chart.yaml` not working with people running k8s pre-releases
- Added `ingressClassName` to `values.yaml`

## [3.0.0]

### Changed

- `probes.startupProbe` is now enabled by default. This will allow for quicker `Ready` states on Pods. It will precede the liveness and readiness Probes. *Note:* This requires that you are running [Kubernetes 1.16](https://kubernetes.io/docs/reference/command-line-tools-reference/feature-gates/)
- Aligned our default values for liveness and readiness Probes with the Kubernetes defaults:
  - `initialDelaySeconds` is now `0`
  - `timeoutSeconds` is now `1`
  - `failureThreshold` is now `3`

## [2.5.1]

### Added

- Fixed a small typo in `values.yaml`: `ingress.tls.hostTpl` -> `ingress.tls.hostsTpl`

## [2.5.0]

### Added

- Allow setting ingress values through Helm templates:
  - `ingress.hosts.hostTpl`
  - `ingress.tls.secretNameTpl`
  - `ingress.tls.hostsTpl`

## [2.4.0]

### Added

- Allow setting environment variables from Downward API via `envValueFrom`. See [the Kubernetes docs](https://kubernetes.io/docs/tasks/inject-data-application/environment-variable-expose-pod-information/) for more information.

## [2.3.0]

### Added

- Allow overriding the main container command.
- Allow setting Helm templates as environment variables via `envTpl`. The given value is parsed through Helm's `tpl` function, allowing for powerful variable substitution.
- Support for defining volumeClaimTemplates for StatefulSet.
- Allow the following Pod spec fields to be configurable:
  - `priorityClassName`
  - `schedulerName`
  - `hostname`

### Fixed

- `values.yaml` now contains the following sections, these were already functional but were previously undocumented:
  - `podSecurityContext`
  - `securityContext`
  - `resources`

## [2.2.1]

### Fixed

- Made explicit that `service.port.targetPort` cannot be a named port.

## [2.2.0]

### Added

- Allow serviceLinks to be enabled/disabled.
- Support for ingressClassName on apiVersion `networking.k8s.io/v1` by setting `ingress.ingressClassName`.
- Added some initial proper unit tests for the `common` chart.

### Changed

- `service.port.targetPort` is now used in the container spec instead of `service.port.port` if specified. This allows for different service and container ports. (Implements [#465](https://github.com/k8s-at-home/charts/issues/465)).

### Fixed

- Document setting environment variables for code-server add-on in `values.yaml` (Fixes [#436](https://github.com/k8s-at-home/charts/issues/436)).
- Set service targetPort to the service port name first if no `targetPort` value is given.

## [2.1.0]

### Added

- Allow for additional arguments to be added to code-server runtime via `addons.codeserver.args`

## [2.0.4]

### Fixed

- `periodSeconds` now works for all probe types.

## [2.0.0]

### Changed

- :warning: Updated `probes` logic to support custom probes, it is now possible to set your own custom probes by setting the `probes.[liveness|readiness|startup].custom` value to `true` and configuring them. Default is `false`.
- :warning: `addon.vpn.imagePullPolicy` is now `addon.vpn.[openvpn|wireguard].image.pullPolicy`. Default is `IfNotPresent`
- [code-server](https://github.com/cdr/code-server) is now an `addon` like `vpn`. This enables a code-server container inside the pod which allows you to modify a configuration in a volume attached to the pod. Default for `addons.codeserver.enabled` is `false`
- Added `envFrom` for more configuration with environment variables
- Added `dnsConfig` to be configurable
- Added support for 1.19+ ingress spec
- Added this [CHANGELOG.md](CHANGELOG.md)

### Fixed

- `nameOverride` and `fullNameOverride` not in `values.yaml`

## [1.7.0]

This is the last version before starting this changelog. All sorts of cool stuff was changed, but only `git log` remembers what that was :slightly_frowning_face:

[3.0.1]: https://github.com/k8s-at-home/charts/tree/common-3.0.1/charts/common

[3.0.0]: https://github.com/k8s-at-home/charts/tree/common-3.0.0/charts/common

[2.5.1]: https://github.com/k8s-at-home/charts/tree/common-2.5.1/charts/common

[2.5.0]: https://github.com/k8s-at-home/charts/tree/common-2.5.0/charts/common

[2.4.0]: https://github.com/k8s-at-home/charts/tree/common-2.4.0/charts/common

[2.3.0]: https://github.com/k8s-at-home/charts/tree/common-2.3.0/charts/common

[2.2.1]: https://github.com/k8s-at-home/charts/tree/common-2.2.1/charts/common

[2.2.0]: https://github.com/k8s-at-home/charts/tree/common-2.2.0/charts/common

[2.1.0]: https://github.com/k8s-at-home/charts/tree/common-2.1.0/charts/common

[2.0.4]: https://github.com/k8s-at-home/charts/tree/common-2.0.4/charts/common

[2.0.0]: https://github.com/k8s-at-home/charts/tree/common-2.0.0/charts/common

[1.7.0]: https://github.com/k8s-at-home/charts/tree/common-1.7.0/charts/common
