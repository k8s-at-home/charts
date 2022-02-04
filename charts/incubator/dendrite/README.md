# dendrite

![Version: 1.0.2](https://img.shields.io/badge/Version-1.0.2-informational?style=flat-square) ![AppVersion: 0.5.1](https://img.shields.io/badge/AppVersion-0.5.1-informational?style=flat-square)

Dendrite Matrix Homeserver

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/matrix-org/dendrite>
* <https://github.com/matrix-org/dendrite/tree/master/build/docker>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | postgresql | 10.14.4 |
| https://library-charts.k8s-at-home.com | common | 4.3.0 |

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install dendrite k8s-at-home/dendrite
```

## Installing the Chart

To install the chart with the release name `dendrite`

```console
helm install dendrite k8s-at-home/dendrite
```

## Uninstalling the Chart

To uninstall the `dendrite` deployment

```console
helm uninstall dendrite
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install dendrite \
  --set env.TZ="America/New York" \
    k8s-at-home/dendrite
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install dendrite k8s-at-home/dendrite -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| dendrite | object | See values.yaml | Configuration for Dendrite. For more information see [the sample denrite-config.yaml](https://github.com/matrix-org/dendrite/blob/master/build/docker/config/dendrite-config.yaml) |
| dendrite.components | object | See values.yaml | Configure the dendrite components. |
| dendrite.components.app_service_api | object | See values.yaml | Configure the App Service API |
| dendrite.components.client_api | object | `{"captcha":{"enabled":false,"recaptcha_bypass_secret":"","recaptcha_private_key":"","recaptcha_public_key":"","recaptcha_siteverify_api":""},"rate_limiting":{"cooloff_ms":500,"enabled":true,"threshold":5},"registration_disabled":false,"registration_shared_secret":"","turn":{"turn_password":"","turn_shared_secret":"","turn_uris":[],"turn_user_lifetime":"","turn_username":""}}` | Configure the Client API |
| dendrite.components.client_api.captcha | object | See values.yaml | Configure captcha for registration |
| dendrite.components.client_api.rate_limiting | object | values.yaml | Configure rate limiting. |
| dendrite.components.client_api.registration_disabled | bool | `false` | Enable or disable registration for this homeserver. |
| dendrite.components.client_api.registration_shared_secret | string | `""` | Shared secret that allows registration, despite registration_disabled. |
| dendrite.components.client_api.turn | object | See values.yaml | Configure TURN |
| dendrite.components.federation_api | object | values.yaml | Configure the Federation API |
| dendrite.components.media_api | object | values.yaml | Configure the Media API |
| dendrite.database | object | See values.yaml | Configure database connection parameters. |
| dendrite.global | object | See values.yaml | Configure the global settings for dendrite. |
| dendrite.global.dns_cache | object | See values.yaml | Configure DNS cache. |
| dendrite.global.dns_cache.enabled | bool | See values.yaml | If enabled, dns cache will be enabled. |
| dendrite.global.key_validity_period | string | `"168h0m0s"` | Configure the key_validity period |
| dendrite.global.metrics | object | See values.yaml | Configure prometheus metrics collection for dendrite. |
| dendrite.global.metrics.enabled | bool | See values.yaml | If enabled, metrics collection will be enabled |
| dendrite.global.server_name | string | `"localhost"` | (required) Configure the server name for the dendrite instance. |
| dendrite.global.trusted_third_party_id_servers | list | `["matrix.org","vector.im"]` | Configure the list of domains the server will trust as identity servers |
| dendrite.global.well_known_server_name | string | `""` | Configure the well-known server name and optional port |
| dendrite.logging | list | See values.yaml | Configure logging. |
| dendrite.matrix_key_secret | object | See values.yaml | If enabled, use an existing secret for matrix_key.pem. Otherwise a matrix_key.pem must be mounted to `/etc/dendrite`. |
| dendrite.tls_secret | object | See values.yaml | If enabled, use an existing secrets for the TLS certificate and key. Otherwise, to enable TLS a `server.crt` and `server.key` must be mounted at `/etc/dendrite`. |
| dendrite.tracing | object | See values.yaml | Configure opentracing. |
| image | object | `{"pullPolicy":"IfNotPresent","repository":"matrixdotorg/dendrite-monolith","tag":"v0.5.1"}` |  IMPORTANT NOTE This chart inherits from our common library chart. You can check the default values/options here: https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"matrixdotorg/dendrite-monolith"` | image repository |
| image.tag | string | `"v0.5.1"` | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| postgresql.enabled | bool | See value.yaml | Enable and configure postgres as the database for dendrite. |
| postgresql.image.repository | string | `"bitnami/postgresql"` |  |
| postgresql.image.tag | string | `"14.1.0"` |  |
| postgresql.initdbScriptsConfigMap | string | `"dendrite-postgresql-init-scripts"` |  |
| postgresql.persistence.enabled | bool | `false` |  |
| postgresql.postgresqlDatabase | string | `"dendrite"` |  |
| postgresql.postgresqlPassword | string | `"changeme"` |  |
| postgresql.postgresqlUsername | string | `"dendrite"` |  |
| service | object | See values.yaml | If added dendrite will start a HTTP and HTTPS listener args:   - "--tls-cert=server.crt"   - "--tls-key=server.key" -- Configures service settings for the chart. |
| service.main.ports.http | object | See values.yaml | Configures the default HTTP listener for dendrite |
| service.main.ports.https | object | See values.yaml | Configures the HTTPS listener for dendrite |

## Changelog

### Version 1.0.2

#### Added

* `postgresqlUsername` is used in `initdbScripts` rather than hardcoded value

#### Changed

* Upgraded `postgresql` image version to "14.1.0"

#### Fixed

* `initdbScripts` are now actually actually loaded

### Older versions

A historical overview of changes can be found on [ArtifactHUB](https://artifacthub.io/packages/helm/k8s-at-home/dendrite?modal=changelog)

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v0.1.1](https://github.com/k8s-at-home/helm-docs/releases/v0.1.1)
