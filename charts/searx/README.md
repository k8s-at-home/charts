# searx

![Version: 2.0.1](https://img.shields.io/badge/Version-2.0.1-informational?style=flat-square) ![AppVersion: 0.18.0](https://img.shields.io/badge/AppVersion-0.18.0-informational?style=flat-square)

Searx is a privacy-respecting, hackable metasearch engine

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/searx/searx>
* <https://searx.github.io/searx/>
* <https://hub.docker.com/r/searx/searx>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://k8s-at-home.com/charts/ | common | 3.0.1 |

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install searx k8s-at-home/searx
```

## Installing the Chart

To install the chart with the release name `searx`

```console
helm install searx k8s-at-home/searx
```

## Uninstalling the Chart

To uninstall the `searx` deployment

```console
helm uninstall searx
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](../common/values.yaml) from the [common library](../common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install searx \
  --set env.TZ="America/New York" \
    k8s-at-home/searx
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install searx k8s-at-home/searx -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/charts/tree/master/charts/common/)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| additionalContainers[0].image | string | `"caddy:2.2.0-alpine"` |  |
| additionalContainers[0].name | string | `"caddy"` |  |
| additionalContainers[0].ports[0].containerPort | int | `80` |  |
| additionalContainers[0].ports[0].name | string | `"http"` |  |
| additionalContainers[0].volumeMounts[0].mountPath | string | `"/etc/caddy/Caddyfile"` |  |
| additionalContainers[0].volumeMounts[0].name | string | `"searx-config"` |  |
| additionalContainers[0].volumeMounts[0].subPath | string | `"Caddyfile"` |  |
| additionalContainers[0].volumeMounts[1].mountPath | string | `"/srv/searx-checker"` |  |
| additionalContainers[0].volumeMounts[1].name | string | `"searx-checker"` |  |
| additionalContainers[1].args[0] | string | `"-listen"` |  |
| additionalContainers[1].args[1] | string | `"0.0.0.0:4040"` |  |
| additionalContainers[1].args[2] | string | `"-api"` |  |
| additionalContainers[1].args[3] | string | `"0.0.0.0:4041"` |  |
| additionalContainers[1].args[4] | string | `"-target"` |  |
| additionalContainers[1].args[5] | string | `"localhost:8080"` |  |
| additionalContainers[1].image | string | `"dalf/filtron:latest"` |  |
| additionalContainers[1].imagePullPolicy | string | `"Always"` |  |
| additionalContainers[1].name | string | `"filtron"` |  |
| additionalContainers[1].ports[0].containerPort | int | `4040` |  |
| additionalContainers[1].ports[0].name | string | `"filtron"` |  |
| additionalContainers[1].ports[1].containerPort | int | `4041` |  |
| additionalContainers[1].ports[1].name | string | `"api"` |  |
| additionalContainers[1].volumeMounts[0].mountPath | string | `"/etc/filtron/rules.json"` |  |
| additionalContainers[1].volumeMounts[0].name | string | `"searx-config"` |  |
| additionalContainers[1].volumeMounts[0].subPath | string | `"rules.json"` |  |
| additionalContainers[2].args[0] | string | `"-listen"` |  |
| additionalContainers[2].args[1] | string | `"localhost:3000"` |  |
| additionalContainers[2].args[2] | string | `"-timeout"` |  |
| additionalContainers[2].args[3] | string | `"6"` |  |
| additionalContainers[2].args[4] | string | `"ipv6"` |  |
| additionalContainers[2].envFrom[0].secretRef.name | string | `"searx-config"` |  |
| additionalContainers[2].image | string | `"dalf/morty:latest"` |  |
| additionalContainers[2].imagePullPolicy | string | `"Always"` |  |
| additionalContainers[2].name | string | `"morty"` |  |
| additionalContainers[2].ports[0].containerPort | int | `3000` |  |
| additionalContainers[2].ports[0].name | string | `"morty"` |  |
| additionalContainers[3].args[0] | string | `"-cron"` |  |
| additionalContainers[3].args[1] | string | `"-o"` |  |
| additionalContainers[3].args[2] | string | `"html/data/status.json"` |  |
| additionalContainers[3].args[3] | string | `"http://localhost:8080"` |  |
| additionalContainers[3].image | string | `"searx/searx-checker:latest"` |  |
| additionalContainers[3].name | string | `"searx-checker"` |  |
| additionalContainers[3].volumeMounts[0].mountPath | string | `"/usr/local/searx-checker/html/data"` |  |
| additionalContainers[3].volumeMounts[0].name | string | `"searx-checker"` |  |
| additionalVolumes[0].configMap.name | string | `"searx-config"` |  |
| additionalVolumes[0].name | string | `"searx-config"` |  |
| additionalVolumes[1].emptyDir | object | `{}` |  |
| additionalVolumes[1].name | string | `"searx-checker"` |  |
| envFrom[0].secretRef.name | string | `"searx-config"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"searx/searx"` |  |
| image.tag | string | `"0.18.0"` |  |
| ingress.enabled | bool | `false` |  |
| persistence.config.emptyDir | bool | `false` |  |
| persistence.config.enabled | bool | `false` |  |
| searx.existingSecret.enabled | bool | `false` |  |
| searx.baseUrl | string | `"https://searx.DOMAIN"` |  |
| searx.mortyKey | string | `"changeme"` |  |
| service.port.port | int | `80` |  |
| strategy.type | string | `"Recreate"` |  |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/charts/tree/master/charts/common/README.md#Changelog).

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

- See the [Wiki](https://github.com/k8s-at-home/charts/wiki)
- Open a [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/charts/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)