# calibre

![Version: 5.13.0](https://img.shields.io/badge/Version-5.13.0-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

Calibre is a powerful and easy to use e-book manager.

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://hub.docker.com/r/linuxserver/calibre/>
* <https://github.com/kovidgoyal/calibre/>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://library-charts.k8s-at-home.com | common | 1.0.0 |

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install calibre k8s-at-home/calibre
```

## Installing the Chart

To install the chart with the release name `calibre`

```console
helm install calibre k8s-at-home/calibre
```

## Uninstalling the Chart

To uninstall the `calibre` deployment

```console
helm uninstall calibre
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](../common/values.yaml) from the [common library](../common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install calibre \
  --set env.TZ="America/New York" \
    k8s-at-home/calibre
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install calibre k8s-at-home/calibre -f values.yaml
```

