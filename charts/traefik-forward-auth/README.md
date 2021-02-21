# traefik-forward-auth

![Version: 1.0.5](https://img.shields.io/badge/Version-1.0.5-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2.2.0](https://img.shields.io/badge/AppVersion-2.2.0-informational?style=flat-square)

A minimal forward authentication service that provides OAuth/SSO login and authentication for the traefik reverse proxy/load balancer

**Homepage:** <https://github.com/k8s-at-home/charts/tree/master/charts/traefik-forward-auth>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| DirtyCajunRice | nick@cajun.pro |  |

## Source Code

* <https://github.com/thomseddon/traefik-forward-auth>
* <https://hub.docker.com/r/thomseddon/traefik-forward-auth>

## Values

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

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
