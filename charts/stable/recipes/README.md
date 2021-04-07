# recipes

![Version: 4.2.0](https://img.shields.io/badge/Version-4.2.0-informational?style=flat-square) ![AppVersion: 0.13.0](https://img.shields.io/badge/AppVersion-0.13.0-informational?style=flat-square)

Recipes is a Django application to manage, tag and search recipes using either built in models or external storage providers hosting PDF's, Images or other files.

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/vabene1111/recipes>
* <https://hub.docker.com/r/vabene1111/recipes>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://library-charts.k8s-at-home.com | common | 2.2.0 |

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install recipes k8s-at-home/recipes
```

## Installing the Chart

To install the chart with the release name `recipes`

```console
helm install recipes k8s-at-home/recipes
```

## Uninstalling the Chart

To uninstall the `recipes` deployment

```console
helm uninstall recipes
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install recipes \
  --set env.TZ="America/New York" \
    k8s-at-home/recipes
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install recipes k8s-at-home/recipes -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| additionalContainers[0].image | string | `"nginx:1.19.6"` |  |
| additionalContainers[0].name | string | `"nginx"` |  |
| additionalContainers[0].ports[0].containerPort | int | `80` |  |
| additionalContainers[0].ports[0].name | string | `"http"` |  |
| additionalContainers[0].volumeMounts[0].mountPath | string | `"/etc/nginx/nginx.conf"` |  |
| additionalContainers[0].volumeMounts[0].name | string | `"recipes-config"` |  |
| additionalContainers[0].volumeMounts[0].readOnly | bool | `true` |  |
| additionalContainers[0].volumeMounts[0].subPath | string | `"nginx-config"` |  |
| additionalVolumes[0].configMap.name | string | `"recipes-config"` |  |
| additionalVolumes[0].name | string | `"recipes-config"` |  |
| env.ALLOWED_HOSTS | string | `"*"` |  |
| env.COMMENT_PREF_DEFAULT | string | `"1"` |  |
| env.DB_ENGINE | string | `"django.db.backends.sqlite3"` |  |
| env.DEBUG | string | `"0"` |  |
| env.FRACTION_PREF_DEFAULT | string | `"0"` |  |
| env.GUNICORN_MEDIA | string | `"0"` |  |
| env.POSTGRES_DB | string | `nil` |  |
| env.POSTGRES_HOST | string | `nil` |  |
| env.POSTGRES_PASSWORD | string | `nil` |  |
| env.POSTGRES_PORT | string | `nil` |  |
| env.POSTGRES_USER | string | `nil` |  |
| env.SECRET_KEY | string | `"changeme"` |  |
| env.SHOPPING_MIN_AUTOSYNC_INTERVAL | string | `"5"` |  |
| env.TIMEZONE | string | `"America/New_York"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"vabene1111/recipes"` |  |
| image.tag | string | `"0.13.0"` |  |
| ingress.enabled | bool | `false` |  |
| persistence.config.enabled | bool | `false` |  |
| persistence.media.emptyDir.enabled | bool | `false` |  |
| persistence.media.enabled | bool | `false` |  |
| persistence.media.mountPath | string | `"/opt/recipes/mediafiles"` |  |
| persistence.static.emptyDir.enabled | bool | `false` |  |
| persistence.static.enabled | bool | `false` |  |
| persistence.static.mountPath | string | `"/opt/recipes/staticfiles"` |  |
| service.port.port | int | `80` |  |
| strategy.type | string | `"Recreate"` |  |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [1.0.0]

#### Added

- N/A

#### Changed

- N/A

#### Removed

- N/A

[1.0.0]: #1.0.0

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
