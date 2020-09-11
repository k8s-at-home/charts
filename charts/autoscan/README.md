# Autoscan | Autoscan replaces the default Plex and Emby behaviour for picking up file changes on the file system.
Umbrella chart that
* Uses [media-common](https://github.com/k8s-at-home/charts/tree/master/charts/media-common) as a base
* Adds docker image information leveraging the [Cloudb0x](https://hub.docker.com/r/cloudb0x/autoscan)
* Deploys [Autoscan](https://github.com/Cloudbox/autoscan)

## TL;DR
```console
$ helm repo add k8s-at-home https://k8s-at-home.com/charts/
$ helm install k8s-at-home/autoscan
```

## Installing the Chart
To install the chart with the release name `autoscan`:
```console
helm install ombi k8s-at-home/autoscan
```

## Uninstalling the Chart
To uninstall the `autoscan` deployment:
```console
helm uninstall autoscan
```
The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration
Read through the media-common [values.yaml](https://github.com/k8s-at-home/charts/blob/master/charts/media-common/values.yaml)
file. It has several commented out suggested values.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,
```console
helm install autoscan \
  --set autoscan.env.TZ="America/New York" \
    k8s-at-home/autoscan
```
Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.
For example,
```console
helm install ombi k8s-at-home/autoscan --values values.yaml
```

These values will be nested as it is a dependency, for example
```yaml
autoscan:
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
