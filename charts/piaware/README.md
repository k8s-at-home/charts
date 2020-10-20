# piaware: Program for forwarding ADS-B data to FlightAware

This is a helm chart for [piaware](https://github.com/flightaware/piaware)

## TL;DR;

```shell
$ helm repo add k8s-at-home https://k8s-at-home.com/charts/
$ helm install k8s-at-home/piaware
```

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install --name my-release k8s-at-home/piaware
```

### Configuration
There are two main options for this chart, either use a UBB device on the node where the pod runs or use 
[readsb](https://hub.docker.com/r/mikenye/readsb) with beast

#### USB
Set the value 

    device: "/dev/bus/usb/001/004"

**IMPORTANT NOTE:** a flight-aware USB device must be accessible on the node where this pod runs, in order for this chart to function properly.

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
          - flight-aware
```

... where a node with an attached flight-aware USB device is labeled with `app: flight-aware`

#### Beast
Use this together with the [readsb](https://hub.docker.com/r/mikenye/readsb) 
Set the value

    beastHost: <host running readsb>

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
helm delete my-release --purge
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

Read through the [values.yaml](https://github.com/k8s-at-home/charts/blob/master/charts/piaware/values.yaml) file. It has several commented out suggested values.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
helm install --name my-release \
  --set feederId="nosecrets" \
    k8s-at-home/piaware
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
helm install --name my-release -f values.yaml k8s-at-home/piaware
```
