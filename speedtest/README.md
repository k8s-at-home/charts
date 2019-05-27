# Speedtest.net Collector For InfluxDB and Grafana

![Screenshot](https://camo.githubusercontent.com/c652a6685bcb5a8cec6a47c92e57d159b28e47e7/68747470733a2f2f7075752e73682f746d664f412f623535373665383864652e706e67)

This tool is a wrapper for speedtest-cli which allows you to run periodic speedtets and save the results to Influxdb

## TL;DR;

```console
$ helm repo add billimek https://billimek.com/billimek-charts/
$ helm install billimek/speedtest
```

## Installing the Chart

To install the chart with the release name `my-release`:

```console
$ helm install --name my-release billimek/speedtest
```

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
$ helm delete my-release --purge
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The configuration is set as a block of text through a configmap and mouted as a file in /src/config.ini Any value in this text block should match the defined speedtest configuration. There are several values here that will have to match our kubernetes configuration.

## Configuration

The following tables lists the configurable parameters of the Sentry chart and their default values.

| Parameter                            | Description                                | Default                                                    |
| -------------------------------      | -------------------------------            | ---------------------------------------------------------- |
| `image.repository`                   | speedtest image                                | `billimek/speedtestusage-for-influxdb`                     |
| `image.tag`                          | speedtest image tag                            | `latest`                                                 |
| `image.pullPolicy`                   | speedtest image pull policy                    | `IfNotPresent`                                           |
| `debug`                              | Display debugging output                     | `false`                                                  |
| `config.delay`                       | how many seconds to wait between checks      | `3600`                                                   |
| `config.influxdb.host`               | InfluxDB hostname                            | `influxdb-influxdb`                                      |
| `config.influxdb.port`               | InfluxDB port                                | `8086`                                                   |
| `config.influxdb.database`           | InfluxDB database                            | `speedtests`                                                |
| `config.influxdb.username`           | InfluxDB username                            | ``                                                       |
| `config.influxdb.password`           | InfluxDB password                            | ``                                                       |
| `config.influxdb.ssl`                | InfluxDB connection using SSL                | `false`                                                  |
| `config.speedtest.server`            | server to use for speedtest - leave blank to auto-pick | ``                                               |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
$ helm install --name my-release \
  --set config.influxdb.host=some-influx-host \
    billimek/speedtest
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
$ helm install --name my-release -f values.yaml billimek/speedtest
```

Read through the [values.yaml](https://github.com/billimek/billimek-charts/blob/master/speedtest/values.yaml) file. It has several commented out suggested values.

