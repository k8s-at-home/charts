# Sonarr | Smart PVR for newsgroup and bittorrent users
Umbrella chart that
* Uses [media-common](https://github.com/k8s-at-home/charts/tree/master/charts/media-common) as a base
* Adds docker image information leveraging the [Linuxserver.io image](https://hub.docker.com/r/linuxserver/sonarr/)
* Deploys [Sonarr](https://github.com/sonarr/Sonarr)

## TL;DR
```console
$ helm repo add k8s-at-home https://k8s-at-home.com/charts/
$ helm install k8s-at-home/sonarr
```

## Installing the Chart
To install the chart with the release name `sonarr`:
```console
helm install sonarr k8s-at-home/sonarr
```

## Upgrading
Chart versions before 6.0.0 did not use media-common. Upgrading will require you to nest your values.yaml file under
a top-level `sonarr:` key.

Chart versions 3.2.0 and earlier used separate PVCs for Downloads and Music. This presented an issue where Sonarr would be unable to hard-link files between the /downloads and /music directories when importing media. This is caused because each PVC is exposed to the pod as a separate filesystem. This resulted in Sonarr copying files rather than linking; using additional storage without the user's knowledge.

This chart now uses a single PVC for Downloads and Music. This means all of your media (and downloads) must be in, or be subdirectories of, a single directory. If upgrading from an earlier version of the chart, do the following:

1. [Uninstall](#uninstalling-the-chart) your current release
2. On your backing store, organize your media, ie. media/tv, media/downloads
3. If using a pre-existing PVC, create a single new PVC for all of your media
4. Refer to the [configuration](#configuration) for updates to the chart values
5. Re-install the chart
6. Update your settings in the app to point to the new PVC, which is mounted at /media. This can be done using Sonarr's `Series Editor` under the `Series` tab. Simply select all series in your library, and use the editor to change the `Root Folder` and hit save.

## Uninstalling the Chart
To uninstall the `sonarr` deployment:
```console
helm uninstall sonarr
```
The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration
Read through the media-common [values.yaml](https://github.com/k8s-at-home/charts/blob/master/charts/media-common/values.yaml) file. It has several commented out suggested values.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,
```console
helm install sonarr \
  --set sonarr.env.TZ="America/New York" \
    k8s-at-home/sonarr
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,
```console
helm install sonarr k8s-at-home/sonarr --values values.yaml 
```
These values will be nested as it is a dependency, for example
```yaml
sonarr:
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
