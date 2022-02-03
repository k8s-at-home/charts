# error-pages

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![AppVersion: 2.6.0](https://img.shields.io/badge/AppVersion-2.6.0-informational?style=flat-square)

Server error pages in the docker image

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/tarampampam/error-pages>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://library-charts.k8s-at-home.com | common | 4.0.0 |

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install error-pages k8s-at-home/error-pages
```

## Installing the Chart

To install the chart with the release name `error-pages`

```console
helm install error-pages k8s-at-home/error-pages
```

## Uninstalling the Chart

To uninstall the `error-pages` deployment

```console
helm uninstall error-pages
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install error-pages \
  --set env.TZ="America/New York" \
    k8s-at-home/error-pages
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install error-pages k8s-at-home/error-pages -f values.yaml
```
