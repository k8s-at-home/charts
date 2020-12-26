# Neolink

This is a helm chart for [Neolink](https://github.com/thirtythreeforty/neolink).

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## TL;DR;

```shell
$ helm repo add k8s-at-home https://k8s-at-home.com/charts/
$ helm install k8s-at-home/neolink
```

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install my-release k8s-at-home/neolink
```

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
helm delete my-release --purge
```
The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration
The chart's [values.yaml](https://github.com/k8s-at-home/charts/blob/master/charts/neolink/values.yaml) file contains a set of suggested values for a minimal deployment. Further configuration options are found in the [common library](https://github.com/k8s-at-home/charts/blob/master/charts/common/values.yaml).

The configuration for the application itself is set as a configmap and mounted in the container as /etc/neolink.toml. Refer to the sample config [here.](https://github.com/thirtythreeforty/neolink/blob/master/sample_config.toml)


Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,
```console
helm install neolink \
  --set env.TZ="America/New_York" \
    k8s-at-home/neolink
```
Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,
```console
helm install neolink k8s-at-home/neolink --values values.yaml
```