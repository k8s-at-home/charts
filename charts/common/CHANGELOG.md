# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.1.0]

### Added

- Allow for additional arguments to be added to code-server runtime vis `addons.codeserver.args`

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

[2.0.4]: https://github.com/k8s-at-home/charts/tree/common-2.0.4/charts/common

[2.0.0]: https://github.com/k8s-at-home/charts/tree/common-2.0.0/charts/common

[1.7.0]: https://github.com/k8s-at-home/charts/tree/common-1.7.0/charts/common
