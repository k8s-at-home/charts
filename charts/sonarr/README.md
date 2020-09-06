# sonarr umbrella chart

Umbrella chart that uses [media-common](https://github.com/k8s-at-home/charts/tree/master/charts/media-common) and adds
image information.

## Configuration

Read through the media-common [values.yaml](https://github.com/k8s-at-home/charts/blob/master/charts/media-common/values.yaml) file. It has several commented out suggested values.

These values will be nested as it is a dependency, for example:
```yaml
sonarr:
  image:
    tag: ...
```