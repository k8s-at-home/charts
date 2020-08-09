# I can't belive it's not Valetudo

Map generation companion service for [Valetudo](valetudo.cloud)

## TL;DR;

```shell
$ helm repo add billimek https://billimek.com/billimek-charts/
$ helm install billimek/icantbelieveitsnotvaletudo
```

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install --name my-release billimek/icantbelieveitsnotvaletudo
```

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
helm delete my-release --purge
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

Read through the [values.yaml](https://github.com/billimek/billimek-charts/blob/master/charts/icantbelieveitsnotvaletudo/values.yaml) file. It has several commented out suggested values.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
helm install --name my-release \
  --set config.mqtt.broker_url="mqtt://mymqttbroker" \
    billimek/icantbelieveitsnotvaletudo
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
helm install --name my-release -f values.yaml billimek/icantbelieveitsnotvaletudo
```
