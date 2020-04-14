# DNS proxy as ad-blocker for local network

This is an opinionated helm chart for [blocky](https://github.com/0xERR0R/blocky) 

The default values and container images used in this chart will allow for running in a multi-arch cluster (amd64, arm, arm64)

## TL;DR

```shell
helm repo add billimek https://billimek.com/billimek-charts/
helm install billimek/blocky
```

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install --name blocky billimek/blocky
```

## Uninstalling the Chart

To uninstall/delete the `blocky` deployment:

```console
helm delete blocky --purge
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

Read through the [values.yaml](https://github.com/billimek/billimek-charts/blob/master/charts/blocky/values.yaml) file. It has several commented out suggested values.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
helm install --name blocky \
  --set timeZone="America/New York" \
    billimek/blocky
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
helm install --name blocky -f values.yaml billimek/blocky
```

## Upgrading an existing Release to a new major version

A major chart version change (like 2.2.2 -> 3.0.0) indicates that there is an
incompatible breaking change needing manual actions.

### Upgrading from 2.x.x to 3.x.x

Due to the renaming of the service port, an upgrade-in-place will not work.  The following are possible approaches to solve this:

#### Helm force upgrade

```sh
helm upgrade --force
```

#### Delete the existing `blocky` service prior to upgrading

```sh
kubectl delete svc/blocky
```

#### Remove the existing blocky chart first

This is the 'easiest' approach, but will incur downtime which can be problematic if you rely on blocky for DNS

