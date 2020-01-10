# Dynamic DNS using DigitalOcean's DNS Services

A script that pushes the public IP address of the running machine to DigitalOcean's DNS API's. It requires an existing A record to update. The resulting container image is roughly around 7 MB (thanks to Alpine Linux).

## TL;DR;

```console
$ helm repo add billimek https://billimek.com/billimek-charts/
$ helm install billimek/digitalocean-dyndns
```

## Introduction

This code is adopted from [this original repo](https://github.com/tunix/digitalocean-dyndns)

## Installing the Chart

To install the chart with the release name `my-release`:

```console
$ helm install --name my-release billimek/digitalocean-dyndns
```
## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
$ helm delete my-release --purge
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following tables lists the configurable parameters of the Sentry chart and their default values.

| Parameter                            | Description                                  | Default                                                    |
| -------------------------------      | -------------------------------              | ---------------------------------------------------------- |
| `image.repository`                   | digitalocean-dyndns image                            | `tunix/digitalocean-dyndns`                        |
| `image.tag`                          | digitalocean-dyndns image tag                        | `latest`                                           |
| `image.pullPolicy`                   | digitalocean-dyndns image pull policy                | `Always`                                           |
| `digitialocean.token`                | The token you generate in DigitalOcean's API settings. | ``                                               |
| `digitialocean.domain`               | The domain your subdomain is registered at. (i.e. foo.com for home.foo.com) | ``                          |
| `digitialocean.name`                 | Subdomain to use. (name in A record) (i.e. home for home.foo.com or @ for no subdomain) | `@`             |
| `digitialocean.sleep_interval`       |  Polling time in seconds                             | `300`                                              |


Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
helm install --name my-release \
  --set config.digitalocean.token=thisismyapikey \
    billimek/digitalocean-dyndns
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
helm install --name my-release -f values.yaml billimek/digitalocean-dyndns
```

Read through the [values.yaml](https://github.com/billimek/billimek-charts/blob/master/charts/digitalocean-dyndns/values.yaml) file. It has several commented out suggested values.
