# wikijs

![Version: 4.2.0](https://img.shields.io/badge/Version-4.2.0-informational?style=flat-square) ![AppVersion: 2.5.191](https://img.shields.io/badge/AppVersion-2.5.191-informational?style=flat-square)

Make documentation a joy to write using Wiki.js's beautiful and intuitive interface!

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://hub.docker.com/r/linuxserver/wikijs/>
* <https://github.com/Requarks/wiki>

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
helm install wikijs k8s-at-home/wikijs
```

## Installing the Chart

To install the chart with the release name `wikijs`

```console
helm install wikijs k8s-at-home/wikijs
```

## Uninstalling the Chart

To uninstall the `wikijs` deployment

```console
helm uninstall wikijs
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install wikijs \
  --set env.TZ="America/New York" \
    k8s-at-home/wikijs
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install wikijs k8s-at-home/wikijs -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env.DB_FILEPATH | string | `"/app/wiki/data/db.sqlite"` | Path to the SQLite file |
| env.DB_NAME | string | `nil` | Database name |
| env.DB_PASS | string | `nil` | Password to connect to the database |
| env.DB_PASS_FILE | string | `nil` | Path to the mapped file containing to the database password. (optional, replaces DB_PASS) |
| env.DB_PORT | string | `nil` | Port of the database |
| env.DB_SSL | string | `nil` | Set to either 1 or true to enable. (optional, off if omitted) |
| env.DB_SSL_CA | string | `nil` | Database CA certificate content, as a single line string (without spaces or new lines), without the prefix and suffix lines. (optional, requires 2.3+) |
| env.DB_TYPE | string | `"sqlite"` | mysql, postgres, mariadb, mssql or sqlite |
| env.DB_USER | string | `nil` | Username to connect to the database |
| env.TZ | string | `nil` | Set the time zone, e.g. Europe/Amsterdam |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"linuxserver/wikijs"` |  |
| image.tag | string | `"version-2.5.191"` |  |
| ingress."ingress.hosts[0].host" | string | `"chart-example.local"` |  |
| ingress."ingress.hosts[0].paths[0].path" | string | `"/"` |  |
| ingress."ingress.hosts[0].paths[0].pathType" | string | `"Prefix"` |  |
| ingress.enabled | bool | `false` |  |
| persistence.config.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.config.emptyDir.enabled | bool | `false` |  |
| persistence.config.enabled | bool | `false` |  |
| persistence.config.size | string | `"1Gi"` |  |
| persistence.data.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.data.emptyDir.enabled | bool | `false` |  |
| persistence.data.enabled | bool | `false` |  |
| persistence.data.mountPath | string | `"/app/wiki/data"` |  |
| persistence.data.size | string | `"1Gi"` |  |
| service.port | object | `{"port":3000,"targetPort":3000}` | The default port is 3000 used by wiki.ks |
| strategy.type | string | `"Recreate"` |  |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [0.0.1]

#### Added

- First version of the helm chart for wikijs

#### Changed

- N/A

#### Removed

- N/A

[0.0.1]: #0.0.1

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
