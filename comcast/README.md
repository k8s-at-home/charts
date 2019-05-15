# Comcast Data Cap Usage Collector For InfluxDB and Grafana

![Screenshot](https://github.com/billimek/comcastUsage-for-influxdb/raw/master/images/comcast_grafana_example.png)

This tool allows you to run periodic comcast data usage checks and save the results to Influxdb

## TL;DR;

```console
$ helm repo add billimek https://billimek.github.io/helm-repo
$ helm install billimek/comcast
```

## Introduction

This code is adopted from the work done by [barrycarey](https://github.com/barrycarey) in the [similar thing for capturing speedtest data](https://github.com/barrycarey/Speedtest-for-InfluxDB-and-Grafana) as well as [jantman's](https://github.com/jantman) [xfinity-usage python example](https://github.com/jantman/xfinity-usage)

## Installing the Chart

To install the chart with the release name `my-release`:

```console
$ helm install --name my-release billimek/comcast
```
## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
$ helm delete my-release --purge
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The configuration is set as a block of text through a configmap and mouted as a file in /src/config.ini Any value in this text block should match the defined Comcast configuration. There are several values here that will have to match our kubernetes configuration.

## Configuration

The following tables lists the configurable parameters of the Sentry chart and their default values.

| Parameter                            | Description                                | Default                                                    |
| -------------------------------      | -------------------------------            | ---------------------------------------------------------- |
| `image.repository`                   | Comcast image                                | `billimek/comcastusage-for-influxdb`                     |
| `image.tag`                          | Comcast image tag                            | `latest`                                                 |
| `image.pullPolicy`                   | Comcast image pull policy                    | `IfNotPresent`                                           |
| `debug`                              | Display debugging output                     | `false`                                                  |
| `config.delay`                       | how many seconds to wait between checks      | `3600`                                                   |
| `config.influxdb.host`               | InfluxDB hostname                            | `influxdb-influxdb`                                      |
| `config.influxdb.port`               | InfluxDB port                                | `8086`                                                   |
| `config.influxdb.database`           | InfluxDB database                            | `comcast`                                                |
| `config.influxdb.username`           | InfluxDB username                            | ``                                                       |
| `config.influxdb.password`           | InfluxDB password                            | ``                                                       |
| `config.influxdb.ssl`                | InfluxDB connection using SSL                | `false`                                                  |
| `config.comcast.username`            | Comcast website login usernma                | `someuser`                                               |
| `config.comcast.password`            | Comcast website login password               | `somepassword`                                           |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
helm install --name my-release \
  --set config.comcast.username=tonystark,config.comcast.password=mypassword \
    billimek/comcast
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
helm install --name my-release -f values.yaml billimek/comcast
```

Read through the [values.yaml](values.yaml) file. It has several commented out suggested values.

## InfluxDB metrics
```
'measurement': 'comcast_data_usage',
'fields': {
		'used',
		'total',
		'unit'
}
```