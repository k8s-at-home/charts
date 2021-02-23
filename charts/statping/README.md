# statping | Status page for monitoring your websites and applications

## TL;DR
```console
$ helm repo add k8s-at-home https://k8s-at-home.com/charts/
$ helm install k8s-at-home/statping
```

## Installing the Chart
To install the chart with the release name `statping`:
```console
helm install statping k8s-at-home/statping
```

## Uninstalling the Chart
To uninstall the `statping` deployment:
```console
helm uninstall statping
```
The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration
Read through the [values.yaml](https://github.com/k8s-at-home/charts/blob/master/charts/statping/values.yaml)
file. It has several commented out suggested values.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,
```console
helm install statping \
  --set statping.env.TZ="America/New York" \
    k8s-at-home/statping
```
Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the
chart. For example,
```console
helm install statping k8s-at-home/statping --values values.yaml
```
