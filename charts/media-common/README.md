# Shared base chart for k8s@home media charts

Many containers have no environmentally configurable settings. This chart allows a single maintainable
base with umbrella charts for container-specific differences. This chart does not have a default
repository or tag, and not designed to be deployed directly.

## Known Parent Charts

* [k8s-at-home/radarr](https://github.com/k8s-at-home/charts/tree/master/charts/radarr)
* [k8s-at-home/sonarr](https://github.com/k8s-at-home/charts/tree/master/charts/sonarr)
* [k8s-at-home/lidarr](https://github.com/k8s-at-home/charts/tree/master/charts/lidarr)
* [k8s-at-home/tautulli](https://github.com/k8s-at-home/charts/tree/master/charts/tautulli)
* [k8s-at-home/ombi](https://github.com/k8s-at-home/charts/tree/master/charts/ombi)
* [k8s-at-home/organizr](https://github.com/k8s-at-home/charts/tree/master/charts/organizr)

## Configuration

Read through the [values.yaml](https://github.com/k8s-at-home/charts/blob/master/charts/media-common/values.yaml) file.
It has several commented out suggested values.

These values will normally be nested as it is a dependency, for example:
```yaml
radarr:
  <values>
```