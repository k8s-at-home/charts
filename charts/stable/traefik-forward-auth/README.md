# traefik-forward-auth

![Version: 1.0.11](https://img.shields.io/badge/Version-1.0.11-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2.2.0](https://img.shields.io/badge/AppVersion-2.2.0-informational?style=flat-square)

A minimal forward authentication service that provides OAuth/SSO login and authentication for the traefik reverse proxy/load balancer

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/thomseddon/traefik-forward-auth>
* <https://hub.docker.com/r/thomseddon/traefik-forward-auth>

## Requirements

## Dependencies

| Repository | Name | Version |
|------------|------|---------|

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install traefik-forward-auth k8s-at-home/traefik-forward-auth
```

## Installing the Chart

To install the chart with the release name `traefik-forward-auth`

```console
helm install traefik-forward-auth k8s-at-home/traefik-forward-auth
```

## Uninstalling the Chart

To uninstall the `traefik-forward-auth` deployment

```console
helm uninstall traefik-forward-auth
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install traefik-forward-auth \
  --set env.TZ="America/New York" \
    k8s-at-home/traefik-forward-auth
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install traefik-forward-auth k8s-at-home/traefik-forward-auth -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| authHost | string | `""` | Single host to use when returning from 3rd party auth |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| cookie.csrfName | string | `""` | CSRF Cookie Name (default: _forward_auth_csrf) |
| cookie.domain | string | `""` | Domain(s) to set auth cookie on. (Comma delimited) |
| cookie.insecure | string | `""` | Use insecure cookies |
| cookie.name | string | `""` | Cookie Name (default: _forward_auth) |
| cookie.secret | string | `""` | Cookie Secret used for authentication across multiple instances / clusters (default: randomly generated) |
| default.action | string | `""` | [auth|allow] Default action (default: auth) |
| default.provider | string | `""` | [google|oidc|generic-oauth] Default provider (default: google) |
| env | list | `[]` |  |
| envFrom | string | `nil` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"thomseddon/traefik-forward-auth"` |  |
| image.tag | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths | list | `[]` |  |
| ingress.tls | list | `[]` |  |
| lifetime | string | `""` | Lifetime in seconds (default: 43200) |
| livenessProbe | object | {"periodSeconds":20,"tcpSocket":{"port":"http"}} | Liveness probe configuration |
| livenessProbe.enabled | bool | `true` | Enable liveness probe |
| logging.format | string | `""` | [text|json|pretty] Log format (default: text) |
| logging.level | string | `""` | [trace|debug|info|warn|error|fatal|panic] Log level (default: warn) |
| logoutRedirect | string | `""` | URL to redirect to following logout |
| middleware.enabled | bool | `false` | Enable to deploy a preconfigured middleware |
| middleware.name | string | `""` | Name for the middleware |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| providers.genericOauth.authUrl | string | `""` | Auth/Login URL |
| providers.genericOauth.clientId | string | `""` | Client ID |
| providers.genericOauth.clientSecret | string | `""` | Client Secret |
| providers.genericOauth.enabled | bool | `false` | Enable the generic OAUTH2 provider |
| providers.genericOauth.resource | string | `""` | Optional resource indicator |
| providers.genericOauth.scope | string | `""` | Scopes (default: profile, email) |
| providers.genericOauth.tokenStyle | string | `""` | How token is presented when querying the User URL |
| providers.genericOauth.tokenUrl | string | `""` | Token URL |
| providers.genericOauth.userUrl | string | `""` | URL used to retrieve user info |
| providers.google.clientId | string | `""` | Client ID |
| providers.google.clientSecret | string | `""` | Client Secret |
| providers.google.enabled | bool | `false` | Enable the google provider |
| providers.google.prompt | string | `""` | Space separated list of OpenID prompt options |
| providers.oidc.clientId | string | `""` | Client ID |
| providers.oidc.clientSecret | string | `""` | Client Secret |
| providers.oidc.enabled | bool | `false` | Enable the generic OIDC provider |
| providers.oidc.issuerUrl | string | `""` | Issuer URL |
| providers.oidc.resource | string | `""` | Optional resource indicator |
| readinessProbe | object | {"periodSeconds":10,"tcpSocket":{"port":"http"}} | Readiness probe configuration |
| readinessProbe.enabled | bool | `true` | Enable readiness probe |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| restrictions.domain | string | `""` | Only allow given email domains. (Comma delimited) |
| restrictions.whitelist | string | `""` | Only allow given email addresses. (Comma delimited) |
| secret | string | `""` | Secret used for signing. If empty, one will be generated. If specifying your own in env use "-" |
| securityContext | object | `{}` |  |
| service.additionalSpec | object | `{}` |  |
| service.annotations | object | `{}` |  |
| service.labels | object | `{}` |  |
| service.port | int | `4181` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| tolerations | list | `[]` |  |
| urlPath | string | `""` | Callback URL Path (default: /_oauth) |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [1.0.6]

#### Added

- N/A

#### Changed

- use helm-docs

#### Removed

- N/A

[1.0.6]: #1.0.6

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/introduction/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
