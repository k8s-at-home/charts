# Home Assistant

This is a helm chart extending the [Zalando Postgres operator](https://github.com/zalando/postgres-operator). You have to install the original chart or this one will not work.

It creates local persistent volumes to store the data in 2 or more cluster nodes. The volumes use fix names so the database survives even a full cluster reinstall.

It also adds a cronjob to periodically create sql backups of the database to a Persistent Volume Claim.

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/angelnu/charts/issues/new/choose)**

## TL;DR;

```shell
$ helm repo add k8s-at-home https://angelnu.com/charts/
$ helm install k8s-at-home/postgres-operator
```

## :star2: Changelog

Please refer to [CHANGELOG.md](CHANGELOG.md) for an overview of notable changes to the chart. **This is especially important for major version updates!**

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install --name my-release angelnu/postgres-cluster
```

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
helm delete my-release --purge
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

Read through the charts [values.yaml](https://github.com/k8s-at-home/charts/blob/master/charts/postgres-cluster/values.yaml)
file. It has several commented out suggested values.

## Upgrading an existing Release to a new major version

A major chart version change (like 1.0.1 -> 2.0.0) indicates that there is an incompatible breaking change potentially needing manual actions.