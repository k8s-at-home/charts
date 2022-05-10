# vikunja

![Version: 5.5.2](https://img.shields.io/badge/Version-5.5.2-informational?style=flat-square) ![AppVersion: 0.17.0](https://img.shields.io/badge/AppVersion-0.17.0-informational?style=flat-square)

The to-do app to organize your life

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://kolaente.dev/vikunja/api>
* <https://kolaente.dev/vikunja/frontend>
* <https://hub.docker.com/r/vikunja/api>
* <https://hub.docker.com/r/vikunja/frontend>
* <https://vikunja.io/docs/>

## Requirements

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | postgresql | 10.16.2 |
| https://library-charts.k8s-at-home.com | common | 4.4.2 |

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install vikunja k8s-at-home/vikunja
```

## Installing the Chart

To install the chart with the release name `vikunja`

```console
helm install vikunja k8s-at-home/vikunja
```

## Uninstalling the Chart

To uninstall the `vikunja` deployment

```console
helm uninstall vikunja
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install vikunja \
  --set env.TZ="America/New York" \
    k8s-at-home/vikunja
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install vikunja k8s-at-home/vikunja -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| additionalContainers.api | object | See values.yaml | Set up the vikunja API container. |
| additionalContainers.api.env | list | See below | You can declare most Vikunja parameters as environment variables. Please consult https://vikunja.io/docs/config-options/ to see all parameters. Note that parameters that are an array cannot be defined as environment variables (like the OpenID Connect settings). Use the vikunja.config Value for that. |
| additionalContainers.api.image | string | `"vikunja/api:0.17.1"` | Vikunja api image and tag |
| additionalContainers.api.volumeMounts | list | `[{"mountPath":"/etc/vikunja/config.yml","name":"vikunja-config","subPath":"Vikunja.yml"}]` |    value: myVeryComplexJWTSecret - name: VIKUNJA_DATABASE_TYPE   value: "postgres" - name: VIKUNJA_DATABASE_HOST   value: db - name: VIKUNJA_DATABASE_DATABASE   value: vikunja - name: VIKUNJA_DATABASE_USER   value: "vikunja" - name: VIKUNJA_DATABASE_PASSWORD   value: password |
| additionalContainers.frontend | object | See values.yaml | Set up the vikunja frontend container. |
| additionalContainers.frontend.image | string | `"vikunja/frontend:0.17.0"` | Vikunja frontend image and tag |
| caddy.noTls | bool | `false` | Disable auto tls if behind another loadbalancer or ingress |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"caddy"` | Caddy reverse proxy image and tag |
| image.tag | string | `"2.4.2-alpine"` | vikunja api image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| persistence.files | object | `{"enabled":false,"mountpath":"/app/vikunja/files"}` | Volume used for static files |
| service | object | See values.yaml | Configures service settings for the chart. |
| vikunja.config | string | `"service:\n  jwtsecret: \"myVeryComplexJWTSecret\""` | Provide Vikunja config as YAML string |

## Changelog

### Version 5.5.2

#### Added

N/A

#### Changed

* Upgraded `common` chart dependency to version 4.4.2

#### Fixed

N/A

### Older versions

A historical overview of changes can be found on [ArtifactHUB](https://artifacthub.io/packages/helm/k8s-at-home/vikunja?modal=changelog)

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v0.1.1](https://github.com/k8s-at-home/helm-docs/releases/v0.1.1)
