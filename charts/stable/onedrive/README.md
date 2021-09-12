# onedrive

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![AppVersion: v2.4.12](https://img.shields.io/badge/AppVersion-v2.4.12-informational?style=flat-square)

A free Microsoft OneDrive Client which supports OneDrive Personal, OneDrive for Business, OneDrive for Office365, and SharePoint

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/abraunegg/onedrive>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://library-charts.k8s-at-home.com | common | 4.0.0 |

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install onedrive k8s-at-home/onedrive
```

## Installing the Chart

To install the chart with the release name `onedrive`

```console
helm install onedrive k8s-at-home/onedrive
```

## Uninstalling the Chart

To uninstall the `onedrive` deployment

```console
helm uninstall onedrive
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install onedrive \
  --set env.TZ="America/New York" \
    k8s-at-home/onedrive
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install onedrive k8s-at-home/onedrive -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| auth | object | See values.yaml | Configure auth secret for onedrive to initialize with |
| config | string | `"# Configuration for OneDrive Linux Client\n# This file contains the list of supported configuration fields\n# with their default values.\n# All values need to be enclosed in quotes\n# When changing a config option below, remove the '#' from the start of the line\n# For explanations of all config options below see docs/USAGE.md or the man page.\n#\n# sync_dir = \"/onedrive/data\"\n# skip_file = \"~*|.~*|*.tmp\"\n# monitor_interval = \"300\"\n# skip_dir = \"\"\n# log_dir = \"/var/log/onedrive/\"\n# drive_id = \"\"\n# upload_only = \"false\"\n# check_nomount = \"false\"\n# check_nosync = \"false\"\n# download_only = \"false\"\n# disable_notifications = \"false\"\n# disable_upload_validation = \"false\"\n# enable_logging = \"false\"\n# force_http_2 = \"false\"\n# local_first = \"false\"\n# no_remote_delete = \"false\"\n# skip_symlinks = \"false\"\n# debug_https = \"false\"\n# skip_dotfiles = \"false\"\n# dry_run = \"false\"\n# min_notify_changes = \"5\"\n# monitor_log_frequency = \"5\"\n# monitor_fullscan_frequency = \"10\"\n# sync_root_files = \"false\"\n# classify_as_big_delete = \"1000\"\n# user_agent = \"\"\n# remove_source_files = \"false\"\n# skip_dir_strict_match = \"false\"\napplication_id = \"21c49a0d-d22c-4792-acd1-8f163c982557\"\n# resync = \"false\"\n# bypass_data_preservation = \"false\"\n# azure_ad_endpoint = \"\"\n# azure_tenant_id = \"common\"\n# sync_business_shared_folders = \"false\"\n# sync_dir_permissions = \"700\"\n# sync_file_permissions = \"600\"\n# rate_limit = \"131072\"\n"` |  |
| env | object | See below | environment variables. |
| env.TZ | string | `"UTC"` | Set the container timezone |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"ghcr.io/wrmilling/onedrive-docker"` | image repository |
| image.tag | string | `"stretch-202106142112"` | image tag |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [1.0.0]

#### Added

- Ability to run a abraunegg/onedrive instance

[1.0.0]: #1.0.0

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
