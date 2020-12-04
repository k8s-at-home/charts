# Booksonic-air

This is a helm chart for [Booksonic-air](https://github.com/popeen/Booksonic-Air).
Booksonic-air is the successor to [Booksonic](https://github.com/popeen/Booksonic-Air#history).

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

This chart leverages the [linuxserver.io](https://hub.docker.com/r/linuxserver/booksonic-air) image. To specify a specific version, or to use a different image (not recommended),
see [configuration](#configuration)

## TL;DR;

```shell
$ helm repo add k8s-at-home https://k8s-at-home.com/charts/
$ helm install k8s-at-home/booksonic-air
```

## Storage

If you plan to use networked storage to store your media or config for Booksonic, (NFS, etc.) please take a look at the
Fast Access option in the Booksonic settings. This will help improve the perfomance of the application
by not constantly monitoring media folders. 

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install --name my-release k8s-at-home/booksonic-air
```

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
helm delete my-release --purge
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration
Read through the charts [values.yaml](https://github.com/k8s-at-home/charts/blob/master/charts/booksonic-air/values.yaml)
file. It has several commented out suggested values. Most notably, these include several environment variables used to
customize the container.
Additionally you can take a look at the common library [values.yaml](https://github.com/k8s-at-home/charts/blob/master/charts/common/values.yaml) for more (advanced) configuration options.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,
```console
helm install booksonic \
  --set env.TZ="America/New_York" \
    k8s-at-home/booksonic-air
```
Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the
chart. For example,
```console
helm install booksonic k8s-at-home/booksonic-air -f values.yaml 
```

```yaml
image:
  tag: ...
```

---
**NOTE**

If you get
```console
Error: rendered manifests contain a resource that already exists. Unable to continue with install: existing resource conflict: ...`
```
it may be because you uninstalled the chart with `skipuninstall` enabled, you need to manually delete the pvc or use `existingClaim`.

---

## Upgrading an existing Release to a new major version

A major chart version change (like 4.0.1 -> 5.0.0) indicates that there is an incompatible breaking change potentially needing manual actions.
