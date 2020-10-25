# Prometheus mosquitto Exporter

This is a helm chart provides a service monitor to scrape [mosquitto](https://mosquitto.org/) server metrics to a Prometheus instance. Based on [sapcc/mosquitto-exporter](https://github.com/sapcc/mosquitto-exporter), with current fork from [nolte/mosquitto-exporter](https://github.com/nolte/mosquitto-exporter), for armhf support.


## Installing the Chart

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm install k8s-at-home/mosquitto-exporter
```

The Most Releavant values are:

| Value                     | Default                | Description                                                        |
|---------------------------|------------------------|--------------------------------------------------------------------|
| `mosquitto.endpoint`      | _tcp://mosquitto:1883_ | Mosquitto Connection Uri                                           |
| `serviceMonitor.enabled`  | _false_                | If `true` the Chart will be generate a prometheus ServiceMonitor.  |
| `serviceMonitor.interval` | 30                     | Scrape Interval                                                    |
| `serviceMonitor.labels`   | _{}_                   | Extra Service Monitor Labels, for example for Prometheus Selector. |

For a full overview take a look to the default [values.yaml](./values.yaml).