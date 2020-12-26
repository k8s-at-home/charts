# traefik-forward-auth

![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![Version: 1.0.1](https://img.shields.io/badge/Version-1.0.1-informational?style=flat-square) ![AppVersion: 2.2.0](https://img.shields.io/badge/AppVersion-2.2.0-informational?style=flat-square) [![ArtifactHub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/traefik-forward-auth)](https://artifacthub.io/packages/helm/traefik-forward-auth)

A minimal forward authentication service that provides OAuth/SSO login and authentication for the traefik reverse proxy/load balancer

The default values and container images used in this chart will allow for running in a multi-arch cluster (amd64, arm, arm64)

Chart that
* Adds docker image information leveraging the [official image](https://github.com/thomseddon/traefik-forward-auth)
* Deploys [traefik-forward-auth](https://github.com/thomseddon/traefik-forward-auth)

## TL;DR
```console
$ helm repo add k8s-at-home https://k8s-at-home.com/charts/
$ helm install k8s-at-home/traefik-forward-auth
```

## Installing the Chart
To install the chart with the release name `traefik-forward-auth`:
```console
helm install traefik-forward-auth k8s-at-home/traefik-forward-auth
```

## Uninstalling the Chart
To uninstall the `traefik-forward-auth` deployment:
```console
helm uninstall traefik-forward-auth
```
The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

Read through the [values.yaml](https://github.com/k8s-at-home/charts/blob/master/charts/traefik-forward-auth/values.yaml)
file. It has several commented out suggested values.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,
```console
helm install traefik-forward-auth \
  --set env.TZ="America/New York" \
    k8s-at-home/traefik-forward-auth
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.
For example,
```console
helm install traefik-forward-auth k8s-at-home/traefik-forward-auth --values values.yaml
```

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
| cookie.secret | string| `""` | Cookie Secret - useful when running multiple instances |
| default.action | string | `""` | [auth|allow] Default action (default: auth) |
| default.provider | string | `""` | [google|oidc|generic-oauth] Default provider (default: google) |
| env | list | `[]` |  |
| envFrom | list | `[]` | Load environment variables from secrets or configmaps |
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