# Prometheus Exporter using the Uptimerobot API

![](https://raw.githubusercontent.com/lekpamartin/uptimerobot_exporter/master/dashboards/dashboard.PNG)

This is a helm chart providing a prometheus exporter to query the uptimerobot API.  Based on the [uptimerobot_exporter](https://github.com/lekpamartin/uptimerobot_exporter) container image.

## TL;DR;

```console
helm repo add billimek https://billimek.com/billimek-charts/
helm install billimek/uptimerobot-prometheus
```

## Installing the Chart

To install the chart with the release name `uptimerobot-prometheus`:

```console
helm install --name uptimerobot-prometheus billimek/uptimerobot-prometheus
```

## Uninstalling the Chart

To uninstall/delete the `uptimerobot-prometheus` deployment:

```console
helm delete uptimerobot-prometheus
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

Read through the [values.yaml](https://github.com/billimek/billimek-charts/blob/master/charts/uptimerobot-prometheus/values.yaml) file. It has several commented out suggested values.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
helm install --name uptimerobot-prometheus \
   --set serviceMonitor.enabled=true \
    billimek/uptimerobot-prometheus
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
helm install --name uptimerobot-prometheus -f values.yaml billimek/uptimerobot-prometheus
```

## Grafana Dashboard

You can find an [example grafana dashboard](https://github.com/lekpamartin/uptimerobot_exporter/blob/master/dashboards/grafana.json) as shown in the screenshot above.
