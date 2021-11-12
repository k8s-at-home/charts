# double-take

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![AppVersion: 1.6.0](https://img.shields.io/badge/AppVersion-1.6.0-informational?style=flat-square)

Unified UI and API for processing and training images for facial recognition.

Configuration file defined in `Values.config`  will be copied into the container's persistent storage at first run only. Further configuration should be done in the application itself! See [project documentation](https://github.com/jakowenko/double-take#configuration) for more information.

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/jakowenko/double-take>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://library-charts.k8s-at-home.com | common | 4.0.1 |

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

