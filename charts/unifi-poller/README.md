# unifi-poller

This is an opinionated helm chart for [unifi-poller](https://github.com/unifi-poller/unifi-poller)

Collect ALL UniFi Controller, Site, Device & Client Data - Export to InfluxDB or Prometheus

The default values and container images used in this chart will allow for running in a multi-arch cluster (amd64, arm, arm64)

## TL;DR;

```shell
$ helm repo add billimek https://billimek.com/billimek-charts/
$ helm install billimek/unifi-poller
```

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install --name unifi-poller billimek/unifi-poller
```

## Uninstalling the Chart

To uninstall/delete the `unifi-poller` deployment:

```console
helm delete unifi-poller --purge
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

Read through the [values.yaml](https://github.com/billimek/billimek-charts/blob/master/charts/unifi-poller/values.yaml) file. It has several commented out suggested values.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
helm install --name unifi-poller \
    billimek/unifi-poller
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
helm install --name unifi-poller -f values.yaml stable/unifi-poller
```
