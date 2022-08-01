# gotify

![Version: 1.2.0](https://img.shields.io/badge/Version-1.2.0-informational?style=flat-square) ![AppVersion: 2.1.4](https://img.shields.io/badge/AppVersion-2.1.4-informational?style=flat-square)

A simple server for sending and receiving messages

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/gotify/server>

## Requirements

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://library-charts.k8s-at-home.com | common | 4.5.0 |

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install gotify k8s-at-home/gotify
```

## Installing the Chart

To install the chart with the release name `gotify`

```console
helm install gotify k8s-at-home/gotify
```

## Uninstalling the Chart

To uninstall the `gotify` deployment

```console
helm uninstall gotify
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install gotify \
  --set env.TZ="America/New York" \
    k8s-at-home/gotify
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install gotify k8s-at-home/gotify -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env | object | See below | environment variables. |
| env.GOTIFY_DATABASE_CONNECTION | string | `"data/gotify.db"` | Database connection string (se: https://gotify.net/docs/config#database) |
| env.GOTIFY_DATABASE_DIALECT | string | `"sqlite3"` | Database type (se https://gotify.net/docs/config#database) |
| env.GOTIFY_DEFAULTUSER_NAME | string | `"admin"` | Default user created on database creation |
| env.GOTIFY_DEFAULTUSER_PASS | string | `"admin"` | Password set for default user on database creation |
| env.GOTIFY_PASSSTRENGTH | int | `10` | The bcrypt password strength (higher = better but also slower) |
| env.GOTIFY_PLUGINSDIR | string | `"data/plugins"` | The directory where plugin resides (leave empty to disable plugins) |
| env.GOTIFY_REGISTRATION | bool | `false` | Enable user registration |
| env.GOTIFY_SERVER_KEEPALIVEPERIODSECONDS | int | `0` | Server keep alive period |
| env.GOTIFY_SERVER_LISTENADDR | string | `nil` | Address server is listening on |
| env.GOTIFY_SERVER_PORT | int | `80` | Set the port gotify container is listening on |
| env.GOTIFY_SERVER_SSL_CERTFILE | string | `nil` | SSL Certificate file |
| env.GOTIFY_SERVER_SSL_CERTKEY | string | `nil` | SSL certificate key file |
| env.GOTIFY_SERVER_SSL_ENABLED | bool | `false` | SSL Enabled |
| env.GOTIFY_SERVER_SSL_LETSENCRYPT_ACCEPTTOS | bool | `false` | Accept the tos from letsencrypt |
| env.GOTIFY_SERVER_SSL_LETSENCRYPT_CACHE | string | `"certs"` | Directory to use as letsencrypt cache |
| env.GOTIFY_SERVER_SSL_LETSENCRYPT_ENABLED | bool | `false` | Enable letsencrypt integration |
| env.GOTIFY_SERVER_SSL_LISTENADDR | string | `nil` | Server ssl listening address |
| env.GOTIFY_SERVER_SSL_PORT | int | `443` | SSL Server port |
| env.GOTIFY_SERVER_SSL_REDIRECTTOHTTPS | bool | `true` | Redirect http to https |
| env.GOTIFY_SERVER_STREAM_PINGPERIODSECONDS | int | `45` | The hosts for which letsencrypt should request certificates GOTIFY_SERVER_SSL_LETSENCRYPT_HOSTS: - mydomain.tld\n- myotherdomain.tld -- Response headers are added to every response (default: none) GOTIFY_SERVER_RESPONSEHEADERS: "X-Custom-Header: \"custom value\"" --  Sets cors headers GOTIFY_SERVER_CORS_ALLOWORIGINS: "- \".+.example.com\"\n- \"otherdomain.com\"" GOTIFY_SERVER_CORS_ALLOWMETHODS: "- \"GET\"\n- \"POST\"" GOTIFY_SERVER_CORS_ALLOWHEADERS: "- \"Authorization\"\n- \"content-type\"" GOTIFY_SERVER_STREAM_ALLOWEDORIGINS: "- \".+.example.com\"\n- \"otherdomain.com\"" -- The interval in which websocket pings will be sent |
| env.GOTIFY_UPLOADEDIMAGESDIR | string | `"data/images"` | The directory for storing uploaded images |
| env.TZ | string | `"UTC"` | Set the container timezone |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"gotify/server"` | image repository |
| image.tag | string | chart.appVersion | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| persistence.data.enabled | bool | `false` |  |
| persistence.data.mountPath | string | `"/app/data"` |  |
| service | object | See values.yaml | Configures service settings for the chart. |

## Changelog

### Version 1.2.0

#### Added

N/A

#### Changed

* Upgraded `common` chart dependency to version 4.5.0

#### Fixed

N/A

### Older versions

A historical overview of changes can be found on [ArtifactHUB](https://artifacthub.io/packages/helm/k8s-at-home/gotify?modal=changelog)

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v0.1.1](https://github.com/k8s-at-home/helm-docs/releases/v0.1.1)
