# deemix

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![AppVersion: 2022.5.28-r206.a752a63e0e](https://img.shields.io/badge/AppVersion-2022.5.28--r206.a752a63e0e-informational?style=flat-square)

Deemix is a Deezer Download Manager

**Homepage:** <https://github.com/k8s-at-home/charts/tree/master/charts/stable/deemix>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| preisschild | <florian@florianstroeger.com> |  |

## Source Code

* <https://gitlab.com/Bockiii/deemix-docker>
* <https://gitlab.com/RemixDev/deemix-gui>

## Requirements

Kubernetes: `>=1.16.0-0`

| Repository | Name | Version |
|------------|------|---------|
| https://library-charts.k8s-at-home.com | common | 4.4.2 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env | object | See below | environment variables. See more environment variables in the [deemix-docker documentation](https://gitlab.com/Bockiii/deemix-docker). |
| env.PGID | string | `"1000"` | Group ID, see PUID |
| env.PUID | string | `"1000"` | User ID of the user you want the container to run as in order to fix folder permission issues |
| env.TZ | string | `"UTC"` | Set the container timezone |
| env.UMASK_SET | string | `"022"` | Default umask for downloaded files |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"registry.gitlab.com/bockiii/deemix-docker"` | image repository |
| image.tag | string | chart.appVersion | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| service | object | See values.yaml | Configures service settings for the chart. |
