# sharry

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![AppVersion: 1.6.0](https://img.shields.io/badge/AppVersion-1.6.0-informational?style=flat-square)

Sharry allows to share files with others in a simple way. It is a self-hosted web application. The basic concept is to upload files and get a url back that can then be shared.

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/eikek/sharry>
* <https://hub.docker.com/r/eikek0/sharry>

## Requirements

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://library-charts.k8s-at-home.com | common | 1.0.0 |

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install sharry k8s-at-home/sharry
```

## Installing the Chart

To install the chart with the release name `sharry`

```console
helm install sharry k8s-at-home/sharry
```

## Uninstalling the Chart

To uninstall the `sharry` deployment

```console
helm uninstall sharry
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](../common/values.yaml) from the [common library](../common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install sharry \
  --set env.TZ="America/New York" \
    k8s-at-home/sharry
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install sharry k8s-at-home/sharry -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| additionalVolumeMounts[0].mountPath | string | `"/opt/sharry.conf"` |  |
| additionalVolumeMounts[0].name | string | `"sharry-config"` |  |
| additionalVolumeMounts[0].subPath | string | `"sharry.conf"` |  |
| additionalVolumes[0].configMap.name | string | `"sharry-config"` |  |
| additionalVolumes[0].name | string | `"sharry-config"` |  |
| affinity | object | `{}` | Affinity settings for pod assignment of the GUI |
| args[0] | string | `"/opt/sharry.conf"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"eikek0/sharry"` | sharry image |
| image.tag | string | `"1.6.0"` | sharry image tag |
| ingress.annotations."nginx.ingress.kubernetes.io/client-body-buffer-size" | string | `"2048m"` | Nginx client Body Buffer Size  |
| ingress.annotations."nginx.ingress.kubernetes.io/proxy-body-size" | string | `"2048m"` | Nginx Proxy Body Size  |
| ingress.annotations."nginx.ingress.kubernetes.io/proxy-buffering" | string | `"off"` |  |
| ingress.enabled | bool | `false` |  |
| nodeSelector | object | `{}` | Node labels for pod assignment of the GUI |
| podAnnotations | object | `{}` | Pod annotations |
| resources | object | `{}` |  |
| service.port.port | int | `9090` | Kubernetes port where the GUI is exposed |
| sharry.baseUrl | string | `"http://localhost:9090"` | This is the base URL this application is deployed to. |
| sharry.chunkSize | string | `"512K"` | When storing binary data use chunks of this size. |
| sharry.jdbcPassword | string | `""` | jdbc Password |
| sharry.jdbcUrl | string | `"jdbc:h2://\"${java.io.tmpdir}\"/sharry-demo.db;MODE=PostgreSQL;DATABASE_TO_LOWER=TRUE"` | By default a H2 file-based database is configured. You can provide a postgresql or mariadb connection here. |
| sharry.jdbcUser | string | `"sa"` | jdbc Username |
| sharry.maxSize | string | `"1.5G"` | Maximum size of a share. |
| sharry.maxValidity | string | `"365 days"` | Maximum validity for uploads. |
| sharry.signup | string | `"open"` | The mode defines if new users can signup or not. It can have three values : open, invite, closed |
| tolerations | list | `[]` | Toleration labels for pod assignment of the GUI |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)