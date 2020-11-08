# Sonarr

This is a helm chart for [Sonarr](https://github.com/Sonarr/Sonarr).

## TL;DR;

```shell
$ helm repo add k8s-at-home https://k8s-at-home.com/charts/
$ helm install k8s-at-home/sonarr
```

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install --name my-release k8s-at-home/sonarr
```

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
helm delete my-release --purge
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration
Read through the charts [values.yaml](https://github.com/k8s-at-home/charts/blob/master/charts/sonarr/values.yaml)
file. It has several commented out suggested values.
Additionally you can take a look at the common library [values.yaml](https://github.com/k8s-at-home/charts/blob/master/charts/common/values.yaml) for more (advanced) configuration options.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,
```console
helm install sonarr \
  --set sonarr.env.TZ="America/New York" \
    k8s-at-home/sonarr
```
Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the
chart. For example,
```console
helm install sonarr k8s-at-home/sonarr --values values.yaml 
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

### Upgrading from 6.x.x to 7.x.x

Due to migrating to a centralized common library some values in `values.yaml` have changed.

Examples:

* `service.port` has been moved to `service.port.port`.
* `persistence.type` has been moved to `controllerType`.

Refer to the library values.yaml for more configuration options.

### Upgrading from 5.x.x to 6.x.x

Chart versions before 6.0.0 did not use media-common. Upgrading will require you to nest your values.yaml file under
a top-level `sonarr:` key.

Chart versions 3.2.0 and earlier used separate PVCs for Downloads and TV. This presented an issue where Sonarr would
be unable to hard-link files between the /downloads and /tv directories when importing media. This is caused because
each PVC exposed to the pod as a separate filesystem. It resulted in Sonarr copying files rather than linking; using
additional storage without the user's knowledge.

This chart now uses a single PVC for Downloads and TV. This means all of your media (and downloads) must be in, or
be subdirectories of, a single directory. If upgrading from an earlier version of the chart, do the following:

1. [Uninstall](#uninstalling-the-chart) your current release
2. On your backing store, organize your media, ie. media/tv, media/downloads
3. If using a pre-existing PVC, create a single new PVC for all of your media
4. Refer to the [configuration](#configuration) for updates to the chart values
5. Re-install the chart
6. Update your settings in the app to point to the new PVC, which is mounted at /media. This can be done using Sonarr's
`Series Editor` under the `Series` tab. Simply select all series in your library, and use the editor to change the
`Root Folder` and hit save.
