# onedrive

![Version: 1.1.0](https://img.shields.io/badge/Version-1.1.0-informational?style=flat-square) ![AppVersion: v2.4.12](https://img.shields.io/badge/AppVersion-v2.4.12-informational?style=flat-square)

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

To use this chart, you will need to set an application_id in the `config` section as well as a secret (called `onedrive-auth` by default) with a field called `auth-response` that has the value derrived from the process below.

In order to generate an auth-response value you must do the following:

1. Visit the following URL, replacing `<APPLICATION_ID>` with the one you generated above: `https://login.microsoftonline.com/common/oauth2/v2.0/authorize?client_id=d50ca740-c83f-4d1b-b616-12c519384f0c&scope=Files.ReadWrite%20Files.ReadWrite.all%20Sites.ReadWrite.All%20offline_access&response_type=code&redirect_uri=https://login.microsoftonline.com/common/oauth2/nativeclient`
2. Authenticate with your OneDrive account.
3. Copy the URL when you arrive at the blank page (should look like this: `https://login.microsoftonline.com/common/oauth2/nativeclient?code=<redacted>`) and use that as the `auth-reponse` value in the previously mentioned secret `onedrive-auth`.

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| auth | object | See values.yaml | Configure auth secret for onedrive to initialize with |
| config | string | `"# Configuration for OneDrive Linux Client\n# This file contains the list of supported configuration fields\n# with their default values.\n# All values need to be enclosed in quotes\n# When changing a config option below, remove the '#' from the start of the line\n# For explanations of all config options below see docs/USAGE.md or the man page.\n#\n# sync_dir = \"/onedrive/data\"\n# skip_file = \"~*|.~*|*.tmp\"\n# monitor_interval = \"300\"\n# skip_dir = \"\"\n# log_dir = \"/var/log/onedrive/\"\n# drive_id = \"\"\n# upload_only = \"false\"\n# check_nomount = \"false\"\n# check_nosync = \"false\"\n# download_only = \"false\"\n# disable_notifications = \"false\"\n# disable_upload_validation = \"false\"\n# enable_logging = \"false\"\n# force_http_2 = \"false\"\n# local_first = \"false\"\n# no_remote_delete = \"false\"\n# skip_symlinks = \"false\"\n# debug_https = \"false\"\n# skip_dotfiles = \"false\"\n# dry_run = \"false\"\n# min_notify_changes = \"5\"\n# monitor_log_frequency = \"5\"\n# monitor_fullscan_frequency = \"10\"\n# sync_root_files = \"false\"\n# classify_as_big_delete = \"1000\"\n# user_agent = \"\"\n# remove_source_files = \"false\"\n# skip_dir_strict_match = \"false\"\napplication_id = \"d50ca740-c83f-4d1b-b616-12c519384f0c\"\n# resync = \"false\"\n# bypass_data_preservation = \"false\"\n# azure_ad_endpoint = \"\"\n# azure_tenant_id = \"common\"\n# sync_business_shared_folders = \"false\"\n# sync_dir_permissions = \"700\"\n# sync_file_permissions = \"600\"\n# rate_limit = \"131072\"\n"` |  |
| env | object | See below and commented variables in values.yaml | environment variables. |
| env.KAH_HELM_INSTALL | int | `1` | Indicate to container to run K8s specific setup |
| env.ONEDRIVE_AUTHFILES | string | `"/onedrive/conf/auth-request:/onedrive/conf/auth-response"` | Set the auth request and response file locations for OneDrive |
| env.ONEDRIVE_GID | int | `1000` | Set the One Drive Group ID |
| env.ONEDRIVE_UID | int | `1000` | Set the OneDrive User ID |
| env.TZ | string | `"UTC"` | Set the container timezone |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"ghcr.io/wrmilling/onedrive-docker"` | image repository |
| image.tag | string | `"v1.0.0"` | image tag |
| persistence | object | See values.yaml for full listing | Configure persistence settings for the chart under this key. |
| persistence.config | object | `{"accessMode":"ReadWriteOnce","enabled":true,"mountPath":"/onedrive/conf"}` | OneDrive config storage |
| persistence.config.enabled | bool | `true` | If config storage should be enabled |
| persistence.data | object | `{"accessMode":"ReadWriteOnce","enabled":true,"mountPath":"/onedrive/data","readOnly":false,"retain":false,"size":"5Gi","type":"pvc"}` | OneDrive data storage |
| persistence.data.enabled | bool | `true` | If data storage should be enabled |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [1.1.0]

#### Added

- Modified the docker path to be against specific versions, no more `latest`
- Cleaned up the transfer between secrets to application so that login can happen
- Cleaned up Custom Setup section of README.md
- Hard coded upstream `application_id` (Doesn't change, can be updated with future releases from upstream)

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
