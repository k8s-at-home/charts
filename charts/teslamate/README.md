# A self-hosted data logger for your Tesla 🚘

This is an opinionated helm chart for [Teslamate](https://github.com/adriankumpf/teslamate) installed with a standalone postgresql database.

The default values and container images used in this chart will allow for running in a multi-arch cluster (amd64, arm, arm64)

## TL;DR;

```shell
$ helm repo add k8s-at-home https://k8s-at-home.com/charts/
$ helm install k8s-at-home/teslamate
```

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install --name teslamate k8s-at-home/teslamate
```

## Uninstalling the Chart

To uninstall/delete the `teslamate` deployment:

```console
helm delete teslamate --purge
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

Read through the [values.yaml](https://github.com/k8s-at-home/charts/blob/master/charts/teslamate/values.yaml) file. It has several commented out suggested values.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
helm install --name teslamate \
  --set timeZone="America/New York" \
    k8s-at-home/teslamate
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
helm install --name teslamate -f values.yaml stable/teslamate
```
