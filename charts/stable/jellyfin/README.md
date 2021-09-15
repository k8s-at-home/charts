# jellyfin

![Version: 9.0.1](https://img.shields.io/badge/Version-9.0.1-informational?style=flat-square) ![AppVersion: 10.7.5](https://img.shields.io/badge/AppVersion-10.7.5-informational?style=flat-square)

Jellyfin is a Free Software Media System

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://hub.docker.com/r/jellyfin/jellyfin>
* <https://github.com/jellyfin/jellyfin>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://library-charts.k8s-at-home.com | common | 4.0.1 |

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install jellyfin k8s-at-home/jellyfin
```

## Installing the Chart

To install the chart with the release name `jellyfin`

```console
helm install jellyfin k8s-at-home/jellyfin
```

## Uninstalling the Chart

To uninstall the `jellyfin` deployment

```console
helm uninstall jellyfin
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install jellyfin \
  --set env.TZ="America/New York" \
    k8s-at-home/jellyfin
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install jellyfin k8s-at-home/jellyfin -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env | object | See below | environment variables. See [image docs](https://jellyfin.org/docs/general/administration/configuration.html) for more details. |
| env.TZ | string | `"UTC"` | Set the container timezone |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"jellyfin/jellyfin"` | image repository |
| image.tag | string | `"10.7.5"` | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| podSecurityContext | object | `{}` | Configure the Security Context for the Pod |
| service | object | See values.yaml | Configures service settings for the chart. |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [9.0.0]

#### Changed

- Upgraded the common library dependency to version 4.0.0. This introduced (potentially) breaking changes to `initContainers` and `additionalContainers`. Be sure to check out the [library chart](https://github.com/k8s-at-home/library-charts/blob/common-4.0.0/charts/stable/common/) for the up-to-date values.

### [8.0.0]

#### Changed

- **BREAKING**: Upgraded the common library dependency to version 3.0.2. This introduces several breaking changes (`service`, `ingress` and `persistence` keys have been refactored).
  Be sure to check out the [library chart](https://github.com/k8s-at-home/library-charts/blob/common-3.0.2/charts/stable/common/) for the up-to-date values.
- Changed image tag to `10.7.5`.

### [7.3.2]

#### Changed

- Updated broken icon url.

### [6.0.0]

#### Migration !breaking changes!

*It is recommended to drop old configuration and start from scratch.*

This release will change the layout of `config` and `cache` persistent volumes.
To migrate the old configuration, manual modifications to volumes are required prior the upgrade or after the upgrade.
Be aware that `cache` will only be created after the upgrade if auto provisioning is used.

Mount (depends on used CSI) both volumes `config` and `cache` and be sure that jellyfin does not access the files (or is scaled down to zero).
The volumes are assumed to be mounted on `/mnt/config` and `/mnt/cache` in the example:

```bash
cd /mnt
mv config/cache/* cache/
rm -r config/cache
mkdir config/config
mv dlna/ branding.xml encoding.xml logging.default.json migrations.xml network.xml system.xml config/
mv data data.bak
mv data.bak/* .
rm -r data.bak
sed -i "s|<CachePath>.*</CachePath>|<CachePath>/cache</CachePath>|" config/system.xml
sed -i "s|<MetadataPath>.*</MetadataPath>|<MetadataPath>/config/metadata</MetadataPath>|" config/system.xml
sed -i "s|<EncoderAppPath>.*</EncoderAppPath>|<EncoderAppPath>/usr/lib/jellyfin-ffmpeg/ffmpeg</EncoderAppPath>|" config/encoding.xml
sed -i "s|<EncoderAppPathDisplay>.*</EncoderAppPathDisplay>|<EncoderAppPathDisplay>/usr/lib/jellyfin-ffmpeg/ffmpeg</EncoderAppPathDisplay>|" config/encoding.xml
```

Drop browser cache and cookies for your jellyfin URL!

#### Added

- Persistent volume definition for cache

#### Changed

- Replaced LinuxServer.io image with official

[9.0.0]: #900
[8.0.0]: #800
[7.3.2]: #732
[6.0.0]: #600

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
