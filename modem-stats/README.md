# cable modem (sb6183) signal and stats collection agent for influxdb

![Screenshot](https://camo.githubusercontent.com/939e044c0491abf790d91bd1d7f909b187e4098c/68747470733a2f2f692e696d6775722e636f6d2f70705a6a6e6b502e706e67)

This tool allows you to run periodic scanning of the sb6183 cable modem and save the results to Influxdb

## TL;DR;

```console
$ helm repo add billimek https://billimek.github.io/helm-repo
$ helm install billimek/modem-stats
```

## Installing the Chart

To install the chart with the release name `my-release`:

```console
$ helm install --name my-release billimek/modem-stats
```
## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
$ helm delete my-release --purge
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The configuration is set as a block of text through a configmap and mouted as a file in /src/config.ini Any value in this text block should match the defined sb6183 configuration. There are several values here that will have to match our kubernetes configuration.

## Configuration

The following tables lists the configurable parameters of the Sentry chart and their default values.

| Parameter                            | Description                                  | Default                                                    |
| -------------------------------      | -------------------------------              | ---------------------------------------------------------- |
| `image.repository`                   | modem-stats image                            | `billimek/sb6183-for-influxdb`                             |
| `image.tag`                          | modem-stats image tag                        | `latest`                                                   |
| `image.pullPolicy`                   | modem-stats image pull policy                | `IfNotPresent`                                             |
| `debug`                              | Display debugging output                     | `false`                                                    |
| `config.delay`                       | how many seconds to wait between checks      | `3600`                                                     |
| `config.influxdb.host`               | InfluxDB hostname                            | `influxdb-influxdb`                                        |
| `config.influxdb.port`               | InfluxDB port                                | `8086`                                                     |
| `config.influxdb.database`           | InfluxDB database                            | `sb6183`                                                   |
| `config.influxdb.username`           | InfluxDB username                            | ``                                                         |
| `config.influxdb.password`           | InfluxDB password                            | ``                                                         |
| `config.influxdb.ssl`                | InfluxDB connection using SSL                | `false`                                                    |
| `config.modem.url`                   | sb6183 stats URL page                        | `http://192.168.100.1/RgConnect.asp`                       |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
$ helm install --name my-release \
  --set onfig.influxdb.host=some-influx-host \
    billimek/modem-stats
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
$ helm install --name my-release -f values.yaml billimek/modem-stats
```

Read through the [values.yaml](values.yaml) file. It has several commented out suggested values.
