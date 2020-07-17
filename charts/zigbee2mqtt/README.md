# zigbee2mqtt: Fully configurable Zigbee to MQTT Gateway

This is a helm chart for [zigbee2mqtt](https://www.zigbee2mqtt.io)

## TL;DR;

```shell
$ helm repo add billimek https://billimek.com/billimek-charts/
$ helm install billimek/zigbee2mqtt
```

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install --name my-release billimek/zigbee2mqtt
```

**IMPORTANT NOTE:** a [supported Zigbee sniffer](https://www.zigbee2mqtt.io/getting_started/what_do_i_need.html) must be accessible on the node where this pod runs, in order for this chart to function properly.

A way to achieve this can be with nodeAffinity rules, for example:

```yaml
affinity:
  nodeAffinity:
    requiredDuringSchedulingIgnoredDuringExecution:
      nodeSelectorTerms:
      - matchExpressions:
        - key: app
          operator: In
          values:
          - zigbee-controller
```

... where a node with an attached zigbee sniffer is labeled with `app: zigbee-controller`

Because zigbee2mqtt writes to the config file, it is impossible to manage it through this chart. The configuration options will be set as defaults on first run, and then copied to a writeable directory. It can be found in /data/configuration.yaml afterwards.

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
helm delete my-release --purge
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

Read through the [values.yaml](https://github.com/billimek/billimek-charts/blob/master/charts/zigbee2mqtt/values.yaml) file. It has several commented out suggested values.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
helm install --name my-release \
  --set config.mqtt.server="mqtt://mymqttbroker" \
    billimek/zigbee2mqtt
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
helm install --name my-release -f values.yaml billimek/zigbee2mqtt
```
