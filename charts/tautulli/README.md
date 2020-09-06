# Tautulli | A Python based monitoring and tracking tool for Plex Media Server
Umbrella chart that
* Uses [media-common](https://github.com/k8s-at-home/charts/tree/master/charts/media-common) as a base
* Adds docker image information leveraging the [official image](https://hub.docker.com/r/tautulli/tautulli/)
* Deploys [Tautulli](https://github.com/Tautulli/Tautulli)

## TL;DR
```console
$ helm repo add k8s-at-home https://k8s-at-home.com/charts/
$ helm install k8s-at-home/tautulli
```

## Installing the Chart
To install the chart with the release name `tautulli`:
```console
helm install tautulli k8s-at-home/tautulli
```

## Upgrading
Chart versions before 4.0.0 did not use media-common. Upgrading will require you to nest your values.yaml file under
a top-level `tautulli:` key.

## Uninstalling the Chart
To uninstall the `tautulli` deployment:
```console
helm uninstall tautulli
```
The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration
Read through the media-common [values.yaml](https://github.com/k8s-at-home/charts/blob/master/charts/media-common/values.yaml)
file. It has several commented out suggested values.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,
```console
helm install tautulli \
  --set tautulli.env.TZ="America/New York" \
    k8s-at-home/tautulli
```
Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.
For example,
```console
helm install tautulli k8s-at-home/tautulli --values values.yaml 
```

These values will be nested as it is a dependency, for example
```yaml
tautulli:
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
