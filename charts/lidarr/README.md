# Lidarr | Looks and smells like Sonarr but made for music
Umbrella chart that
* Uses [media-common](https://github.com/k8s-at-home/charts/tree/master/charts/media-common) as a base
* Adds docker image information leveraging the [Linuxserver.io image](https://hub.docker.com/r/linuxserver/lidarr/)
* Deploys [Lidarr](https://github.com/lidarr/Lidarr)

## TL;DR
```console
$ helm repo add k8s-at-home https://k8s-at-home.com/charts/
$ helm install k8s-at-home/lidarr
```

## Installing the Chart
To install the chart with the release name `lidarr`:
```console
helm install lidarr k8s-at-home/lidarr
```

## Upgrading
Chart versions before 4.0.0 did not use media-common. Upgrading will require you to nest your values.yaml file under
a top-level `lidarr:` key.

Chart versions 1.0.1 and earlier used separate PVCs for Downloads and Music. This presented an issue where Lidarr would
be unable to hard-link files between the /downloads and /music directories when importing media. This is caused because
each PVC exposed to the pod as a separate filesystem. It resulted in Lidarr copying files rather than linking;
using additional storage without the user's knowledge.

This chart now uses a single PVC for Downloads and Music. This means all of your media (and downloads) must be in, or
be subdirectories of, a single directory. If upgrading from an earlier version of the chart, do the following:

1. [Uninstall](#uninstalling-the-chart) your current release
2. On your backing store, organize your media, ie. media/music, media/downloads
3. If using a pre-existing PVC, create a single new PVC for all of your media
4. Refer to the [configuration](#configuration) for updates to the chart values
5. Re-install the chart
6. Update your settings in the app to point to the new PVC, which is mounted at /media. This can be done using Lidarr's
`Mass Editor` under the `Library` tab. Simply select all artists in your library, and use the editor to change the
`Root Folder` and hit save.

## Uninstalling the Chart
To uninstall the `lidarr` deployment:
```console
helm uninstall lidarr
```
The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration
Read through the media-common [values.yaml](https://github.com/k8s-at-home/charts/blob/master/charts/media-common/values.yaml)
file. It has several commented out suggested values.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,
```console
helm install lidarr \
  --set lidarr.env.TZ="America/New York" \
    k8s-at-home/lidarr
```
Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the
chart. For example,
```console
helm install lidarr k8s-at-home/lidarr --values values.yaml 
```

These values will be nested as it is a dependency, for example
```yaml
lidarr:
  image:
    tag: ...
```

---
**NOTE**

If you get
```console
Error: rendered manifests contain a resource that already exists. Unable to continue with install: existing resource conflict: ...`
```
it may be because you uninstalled the chart with `skipuninstall` enabled, you need to manually delete the pvc or use`existingClaim`.

---
