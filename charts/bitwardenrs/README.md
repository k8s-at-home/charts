# Unofficial Bitwarden compatible server written in Rust

This is an opinionated helm chart for [bitwarden_rs](https://github.com/dani-garcia/bitwarden_rs) 

The default values and container images used in this chart will allow for running in a multi-arch cluster (amd64, arm, arm64)

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm install k8s-at-home/bitwardenrs
```

## Installing the Chart

To install the chart with the release name `bitwarden`:

```console
helm install bitwarden k8s-at-home/bitwardenrs
```

## Uninstalling the Chart

To uninstall/delete the `bitwarden` deployment:

```console
helm uninstall bitwarden
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

Read through the [values.yaml](https://github.com/k8s-at-home/charts/blob/master/charts/bitwardenrs/values.yaml) file. It has several commented out suggested values.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
helm install bitwarden \
  --set timeZone="America/New York" \
    k8s-at-home/bitwardenrs
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
helm install bitwarden k8s-at-home/bitwardenrs  --values values.yaml 
```

## Upgrading an existing Release to a new major version

A major chart version change (like 1.1.1 -> 2.0.0) indicates that there is an incompatible breaking change potentially needing manual actions.

### Upgrading from 1.x.x to 2.x.x

Chart version 2.0.0 introduces external database support.
 * No actions required to continue with the default sqlite backend.
 * Refer to the `bitwardenrs.externalDatabase` section of [values.yaml](https://github.com/k8s-at-home/charts/blob/master/charts/bitwardenrs/values.yaml) to configure MySQL or PostgreSQL database backends.
