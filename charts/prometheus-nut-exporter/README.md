# Prometheus NUT Exporter

This is a helm chart provides a service monitor to send NUT server metrics to a Prometheus instance. Based on [Prometheus NUT Exporter](https://github.com/HON95/prometheus-nut-exporter).

## TL;DR;

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm install k8s-at-home/prometheus-nut-exporter
```

## Installing the Chart

To install the chart with the release name `prometheus-nut-exporter`:

```console
helm install --name prometheus-nut-exporter k8s-at-home/prometheus-nut-exporter
```

## Uninstalling the Chart

To uninstall/delete the `prometheus-nut-exporter` deployment:

```console
helm delete prometheus-nut-exporter
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

Read through the [values.yaml](https://github.com/k8s-at-home/charts/blob/master/charts/prometheus-nut-exporter/values.yaml) file. It has several commented out suggested values.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
helm install --name prometheus-nut-exporter \
   --set serviceMonitor.enabled=true \
    k8s-at-home/prometheus-nut-exporter
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
helm install --name prometheus-nut-exporter -f values.yaml k8s-at-home/prometheus-nut-exporter
```

## Metrics

You can find the exported metrics here: [metrics](https://github.com/HON95/prometheus-nut-exporter/blob/master/metrics.md).
