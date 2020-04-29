# Prometheus Exporter using the Speedtest CLI

This is a helm chart provising a prometheus exporter (with optional ServiceMontor) to conduct speedtests using the official speedtest CLI.  Based on the [prometheus-speedtest-exporter](https://github.com/billimek/prometheus-speedtest-exporter) multi-arch container image.

## TL;DR;

```console
helm repo add billimek https://billimek.com/billimek-charts/
helm install billimek/speedtest-prometheus
```

## Installing the Chart

To install the chart with the release name `speedtest-prometheus`:

```console
helm install --name speedtest-prometheus billimek/speedtest-prometheus
```

## Uninstalling the Chart

To uninstall/delete the `speedtest-prometheus` deployment:

```console
helm delete speedtest-prometheus
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

Read through the [values.yaml](https://github.com/billimek/billimek-charts/blob/master/charts/speedtest-prometheus/values.yaml) file. It has several commented out suggested values.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
helm install --name speedtest-prometheus \
   --set serviceMonitor.enabled=true \
    billimek/speedtest-prometheus
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
helm install --name speedtest-prometheus -f values.yaml billimek/speedtest-prometheus
```
