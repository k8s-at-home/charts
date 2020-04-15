# Plex Media Server helm chart

This is an opinionated helm chart for Plex Media Center based on the [official container image](https://hub.docker.com/r/plexinc/pms-docker/).

This chart is 'forked' from the excellent [munnerz/kube-plex](https://github.com/munnerz/kube-plex) repo in order to allow for more timely updates and publishing to a helm registry.  **NOTE:** This chart is not compatible as an upgrade from the `kube-plex` chart.

## TL;DR

```shell
helm repo add billimek https://billimek.com/billimek-charts/
helm install billimek/plex
```

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install plex billimek/plex
```

## Uninstalling the Chart

To uninstall/delete the `plex` deployment:

```console
helm delete plex
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

Read through the [values.yaml](https://github.com/billimek/billimek-charts/blob/master/charts/plex/values.yaml) file. It has several commented out suggested values.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
helm install plex \
  --set timezone="America/New York" \
    billimek/plex
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
helm install plex -f values.yaml billimek/plex
```
