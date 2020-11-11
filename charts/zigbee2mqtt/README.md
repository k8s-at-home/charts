# zigbee2mqtt: Fully configurable Zigbee to MQTT Gateway

This is a helm chart for [zigbee2mqtt](https://www.zigbee2mqtt.io)

## TL;DR;

```shell
$ helm repo add k8s-at-home https://k8s-at-home.com/charts/
$ helm install k8s-at-home/zigbee2mqtt
```

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install --name my-release k8s-at-home/zigbee2mqtt
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

Read through the [values.yaml](https://github.com/k8s-at-home/charts/blob/master/charts/zigbee2mqtt/values.yaml) file. It has several commented out suggested values.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
helm install --name my-release \
  --set config.mqtt.server="mqtt://mymqttbroker" \
    k8s-at-home/zigbee2mqtt
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
helm install --name my-release -f values.yaml k8s-at-home/zigbee2mqtt
```

## Upgrading an existing Release to a new major version

A major chart version change (like 1.0.0 -> 2.0.0) indicates that there is an
incompatible breaking change needing manual actions.

### Upgrading from 1.x.x to 2.x.x

Zigbee2MQTT has gained a native full-feature WebUI. Because of this, Zigbee2MQTTAssistant was dropped from the chart

You should delete the assistant config from your values.yaml. If you wish to use the new UI, make sure you have
```
frontend:
  port: 8080
experimental:
  new_api: true
```
in the config section, and enable the ingress in values.yaml. Because of the way this chart works, you'll need to add this section to your configuration.yaml in zigbee2mqtt manually if you want to upgrade in-place
