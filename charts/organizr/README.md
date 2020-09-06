# Organizr | HTPC/Homelab Services Organizer - Written in PHP
Umbrella chart that
* Uses [media-common](https://github.com/k8s-at-home/charts/tree/master/charts/media-common) as a base
* Adds docker image information leveraging the [official image](https://hub.docker.com/r/organizr/organizr/)
* Deploys [Organizr](https://github.com/causefx/Organizr)

## TL;DR
```console
$ helm repo add k8s-at-home https://k8s-at-home.com/charts/
$ helm install k8s-at-home/organizr
```

## Installing the Chart
To install the chart with the release name `organizr`:
```console
helm install organizr k8s-at-home/organizr
```

## Uninstalling the Chart
To uninstall the `organizr` deployment:
```console
helm uninstall organizr
```
The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration
Read through the media-common [values.yaml](https://github.com/k8s-at-home/charts/blob/master/charts/media-common/values.yaml) file. It has several commented out suggested values.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,
```console
helm install organizr \
  --set organizr.env.TZ="America/New York" \
    k8s-at-home/organizr
```
Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,
```console
helm install organizr k8s-at-home/organizr --values values.yaml 
```

These values will be nested as it is a dependency, for example
```yaml
organizr:
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
