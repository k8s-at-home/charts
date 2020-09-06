# Ombi | Want a Movie or TV Show on Plex or Emby? Use Ombi!
Umbrella chart that
* Uses [media-common](https://github.com/k8s-at-home/charts/tree/master/charts/media-common) as a base
* Adds docker image information leveraging the [Linuxserver.io image](https://hub.docker.com/r/linuxserver/ombi/)
* Deploys [Ombi](https://github.com/tidusjar/Ombi)

## TL;DR
```console
$ helm repo add k8s-at-home https://k8s-at-home.com/charts/
$ helm install k8s-at-home/ombi
```

## Installing the Chart
To install the chart with the release name `ombi`:
```console
helm install ombi k8s-at-home/ombi
```

## Upgrading
Chart versions before 4.0.0 did not use media-common. Upgrading will require you to nest your values.yaml file under
a top-level `ombi:` key.

Chart versions 1.0.1 and earlier used separate PVCs for Downloads and Music. This presented an issue where Ombi would be unable to hard-link files between the /downloads and /music directories when importing media. This is caused because each PVC is exposed to the pod as a separate filesystem. This resulted in Ombi copying files rather than linking; using additional storage without the user's knowledge.

This chart now uses a single PVC for Downloads and Music. This means all of your media (and downloads) must be in, or be subdirectories of, a single directory. If upgrading from an earlier version of the chart, do the following:

1. [Uninstall](#uninstalling-the-chart) your current release
2. On your backing store, organize your media, ie. media/music, media/downloads
3. If using a pre-existing PVC, create a single new PVC for all of your media
4. Refer to the [configuration](#configuration) for updates to the chart values
5. Re-install the chart
6. Update your settings in the app to point to the new PVC, which is mounted at /media. This can be done using Ombi's `Mass Editor` under the `Library` tab. Simply select all artists in your library, and use the editor to change the `Root Folder` and hit save.

## Uninstalling the Chart
To uninstall the `ombi` deployment:
```console
helm uninstall ombi
```
The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration
Read through the media-common [values.yaml](https://github.com/k8s-at-home/charts/blob/master/charts/media-common/values.yaml) file. It has several commented out suggested values.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,
```console
helm install ombi \
  --set ombi.env.TZ="America/New York" \
    k8s-at-home/ombi
```
Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,
```console
helm install ombi k8s-at-home/ombi --values values.yaml 
```

These values will be nested as it is a dependency, for example
```yaml
ombi:
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
