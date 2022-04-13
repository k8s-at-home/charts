# dendrite

![Version: 4.0.0](https://img.shields.io/badge/Version-4.0.0-informational?style=flat-square) ![AppVersion: v0.6.3](https://img.shields.io/badge/AppVersion-v0.6.3-informational?style=flat-square)

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
| https://charts.bitnami.com/bitnami | postgresql | 11.1.15 |
| https://library-charts.k8s-at-home.com | common | 4.3.0 |
| https://library-charts.k8s-at-home.com | federationapi(common) | 4.3.0 |
| https://library-charts.k8s-at-home.com | clientapi(common) | 4.3.0 |
| https://library-charts.k8s-at-home.com | mediaapi(common) | 4.3.0 |
| https://library-charts.k8s-at-home.com | syncapi(common) | 4.3.0 |
| https://library-charts.k8s-at-home.com | roomserver(common) | 4.3.0 |
| https://library-charts.k8s-at-home.com | eduserver(common) | 4.3.0 |
| https://library-charts.k8s-at-home.com | keyserver(common) | 4.3.0 |
| https://library-charts.k8s-at-home.com | userapi(common) | 4.3.0 |
| https://library-charts.k8s-at-home.com | appserviceapi(common) | 4.3.0 |
| https://nats-io.github.io/k8s/helm/charts/ | nats | 0.15.1 |

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

### Polylith Ingress

Due to the complexity of setting up ingress for each individual component it
is left up to the individual to add the necessary ingress fields to polylith deployments.

For more information see:
- https://github.com/matrix-org/dendrite/blob/master/docs/INSTALL.md#nginx-or-other-reverse-proxy
- and https://github.com/matrix-org/dendrite/blob/master/docs/nginx/polylith-sample.conf

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| appserviceapi | object | See values.yaml | Configure the app service api. For more information see [the sample dendrite configuration](https://github.com/matrix-org/dendrite/blob/master/build/docker/config/dendrite-config.yaml) |
| appserviceapi.image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| appserviceapi.image.repository | string | `"matrixdotorg/dendrite-polylith"` | image repository |
| appserviceapi.image.tag | string | chart.appVersion | image tag |
| clientapi | object | See values.yaml | Configuration for the client api component. For more information see [the sample dendrite configuration](https://github.com/matrix-org/dendrite/blob/master/build/docker/config/dendrite-config.yaml) |
| clientapi.config.captcha | object | See values.yaml | Configure captcha for registration |
| clientapi.config.rate_limiting | object | values.yaml | Configure rate limiting. |
| clientapi.config.registration_disabled | bool | `false` | Enable or disable registration for this homeserver. |
| clientapi.config.registration_shared_secret | string | `""` | Shared secret that allows registration, despite registration_disabled. |
| clientapi.config.turn | object | See values.yaml | Configure TURN |
| clientapi.image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| clientapi.image.repository | string | `"matrixdotorg/dendrite-polylith"` | image repository |
| clientapi.image.tag | string | chart.appVersion | image tag |
| dendrite | object | See values.yaml | Configuration for Dendrite. For more information see [the sample denrite-config.yaml](https://github.com/matrix-org/dendrite/blob/master/build/docker/config/dendrite-config.yaml) |
| dendrite.database | object | See values.yaml | Configure database connection parameters. |
| dendrite.global | object | See values.yaml | Configure the global settings for dendrite. |
| dendrite.global.dns_cache | object | See values.yaml | Configure DNS cache. |
| dendrite.global.dns_cache.enabled | bool | See values.yaml | If enabled, dns cache will be enabled. |
| dendrite.global.key_validity_period | string | `"168h0m0s"` | Configure the key_validity period |
| dendrite.global.metrics | object | See values.yaml | Configure prometheus metrics collection for dendrite. |
| dendrite.global.metrics.enabled | bool | See values.yaml | If enabled, metrics collection will be enabled |
| dendrite.global.mscs | list | `[]` | Configure experimental MSC's |
| dendrite.global.server_name | string | `"localhost"` | (required) Configure the server name for the dendrite instance. |
| dendrite.global.trusted_third_party_id_servers | list | `["matrix.org","vector.im"]` | Configure the list of domains the server will trust as identity servers |
| dendrite.global.well_known_server_name | string | `""` | Configure the well-known server name and optional port |
| dendrite.logging | list | See values.yaml | Configure logging. |
| dendrite.matrix_key_secret.create | bool | `false` | Create matrix_key secret using the keyBody below. |
| dendrite.matrix_key_secret.existingSecret | string | `""` | Use an existing secret |
| dendrite.matrix_key_secret.keyBody | string | `""` | New Key Body |
| dendrite.matrix_key_secret.secretPath | string | `"matrix_key.pem"` | Field in the secret to get the key from |
| dendrite.polylithEnabled | bool | `false` | Enable polylith deployment |
| dendrite.tls_secret | object | See values.yaml | If enabled, use an existing secrets for the TLS certificate and key. Otherwise, to enable TLS a `server.crt` and `server.key` must be mounted at `/etc/dendrite`. |
| dendrite.tracing | object | See values.yaml | Configure opentracing. |
| eduserver | object | values.yaml | Configure the edu server For more information see [the sample dendrite configuration](https://github.com/matrix-org/dendrite/blob/master/build/docker/config/dendrite-config.yaml) |
| eduserver.image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| eduserver.image.repository | string | `"matrixdotorg/dendrite-polylith"` | image repository |
| eduserver.image.tag | string | chart.appVersion | image tag |
| federationapi | object | values.yaml | Configure the Federation API For more information see [the sample dendrite configuration](https://github.com/matrix-org/dendrite/blob/master/build/docker/config/dendrite-config.yaml) |
| federationapi.image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| federationapi.image.repository | string | `"matrixdotorg/dendrite-polylith"` | image repository |
| federationapi.image.tag | string | chart.appVersion | image tag |
| image | object | `{"pullPolicy":"IfNotPresent","repository":"matrixdotorg/dendrite-monolith","tag":null}` |  IMPORTANT NOTE This chart inherits from our common library chart. You can check the default values/options here: https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"matrixdotorg/dendrite-monolith"` | image repository |
| image.tag | string | chart.appVersion | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| keyserver | object | See values.yaml | Configure the key server. For more information see [the sample dendrite configuration](https://github.com/matrix-org/dendrite/blob/master/build/docker/config/dendrite-config.yaml) |
| keyserver.image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| keyserver.image.repository | string | `"matrixdotorg/dendrite-polylith"` | image repository |
| keyserver.image.tag | string | chart.appVersion | image tag |
| mediaapi | object | values.yaml | Configure the Media API For more information see [the sample dendrite configuration](https://github.com/matrix-org/dendrite/blob/master/build/docker/config/dendrite-config.yaml) |
| mediaapi.image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| mediaapi.image.repository | string | `"matrixdotorg/dendrite-polylith"` | image repository |
| mediaapi.image.tag | string | chart.appVersion | image tag |
| nats.enabled | bool | See value.yaml | Enable and configure NATS for dendrite. Can be disabled for monolith deployments - an internal NATS server will be used in its place. |
| nats.nats.image | string | `"nats:2.7.1-alpine"` |  |
| nats.nats.jetstream.enabled | bool | `true` |  |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| persistence.jetstream | object | See values.yaml | Configure Jetsream persistence. This is highly recommended in production. |
| postgresql.enabled | bool | See value.yaml | Enable and configure postgres as the database for dendrite. |
| postgresql.image.repository | string | `"bitnami/postgresql"` |  |
| postgresql.image.tag | string | `"14.1.0"` |  |
| postgresql.initdbScriptsConfigMap | string | `"dendrite-postgresql-init-scripts"` |  |
| postgresql.persistence.enabled | bool | `false` |  |
| postgresql.postgresqlDatabase | string | `"dendrite"` |  |
| postgresql.postgresqlPassword | string | `"changeme"` |  |
| postgresql.postgresqlUsername | string | `"dendrite"` |  |
| roomserver | object | values.yaml | Configure the Room Server For more information see [the sample dendrite configuration](https://github.com/matrix-org/dendrite/blob/master/build/docker/config/dendrite-config.yaml) |
| roomserver.image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| roomserver.image.repository | string | `"matrixdotorg/dendrite-polylith"` | image repository |
| roomserver.image.tag | string | chart.appVersion | image tag |
| service | object | See values.yaml | If added dendrite will start a HTTP and HTTPS listener args:   - "--tls-cert=server.crt"   - "--tls-key=server.key" -- Configures service settings for the chart. |
| service.main.ports.http | object | See values.yaml | Configures the default HTTP listener for dendrite |
| service.main.ports.https | object | See values.yaml | Configures the HTTPS listener for dendrite |
| syncapi | object | values.yaml | Configure the Sync API For more information see [the sample dendrite configuration](https://github.com/matrix-org/dendrite/blob/master/build/docker/config/dendrite-config.yaml) |
| syncapi.image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| syncapi.image.repository | string | `"matrixdotorg/dendrite-polylith"` | image repository |
| syncapi.image.tag | string | chart.appVersion | image tag |
| userapi | object | values.yaml | Configure the User API For more information see [the sample dendrite configuration](https://github.com/matrix-org/dendrite/blob/master/build/docker/config/dendrite-config.yaml) |
| userapi.image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| userapi.image.repository | string | `"matrixdotorg/dendrite-polylith"` | image repository |
| userapi.image.tag | string | chart.appVersion | image tag |

## Changelog

### Version 4.0.0

#### Added

N/A

#### Changed

* Upgraded `postgresql` chart dependency to version `11.1.15`.

#### Fixed

N/A

### Older versions

A historical overview of changes can be found on [ArtifactHUB](https://artifacthub.io/packages/helm/k8s-at-home/dendrite?modal=changelog)

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v0.1.1](https://github.com/k8s-at-home/helm-docs/releases/v0.1.1)
