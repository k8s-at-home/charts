# Prometheus Exporter using the Speedtest CLI

![Screenshot](https://i.imgur.com/iIzWUre.png)

This is a helm chart provising a prometheus exporter (with optional ServiceMontor) to conduct speedtests using the official speedtest CLI.  Based on the [prometheus-speedtest-exporter](https://github.com/billimek/prometheus-speedtest-exporter) multi-arch container image.

## TL;DR;

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm install k8s-at-home/speedtest-prometheus
```

## Installing the Chart

To install the chart with the release name `speedtest-prometheus`:

```console
helm install --name speedtest-prometheus k8s-at-home/speedtest-prometheus
```

## Uninstalling the Chart

To uninstall/delete the `speedtest-prometheus` deployment:

```console
helm delete speedtest-prometheus
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

Read through the [values.yaml](https://github.com/k8s-at-home/charts/blob/master/charts/speedtest-prometheus/values.yaml) file. It has several commented out suggested values.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
helm install --name speedtest-prometheus \
   --set serviceMonitor.enabled=true \
    k8s-at-home/speedtest-prometheus
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
helm install --name speedtest-prometheus -f values.yaml k8s-at-home/speedtest-prometheus
```

## Grafana Dashboard

You can find an [example grafana dashboard](https://github.com/billimek/prometheus-speedtest-exporter/blob/master/speedtest-exporter.json) as shown in the screenshot above.
