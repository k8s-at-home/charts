# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [3.1.0]

### Changed

- Fixed issue in default postgresql configuration.
- Bumped bitnami/postgresql to 10.1.1 in chart deps

## [3.0.0]

### Changed

- The default `home-assistant` image has been updated to v0.118.3.
- The default `vscode` image has been updated to 3.7.2
- :warning: Upgraded `influxdb` subchart from version 0.6.7 to version 1.0.0.
- :warning: Upgraded `postgresql` subchart from version 9.1.2 to version 10.1.0. 
  This is a major version update, [requiring changes](https://github.com/bitnami/charts/tree/master/bitnami/postgresql#to-1000) in your `values.yaml` if you use it!
- :warning: Upgraded `mariadb` subchart from version 7.7.1 to version 9.0.1. 
  This is a major version update, [requiring changes](https://github.com/bitnami/charts/tree/master/bitnami/mariadb#to-900) in your `values.yaml` if you use it!

### Removed

- Subchart support for `esphome` was removed as it is really a separate application and integration was only limited to sharing a secrets file.

### Fixed

- Fixed some formatting errors that were causing the pipeline to fail.

## [2.7.0]

This is the last version before starting this changelog. All sorts of cool stuff was changed, but only `git log` remembers what that was :slightly_frowning_face:

[3.1.0]: https://github.com/k8s-at-home/charts/tree/home-assistant-3.1.0/charts/home-assistant

[3.0.0]: https://github.com/k8s-at-home/charts/tree/home-assistant-3.0.0/charts/home-assistant

[2.7.0]: https://github.com/k8s-at-home/charts/tree/home-assistant-2.7.0/charts/home-assistant
