# DnsMadeEasy webhook for cert-manager

This is a helm chart adding a webhook to the [Certificate Manager](https://cert-manager.io/) for [DnsMadeEasy](https://dnsmadeeasy.com/). You have to install the original chart or this one will not work.

The code implementing the webhook is [here](https://github.com/angelnu/cert-manager-webhook-dnsmadeeasy).

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/angelnu/charts/issues/new/choose)**

## TL;DR;

```shell
$ helm repo add k8s-at-home https://angelnu.com/charts/
$ helm install k8s-at-home/cert-manager-dnsmadeeasy
```

## :star2: Changelog

Please refer to [CHANGELOG.md](CHANGELOG.md) for an overview of notable changes to the chart. **This is especially important for major version updates!**

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install --name my-release angelnu/cert-manager-dnsmadeeasy
```

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
helm delete my-release --purge
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

Read through the charts [values.yaml](https://github.com/k8s-at-home/charts/blob/master/charts/cert-manager-dnsmadeeasy/values.yaml)
file. It has several commented out suggested values.

## Upgrading an existing Release to a new major version

A major chart version change (like 1.0.1 -> 2.0.0) indicates that there is an incompatible breaking change potentially needing manual actions.