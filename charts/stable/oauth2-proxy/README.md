# oauth2-proxy

![Version: 5.0.7](https://img.shields.io/badge/Version-5.0.7-informational?style=flat-square) ![AppVersion: 7.1.3](https://img.shields.io/badge/AppVersion-7.1.3-informational?style=flat-square)

A reverse proxy that provides authentication with Google, Github or other providers

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/oauth2-proxy/oauth2-proxy>

## Requirements

Kubernetes: `>=1.9.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install oauth2-proxy k8s-at-home/oauth2-proxy
```

## Installing the Chart

To install the chart with the release name `oauth2-proxy`

```console
helm install oauth2-proxy k8s-at-home/oauth2-proxy
```

## Uninstalling the Chart

To uninstall the `oauth2-proxy` deployment

```console
helm uninstall oauth2-proxy
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install oauth2-proxy \
  --set env.TZ="America/New York" \
    k8s-at-home/oauth2-proxy
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install oauth2-proxy k8s-at-home/oauth2-proxy -f values.yaml
```

## Custom configuration

### SSL Configuration

See: [SSL Configuration](https://oauth2-proxy.github.io/oauth2-proxy/docs/configuration/tls).
Use ```values.yaml``` like:

```yaml
...
extraArgs:
  tls-cert: /path/to/cert.pem
  tls-key: /path/to/cert.key

extraVolumes:
  - name: ssl-cert
    secret:
      secretName: my-ssl-secret

extraVolumeMounts:
  - mountPath: /path/to/
    name: ssl-cert
...
```

With a secret called `my-ssl-secret`:

```yaml
...
data:
  cert.pem: AB..==
  cert.key: CD..==
```

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | node/pod affinities Ref: https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity |
| authenticatedEmailsFile.enabled | bool | `false` | Enables authorize individual email addresses |
| authenticatedEmailsFile.restricted_access | string | `""` | [email addresses](https://oauth2-proxy.github.io/oauth2-proxy/docs/configuration/oauth_provider#email-authentication) list config |
| authenticatedEmailsFile.template | string | `""` | Name of the configmap that is handled outside of that chart It's a simpler way to maintain only one configmap (user list) instead changing it for each oauth2-proxy service. Be aware the value name in the extern config map in data needs to be named to "restricted_user_access". One email per line example: restricted_access: |-   name1@domain   name2@domain If you override the config with restricted_access it will configure a user list within this chart what takes care of the config map resource. |
| config.clientID | string | `"XXXXXXX"` | OAuth client ID |
| config.clientSecret | string | `"XXXXXXXX"` | OAuth client secret |
| config.configFile | string | `"email_domains = [ \"*\" ]\nupstreams = [ \"file:///dev/null\" ]"` | google service account json contents serviceAccountJson: xxxx -- Alternatively, use an existing secret (see google-secret.yaml for required fields) existingSecret: google-secret -- custom [oauth2_proxy.cfg](https://github.com/oauth2-proxy/oauth2-proxy/blob/master/contrib/oauth2-proxy.cfg.example) contents for settings not overridable via environment nor command line |
| config.cookieSecret | string | `"XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"` | server specific cookie for the secret; create a new one with `openssl rand -base64 32 | head -c 32 | base64` |
| config.existingConfig | string | `nil` | xisting Kubernetes configmap to use for the configuration file. See [config template](https://github.com/helm/charts/blob/master/stable/oauth2-proxy/templates/configmap.yaml) for the required values |
| config.google | object | `{}` |  |
| extraArgs | object | `{}` | key:value list of extra arguments to give the binary |
| extraEnv | list | `[]` | key:value list of extra environment variables to give the binary |
| extraVolumeMounts | list | `[]` | list of extra volumeMounts |
| extraVolumes | list | `[]` | list of extra volumes |
| htpasswdFile.enabled | bool | `false` | enable htpasswd-file option |
| htpasswdFile.entries | object | `{}` | list of [SHA encrypted user:passwords](https://oauth2-proxy.github.io/oauth2-proxy/configuration#command-line-options) |
| htpasswdFile.existingSecret | string | `""` | existing Kubernetes secret to use for OAuth2 htpasswd file |
| httpScheme | string | `"http"` | `http` or `https`. `name` used for port on the deployment. `httpGet` port `name` and `scheme` used for `liveness`- and `readinessProbes`. `name` and `targetPort` used for the service. |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.repository | string | `"quay.io/oauth2-proxy/oauth2-proxy"` | Image repository |
| image.tag | string | `"v7.1.3"` | Image tag |
| imagePullSecrets | list | `nil` | Optionally specify an array of imagePullSecrets. Secrets must be manually created in the namespace. ref: https://kubernetes.io/docs/concepts/containers/images/#specifying-imagepullsecrets-on-a-pod |
| ingress.annotations | object | `{}` | Ingress annotations |
| ingress.enabled | bool | `false` | Enable Ingress |
| ingress.extraPaths | list | `[]` | Ingress extra paths to prepend to every host configuration. Useful when configuring [custom actions with AWS ALB Ingress Controller](https://kubernetes-sigs.github.io/aws-alb-ingress-controller/guide/ingress/annotation/#actions). |
| ingress.hosts | list | `[]` | Ingress accepted hostnames |
| ingress.ingressClassName | string | `nil` | Set ingressClassName |
| ingress.path | string | `"/"` | Ingress accepted path |
| ingress.tls | list | `nil` | Ingress TLS configuration |
| initContainers | list | `[]` | Configure init containers for pod Ref: https://kubernetes.io/docs/concepts/workloads/pods/init-containers/ |
| livenessProbe | object | `{"enabled":true,"initialDelaySeconds":0,"timeoutSeconds":1}` | Configure Kubernetes liveness probes. Ref: https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-probes/ Disable both when deploying with Istio 1.0 mTLS. https://istio.io/help/faq/security/#k8s-health-checks |
| nodeSelector | object | `{}` | Node labels for pod assignment Ref: https://kubernetes.io/docs/user-guide/node-selection/ |
| podAnnotations | object | `{}` | annotations to add to each pod |
| podDisruptionBudget | object | `{"enabled":true,"minAvailable":1}` | PodDisruptionBudget settings Ref: https://kubernetes.io/docs/concepts/workloads/pods/disruptions/ |
| podLabels | object | `{}` | labels to add to each pod |
| podSecurityContext | object | `{}` |  |
| priorityClassName | string | `""` |  |
| proxyVarsAsSecrets | bool | `true` |  |
| readinessProbe | object | `{"enabled":true,"initialDelaySeconds":0,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":1}` | Configure Kubernetes readiness probes. |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{"enabled":false,"runAsNonRoot":true}` | Configure Kubernetes security context for container Ref: https://kubernetes.io/docs/tasks/configure-pod-container/security-context/ |
| service.annotations | object | `{}` | Service annotations for the GUI |
| service.loadBalancerIP | string | `nil` | Loadbalance IP for the GUI |
| service.loadBalancerSourceRanges | list | `nil` | List of IP CIDRs allowed access to load balancer (if supported) |
| service.port | int | `80` | Kubernetes port where the GUI is exposed |
| service.type | string | `"ClusterIP"` | Kubernetes service type for the GUI |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.enabled | bool | `true` |  |
| serviceAccount.name | string | `nil` |  |
| tolerations | list | `[]` | Tolerations for pod assignment Ref: https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/ |
| topologySpreadConstraints | object | `{"enabled":false,"maxSkew":1,"topologyKey":"topology.kubernetes.io/zone","whenUnsatisfiable":"DoNotSchedule"}` | Configure Pod Topology Spread Constraints See https://kubernetes.io/docs/concepts/workloads/pods/pod-topology-spread-constraints/ Requires Kubernetes >= v1.16 |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [1.0.0]

#### Changed

- This version upgrade oauth2-proxy to v4.0.0. Please see the [changelog](https://github.com/oauth2-proxy/oauth2-proxy/blob/v4.0.0/CHANGELOG.md#v400) in order to upgrade.

### [2.0.0]

#### Changed

- support for Kubernetes v1.16.x by way of addressing the deprecation of the Deployment object apiVersion `apps/v1beta2`.  See [the v1.16 API deprecations page](https://kubernetes.io/blog/2019/07/18/api-deprecations-in-1-16/) for more information.

Due to [this issue](https://github.com/helm/helm/issues/6583) there may be errors performing a `helm upgrade`of this chart from versions earlier than 2.0.0.

### [3.0.0]

#### Changed

- support for [EKS IAM roles for service accounts](https://docs.aws.amazon.com/eks/latest/userguide/iam-roles-for-service-accounts.html) by adding a managed service account to the chart.  This is a breaking change since the service account is enabled by default.  To disable this behaviour set `serviceAccount.enabled` to `false`

### [4.0.0]

#### Changed

- This is a breaking change as the chart was moved to k8s-at-home. No other change on top of the 3.x.x branch.

### [5.0.0]

#### Changed

- Not many breaking changes. See the [changelog](https://github.com/oauth2-proxy/oauth2-proxy/releases/tag/v7.0.0) for oauth2-proxy, specifically the section "Breaking Changes" for a few configuration changes, particularly to do with the Azure provider.

### [5.0.1]

#### Added

- N/A

#### Changed

- Use helm-docs

#### Removed

- N/A

### [5.0.4]

#### Added

- Added icon url.

#### Changed

- N/A

#### Removed

- N/A

### [5.0.5]

#### Fixed

- Update oauth2-proxy website URLs.

### [5.0.6]

#### Added

- N/A

#### Changed

- This version upgrade oauth2-proxy to 7.1.3. Please see the [changelog](https://github.com/oauth2-proxy/oauth2-proxy/blob/v7.1.3/CHANGELOG.md) in order to upgrade.

#### Removed

- N/A

[5.0.4]: #5.0.4
[5.0.1]: #5.0.1

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
