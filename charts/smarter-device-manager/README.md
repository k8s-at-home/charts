# smarter device manager

This is a helm chart for [smarter-device-manager](https://gitlab.com/arm-research/smarter/smarter-device-manager/) 
([see also](https://community.arm.com/developer/research/b/articles/posts/a-smarter-device-manager-for-kubernetes-on-the-edge)).

This tool discovers host hardware resources and manages their provisioning for the pods, decoupling host paths from them, and ensuring that pods don't compete for the same piece of hardware. 

Typical use cases are Zigbee/Zwave USB dongles for other charts available in this repository (Zigbee2MQTT, ZwaveJS2MQTT).

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## TL;DR;

```shell
$ helm repo add k8s-at-home https://k8s-at-home.com/charts/
$ helm install k8s-at-home/smarter-device-manager
```

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install --name my-release k8s-at-home/smarter-device-manager
```

Please consider overrading the default configuration through `values` file. 
Foe example: 
```yaml
config:
  - devicematch: ^snd$
    nummaxdevices: 20
  - devicematch: ^rtc0$
    nummaxdevices: 20
  - devicematch: ^video[0-9]*$
    nummaxdevices: 20
  - devicematch: ^ttyACM[0-9]*$
    nummaxdevices: 1
```
The above configuration allows up to twenty pods to make use of `/dev/snd`, `/dev/rtc0` and each of `/dev/video[0-9]*` devices. 
Only one pod at a time can use any of the discovered host `/dev/ttyACM[0-9]*` devices. This means that if a pod has reserved a dongle at `/dev/ttyACM0`, another pod requesting the same device will stay pending.

Please note that only the root of the host `/dev` directory is considered for discovery.

The hardware are requested by pods through `resources`, e.g.:
```yaml
  resources:
    limits:
      smarter-devices/ttyUSB-Conbee-2: 1
    requests:
      smarter-devices/ttyUSB-Conbee-2: 1
```

Common considerations about node affinity apply. 

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
helm delete my-release --purge
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

Read through the charts [values.yaml](https://github.com/k8s-at-home/charts/blob/master/charts/smarter-device-manager/values.yaml)
file. It has several commented out suggested values.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,
```console
helm install my-release \
  --set env.TZ="America/New_York" \
    k8s-at-home/zwavejs2mqtt
```
Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the
chart. For example,
```console
helm install my-release k8s-at-home/smarter-device-manager --values values.yaml 
```

```yaml
image:
  tag: ...
```

---

## Upgrading an existing Release to a new major version

A major chart version change (like 4.0.1 -> 5.0.0) indicates that there is an incompatible breaking change potentially needing manual actions.

