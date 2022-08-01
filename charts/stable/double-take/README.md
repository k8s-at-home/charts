# double-take

![Version: 2.3.0](https://img.shields.io/badge/Version-2.3.0-informational?style=flat-square) ![AppVersion: 1.6.0](https://img.shields.io/badge/AppVersion-1.6.0-informational?style=flat-square)

Unified UI and API for processing and training images for facial recognition.

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/jakowenko/double-take>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://library-charts.k8s-at-home.com | common | 4.5.0 |

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install double-take k8s-at-home/double-take
```

## Installing the Chart

To install the chart with the release name `double-take`

```console
helm install double-take k8s-at-home/double-take
```

## Uninstalling the Chart

To uninstall the `double-take` deployment

```console
helm uninstall double-take
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install double-take \
  --set env.TZ="America/New York" \
    k8s-at-home/double-take
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install double-take k8s-at-home/double-take -f values.yaml
```

## Custom configuration

**Note**: Configuration file defined in `Values.config`  will be copied into the container's persistent storage at first run only. Further configuration should be done in the application itself! See [project documentation](https://github.com/jakowenko/double-take#configuration) for more information.

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| config | object | See values.yaml | double-take configuration settings. This will be copied into the container's persistent storage at first run only. Further configuration should be done in the application itself! See [project documentation](https://github.com/jakowenko/double-take#configuration) for more information. |
| config.detect.match.base64 | bool | `false` |  options: true, false, box |
| config.detect.unknown.base64 | bool | `false` |  options: true, false, box |
| config.detectors.compreface.det_prob_threshold | float | `0.8` |  value is between 0.0 and 1.0 |
| config.detectors.compreface.enabled | bool | `true` | enable or disable the compreface detector |
| config.detectors.deepstack.enabled | bool | `false` | enable or disable the deepstack detector |
| config.detectors.deepstack.timeout | int | `15` | number of seconds before the request times out and is aborted |
| config.detectors.facebox.enabled | bool | `false` | enable or disable the facebox detector |
| config.detectors.facebox.timeout | int | `15` | number of seconds before the request times out and is aborted |
| config.frigate.events | string | `nil` |    zone: driveway override frigate attempts and image per camera |
| config.frigate.zones | string | `nil` |  - garage only process images from specific zones |
| config.logs | object | `{"level":"info"}` |  options: silent, error, warn, info, http, verbose, debug, silly |
| config.notify.gotify.enabled | bool | `true` | enable gotify |
| config.time.format | string | `nil` |  https://github.com/moment/luxon/blob/master/docs/formatting.md#table-of-tokens |
| config.token | object | `{"image":"24h"}` |  age of access token in api response and mqtt topics (default: shown below) expressed in seconds or a string describing a time span zeit/ms https://github.com/vercel/ms |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"jakowenko/double-take"` | image repository |
| image.tag | string | `"1.6.0"` | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. See [API Images](https://github.com/jakowenko/double-take#api-images) for explaination on what data is stored where. |
| service | object | See values.yaml | Configures service settings for the chart. |

## Changelog

### Version 2.3.0

#### Added

N/A

#### Changed

* Upgraded `common` chart dependency to version 4.5.0

#### Fixed

N/A

### Older versions

A historical overview of changes can be found on [ArtifactHUB](https://artifacthub.io/packages/helm/k8s-at-home/double-take?modal=changelog)

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v0.1.1](https://github.com/k8s-at-home/helm-docs/releases/v0.1.1)
