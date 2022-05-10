# games-on-whales

![Version: 1.7.2](https://img.shields.io/badge/Version-1.7.2-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

Streams graphic applications/games (retroarch, firefox, steam) runing on Kubernetes

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/games-on-whales/gow>

## Requirements

Kubernetes: `>=1.19.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://library-charts.k8s-at-home.com | common | 4.4.2 |

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install games-on-whales k8s-at-home/games-on-whales
```

## Installing the Chart

To install the chart with the release name `games-on-whales`

```console
helm install games-on-whales k8s-at-home/games-on-whales
```

## Uninstalling the Chart

To uninstall the `games-on-whales` deployment

```console
helm uninstall games-on-whales
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install games-on-whales \
  --set env.TZ="America/New York" \
    k8s-at-home/games-on-whales
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install games-on-whales k8s-at-home/games-on-whales -f values.yaml
```

## Custom configuration

### GPU

You need a real graphic card in your Kubernetes node to run Games on Whales:

#### Intel

It does not require any custom settings but if you use [intel-gpu-plugin](https://github.com/k8s-at-home/charts/tree/master/charts/stable/intel-gpu-plugin)
then you might use the `graphic_resources` value to specify the resource limits
such as:

```
graphic_resources:
  gpu.intel.com/i915: 1 # requesting 1 i915 GPU
```

#### Nvidia

If you use the Nvidia propietary device driver then you will need the
[Nvidia device plugin](https://github.com/NVIDIA/k8s-device-plugin).

#### Proxmox

If you use Proxmox you might use PCI pass-through but you also need to ensure
the host does not load any modules for the graphic card. See the
[instructions](https://pve.proxmox.com/wiki/Pci_passthrough).

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| firefox.enabled | bool | `true` | enable/disable firefox container |
| firefox.image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| firefox.image.repository | string | `"andrewmackrodt/firefox-x11"` | image repository |
| firefox.image.tag | string | `"91.0.2-r1"` | image tag |
| firefox.logLevel | string | `"info"` | firefox log level |
| firefox.volumeMounts | list | `[]` | firefox extra volume mounts |
| graphic_resources | object | `nil` | Pass GPU resources to Xorg, steam and retroarch containers See Custom configuration section in the Readme |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| mkhomeretrodirs.image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| mkhomeretrodirs.image.repository | string | `"busybox"` | image repository |
| mkhomeretrodirs.image.tag | string | `"1.34.0"` | image tag |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| pulse | object | See values.yaml | Configure pulse audio settings |
| pulseaudio.image.pullPolicy | string | `"IfNotPresent"` | pulseaudio image pull policy |
| pulseaudio.image.repository | string | `"ghcr.io/games-on-whales/pulseaudio"` | pulseaudio image repository |
| pulseaudio.image.tag | string | `"1.0.0"` | pulseaudio image tag |
| retroarch.enabled | bool | `true` | enable/disable retroarch container |
| retroarch.image.pullPolicy | string | `"IfNotPresent"` | retroarch image pull policy |
| retroarch.image.repository | string | `"ghcr.io/games-on-whales/retroarch"` | retroarch image repository |
| retroarch.image.tag | string | `"1.0.0"` | retroarch image tag |
| retroarch.logLevel | string | `"info"` | retroarch log level |
| retroarch.volumeMounts | list | `[]` | retroarch extra volume mounts |
| service.main | object | See values.yaml | Enable and configure TCP service settings for the chart under this key. |
| service.udp | object | See values.yaml | Enable and configure UDP service settings for the chart under this key. |
| steam.enabled | bool | `true` | enable/disable steam container |
| steam.image.pullPolicy | string | `"IfNotPresent"` | steam image pull policy |
| steam.image.repository | string | `"ghcr.io/games-on-whales/steam"` | steam image repository |
| steam.image.tag | string | `"1.0.0"` | steam image tag |
| steam.protonLog | int | `1` | enable proton log |
| steam.volumeMounts | list | `[]` | steam extra volume mounts |
| sunshine.env | object | `{}` | sunshine additional env settings |
| sunshine.image.pullPolicy | string | `"IfNotPresent"` | sunshine image pull policy |
| sunshine.image.repository | string | `"ghcr.io/games-on-whales/sunshine"` | sunshine image repository |
| sunshine.image.tag | string | `"1.0.0"` | sunshine image tag |
| sunshine.logLevel | string | `"info"` | sunshine log level |
| sunshine.password | string | `"admin"` | sunshine web interface pasword |
| sunshine.user | string | `"admin"` | sunshine web interface user |
| xorg.display | string | `":99"` | xorg display ID |
| xorg.image.pullPolicy | string | `"IfNotPresent"` | xorg image pull policy |
| xorg.image.repository | string | `"ghcr.io/games-on-whales/xorg"` | xorg image repository |
| xorg.image.tag | string | `"1.0.0"` | xorg image tag |
| xorg.refreshrate | int | `60` | xorg refresh rate |
| xorg.resolution | string | `"1920x1080"` | xorg resolution |

## Changelog

### Version 1.7.2

#### Added

N/A

#### Changed

* Upgraded `common` chart dependency to version 4.4.2

#### Fixed

N/A

### Older versions

A historical overview of changes can be found on [ArtifactHUB](https://artifacthub.io/packages/helm/k8s-at-home/games-on-whales?modal=changelog)

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v0.1.1](https://github.com/k8s-at-home/helm-docs/releases/v0.1.1)
