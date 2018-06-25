# A tool to get statistics from Uptime Robot and log it into InfluxDB

![Screenshot](https://github.com/billimek/node-influx-uptimerobot/blob/master/docs/dashboard.png)

This tool allows you to run periodic uptimerobot data usage checks and save the results to Influxdb

## TL;DR;

```console
$ helm repo add billimek https://raw.githubusercontent.com/billimek/helm-repo/master
$ helm install billimek/uptimerobot
```

## Introduction

This code is adopted from [this original repo](https://github.com/trojanc/node-influx-uptimerobot)

## Installing the Chart

To install the chart with the release name `my-release`:

```console
$ helm install --name my-release billimek/uptimerobot
```
## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
$ helm delete my-release --purge
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The configuration is set as a block of text through a configmap and mouted as a file in /src/config.ini Any value in this text block should match the defined uptimerobot configuration. There are several values here that will have to match our kubernetes configuration.

## Configuration

The following tables lists the configurable parameters of the Sentry chart and their default values.

| Parameter                            | Description                                  | Default                                                    |
| -------------------------------      | -------------------------------              | ---------------------------------------------------------- |
| `image.repository`                   | uptimerobot image                            | `billimek/uptimerobotusage-for-influxdb`                   |
| `image.tag`                          | uptimerobot image tag                        | `latest`                                                   |
| `image.pullPolicy`                   | uptimerobot image pull policy                | `IfNotPresent`                                             |
| `delay`                              | number of seconds to wait between collections | `300`                                                     |
| `config.influxdb.host`               | InfluxDB hostname                            | `influxdb-influxdb`                                        |
| `config.influxdb.port`               | InfluxDB port                                | `8086`                                                     |
| `config.influxdb.database`           | InfluxDB database                            | `uptimerobot`                                              |
| `config.influxdb.protocol`           | InfluxDB protocol                            | `http`                                                     |
| `config.influxdb.username`           | InfluxDB username                            | ``                                                         |
| `config.influxdb.password`           | InfluxDB password                            | ``                                              |
| `config.uptimerobot.apikey`          | uptimerobot API key (REQUIRED)               | `someapikey`                                               |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
$ helm install --name my-release \
  --set config.uptimerobot.apikey=thisismyapikey \
    billimek/uptimerobot
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
$ helm install --name my-release -f values.yaml billimek/uptimerobot
```

Read through the [values.yaml](values.yaml) file. It has several commented out suggested values.
