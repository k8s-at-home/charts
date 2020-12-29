# Home Assistant

This is a helm chart for [Home Assistant](https://www.home-assistant.io/).

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## TL;DR;

```shell
$ helm repo add k8s-at-home https://k8s-at-home.com/charts/
$ helm install k8s-at-home/home-assistant
```

## :star2: Changelog

Please refer to [CHANGELOG.md](CHANGELOG.md) for an overview of notable changes to the chart. **This is especially important for major version updates!**

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install --name my-release k8s-at-home/home-assistant
```

### Z-Wave / Zigbee

A Z-Wave and/or Zigbee controller device could be used with Home Assistant if passed through from the host to the pod. Skip this section if you are using zwave2mqtt and/or zigbee2mqtt or plan to.

First you will need to mount your Z-Wave and/or Zigbee device into the pod, you can do so by adding the following to your values:

```yaml
additionalVolumeMounts:
  - name: zwave-usb
    mountPath: /path/to/device

additionalVolumes:
  - name: zwave-usb
    hostPath:
      path: /path/to/device
```

Second you will need to set a nodeAffinity rule, for example:

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

... where a node with an attached zwave and/or zigbee controller USB device is labeled with `app: zwave-controller`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
helm delete my-release --purge
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

Read through the charts [values.yaml](https://github.com/k8s-at-home/charts/blob/master/charts/home-assistant/values.yaml)
file. It has several commented out suggested values.
Additionally you can take a look at the common library [values.yaml](https://github.com/k8s-at-home/charts/blob/master/charts/common/values.yaml) for more (advanced) configuration options.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,
```console
helm install my-release \
  --set env.TZ="America/New_York" \
    k8s-at-home/home-assistant
```
Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the
chart. For example,
```console
helm install my-release k8s-at-home/home-assistant --values values.yaml 
```

```yaml
image:
  tag: ...
```

---
**NOTE**

If you get
```console
Error: rendered manifests contain a resource that already exists. Unable to continue with install: existing resource conflict: ...`
```
it may be because you uninstalled the chart with `skipuninstall` enabled, you need to manually delete the pvc or use `existingClaim`.

---

## Upgrading an existing Release to a new major version

A major chart version change (like 4.0.1 -> 5.0.0) indicates that there is an incompatible breaking change potentially needing manual actions.

### Upgrading from 4.x.x to 5.x.x

As of 5.0.0 this chart was migrated to a centralized [common](https://github.com/k8s-at-home/charts/tree/master/charts/common) library, some values in `values.yaml` have changed.

Examples:

* `service.port` has been moved to `service.port.port`.
* `persistence.type` has been moved to `controllerType`.

Refer to the [common](https://github.com/k8s-at-home/charts/tree/master/charts/common) library for more configuration options.
