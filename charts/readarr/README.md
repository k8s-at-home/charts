# Readarr

This is a helm chart for [Readarr](https://github.com/Readarr/Readarr).

**Readarr is still in early development, and this chart will install a nightly build of Readarr.
[See the project readme for more information](https://github.com/Readarr/Readarr#readarr-is-in-early-stages-of-development-alphabeta-binary-builds-are-not-yet-available-use-of-any-test-builds-isnt-recommend-and-may-have-detrimental-effects-on-your-library). Take back-up's if you decide to use this on an existing library as the project is considered unstable**

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## TL;DR;

```shell
$ helm repo add k8s-at-home https://k8s-at-home.com/charts/
$ helm install k8s-at-home/readarr
```

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install --name my-release k8s-at-home/readarr
```

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
helm delete my-release --purge
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration
Read through the charts [values.yaml](https://github.com/k8s-at-home/charts/blob/master/charts/readarr/values.yaml)
file. It has several commented out suggested values.
Additionally you can take a look at the common library [values.yaml](https://github.com/k8s-at-home/charts/blob/master/charts/common/values.yaml) for more (advanced) configuration options.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,
```console
helm install readarr \
  --set env.TZ="America/New_York" \
    k8s-at-home/readarr
```
Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the
chart. For example,
```console
helm install readarr k8s-at-home/readarr --values values.yaml
```

```yaml
image:
  tag: ...
```
