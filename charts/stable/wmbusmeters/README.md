# wmbusmeters

![Version: 1.3.2](https://img.shields.io/badge/Version-1.3.2-informational?style=flat-square) ![AppVersion: 1.4.1](https://img.shields.io/badge/AppVersion-1.4.1-informational?style=flat-square)

Wmbusmeters receives and decodes C1,T1 or S1 telegrams (using the wireless mbus protocol) to acquire utility meter readings.

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/weetmuts/wmbusmeters>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://library-charts.k8s-at-home.com | common | 4.4.2 |

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install wmbusmeters k8s-at-home/wmbusmeters
```

## Installing the Chart

To install the chart with the release name `wmbusmeters`

```console
helm install wmbusmeters k8s-at-home/wmbusmeters
```

## Uninstalling the Chart

To uninstall the `wmbusmeters` deployment

```console
helm uninstall wmbusmeters
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install wmbusmeters \
  --set env.TZ="America/New York" \
    k8s-at-home/wmbusmeters
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install wmbusmeters k8s-at-home/wmbusmeters -f values.yaml
```

## Custom configuration

**IMPORTANT NOTE:** a rtlsdr device must be accessible on the node where this pod runs, in order for this chart to function properly.

Wmbusmeters can auto-discover this dongle, but first you need to give the pod extended privileges:

```
securityContext:
  privileged: true
```

Alternatively you could mount the device directly, if you know what you are doing and can manually configure wmbusmetersto use it:

```yaml
host-dev:
  enabled: true
  type: hostPath
  hostPath: /dev/device1
  mountPath: /dev/device1
```

Second you will need to set a nodeAffinity rule, for example if you are using [node-feature-discovery](https://github.com/kubernetes-sigs/node-feature-discovery):

```yaml
  nodeSelector:
    feature.node.kubernetes.io/custom-rtl: "true"
```

or by simply labeling the node which has the usb dongle:

```yaml
affinity:
  nodeAffinity:
    requiredDuringSchedulingIgnoredDuringExecution:
      nodeSelectorTerms:
      - matchExpressions:
        - key: app
          operator: In
          values:
          - rtlsdr-dongle
```

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| config | string | `"loglevel=normal\ndevice=rtlwmbus\nlistento=t1\nlogtelegrams=false\nformat=json\nmeterfiles=/wmbusmeters_data/logs/meter_readings\nmeterfilesaction=overwrite\nlogfile=/wmbusmeters_data/logs/wmbusmeters.log\n"` | Set the default config for wmbusmeters, see: https://github.com/weetmuts/wmbusmeters/blob/master/README.md |
| env | object | See below | environment variables. |
| env.TZ | string | `"UTC"` | Set the container timezone |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"weetmuts/wmbusmeters"` | image repository |
| image.tag | string | `"release-1.4.1-amd64"` | image tag |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| securityContext.privileged | bool | `true` | (bool) Privileged securityContext may be required if USB controller is accessed directly through the host machine |
| wmbusmeters | list | `[{"config":"name=watermeter\ntype=multical21\nid=1234567\nkey=000000000000000000000000\n","name":"watermeter"}]` | Set the config for individual meters to read, see: https://github.com/weetmuts/wmbusmeters/blob/master/README.md |

## Changelog

### Version 1.3.2

#### Added

N/A

#### Changed

* Upgraded `common` chart dependency to version 4.4.2

#### Fixed

N/A

### Older versions

A historical overview of changes can be found on [ArtifactHUB](https://artifacthub.io/packages/helm/k8s-at-home/wmbusmeters?modal=changelog)

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v0.1.1](https://github.com/k8s-at-home/helm-docs/releases/v0.1.1)
