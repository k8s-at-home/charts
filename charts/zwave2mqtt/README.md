# zwave2mqtt: Fully configurable Zwave to MQTT Gateway and Control Panel

This is a helm chart for [zwave2mqtt](https://github.com/OpenZWave/Zwave2Mqtt)

## TL;DR;

```shell
$ helm repo add k8s-at-home https://k8s-at-home.com/charts/
$ helm install k8s-at-home/zwave2mqtt
```

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install --name my-release k8s-at-home/zwave2mqtt
```

**IMPORTANT NOTE:** a zwave controller device must be accessible on the node where this pod runs, in order for this chart to function properly.

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
          - zwave-controller
```

... where a node with an attached zwave controller USB device is labeled with `app: zwave-controller`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
helm delete my-release --purge
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

Read through the [values.yaml](https://github.com/k8s-at-home/charts/blob/master/charts/zwave2mqtt/values.yaml) file. It has several commented out suggested values.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
helm install --name my-release \
  --set rtspPassword="nosecrets" \
    k8s-at-home/zwave2mqtt
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
helm install --name my-release -f values.yaml stable/zwave2mqtt
```

## Upgrading an existing Release to a new major version

A major chart version change (like 2.2.2 -> 3.0.0) indicates that there is an
incompatible breaking change needing manual actions.

### Upgrading from 3.x.x to 4.x.x

Upgrading to this release it is suggested to enable the flag in Settings > Zwave > Auto update database

In order to use an updated configuration for the devices, you have to send a refreshNodeInfo to that node
