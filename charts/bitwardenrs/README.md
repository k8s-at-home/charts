# Unofficial Bitwarden compatible server written in Rust

This is an opinionated helm chart for [bitwarden_rs](https://github.com/dani-garcia/bitwarden_rs) 

The default values and container images used in this chart will allow for running in a multi-arch cluster (amd64, arm, arm64)

## TL;DR

```console
helm repo add billimek https://billimek.com/billimek-charts/
helm install billimek/bitwardenrs
```

## Installing the Chart

To install the chart with the release name `bitwarden`:

```console
helm install bitwarden billimek/bitwardenrs
```

## Uninstalling the Chart

To uninstall/delete the `bitwarden` deployment:

```console
helm uninstall bitwarden
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

Read through the [values.yaml](https://github.com/billimek/billimek-charts/blob/master/charts/bitwardenrs/values.yaml) file. It has several commented out suggested values.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
helm install bitwarden \
  --set timeZone="America/New York" \
    billimek/bitwardenrs
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
helm install bitwarden billimek/bitwardenrs  --values values.yaml 
```
