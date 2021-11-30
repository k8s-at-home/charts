# uptime-kuma

![Version: 0.0.1](https://img.shields.io/badge/Version-0.0.1-informational?style=flat-square) ![AppVersion: v1.10.2](https://img.shields.io/badge/AppVersion-v1.10.2-informational?style=flat-square)

A fancy self-hosted monitoring tool for your websites and applications

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/louislam/uptime-kuma>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://library-charts.k8s-at-home.com | common | 4.2.0 |

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install uptime-kuma k8s-at-home/uptime-kuma
```

## Installing the Chart

To install the chart with the release name `uptime-kuma`

```console
helm install uptime-kuma k8s-at-home/uptime-kuma
```

## Uninstalling the Chart

To uninstall the `uptime-kuma` deployment

```console
helm uninstall uptime-kuma
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install uptime-kuma \
  --set env.TZ="America/New York" \
    k8s-at-home/uptime-kuma
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install uptime-kuma k8s-at-home/uptime-kuma -f values.yaml
```

