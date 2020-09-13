# Radarr | A fork of Sonarr to work with movies à la Couchpotato
Umbrella chart that
* Uses [media-common](https://github.com/k8s-at-home/charts/tree/master/charts/media-common) as a base
* Adds docker image information leveraging the [Linuxserver.io image](https://hub.docker.com/r/linuxserver/radarr/)
* Deploys [Radarr](https://github.com/Radarr/Radarr)

## TL;DR
```console
$ helm repo add k8s-at-home https://k8s-at-home.com/charts/
$ helm install k8s-at-home/radarr
```

## Installing the Chart
To install the chart with the release name `radarr`:
```console
helm install radarr k8s-at-home/radarr
```

## Upgrading
Chart versions before 6.0.0 did not use media-common. Upgrading will require you to nest your values.yaml file under
a top-level `radarr:` key.

Chart versions 3.2.0 and earlier used separate PVCs for Downloads and Movies. This presented an issue where Radarr would
be unable to hard-link files between the /downloads and /movies directories when importing media. This is caused because
each PVC exposed to the pod as a separate filesystem. It resulted in Radarr copying files rather than linking;
using additional storage without the user's knowledge.

This chart now uses a single PVC for Downloads and Movies. This means all of your media (and downloads) must be in, or
be subdirectories of, a single directory. If upgrading from an earlier version of the chart, do the following:

1. [Uninstall](#uninstalling-the-chart) your current release
2. On your backing store, organize your media, ie. media/movies, media/downloads
3. If using a pre-existing PVC, create a single new PVC for all of your media
4. Refer to the [configuration](#configuration) for updates to the chart values
5. Re-install the chart
6. Update your settings in the app to point to the new PVC, which is mounted at /media. This can be done using Radarr's
`Movie Editor` under the `Movies` tab. Simply select all artists in your library, and use the editor to change the
`Root Folder` and hit save.

## Uninstalling the Chart
To uninstall the `radarr` deployment:
```console
helm uninstall radarr
```
The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration
Read through the media-common [values.yaml](https://github.com/k8s-at-home/charts/blob/master/charts/media-common/values.yaml)
file. It has several commented out suggested values.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,
```console
helm install radarr \
  --set radarr.env.TZ="America/New York" \
    k8s-at-home/radarr
```
Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the
chart. For example,
```console
helm install radarr k8s-at-home/radarr --values values.yaml 
```

These values will be nested as it is a dependency, for example
```yaml
radarr:
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
