# DNS proxy as ad-blocker for local network

This is an opinionated helm chart for [adguard-home](https://github.com/AdguardTeam/AdGuardHome)

The default values and container images used in this chart will allow for running in a multi-arch cluster (amd64, arm, arm64)

## TL;DR

```shell
helm repo add billimek https://billimek.com/billimek-charts/
helm install billimek/adguard-home
```

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install --name adguard-home billimek/adguard-home
```

## Uninstalling the Chart

To uninstall/delete the `adguard-home` deployment:

```console
helm delete adguard-home --purge
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

Read through the [values.yaml](https://github.com/billimek/billimek-charts/blob/master/charts/adguard-home/values.yaml) file. It has several commented out suggested values.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
helm install --name adguard-home \
  --set timeZone="America/New York" \
    billimek/adguard-home
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
helm install --name adguard-home -f values.yaml billimek/adguard-home
```

#### Helm force upgrade

```sh
helm upgrade --force
```

#### Delete the existing `adguard-home` services prior to upgrading

```sh
kubectl delete svc/adguard-home
```

#### Remove the existing adguard-home chart first

This is the 'easiest' approach, but will incur downtime which can be problematic if you rely on adguard-home for DNS
