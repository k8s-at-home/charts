# Protonmail-bridge

This is a helm chart for [Protonmail-bridge](https://github.com/shenxn/protonmail-bridge-docker).

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## TL;DR;

```shell
$ helm repo add k8s-at-home https://k8s-at-home.com/charts/
$ helm install k8s-at-home/protonmail-bridge
```

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install --name my-release k8s-at-home/protonmail-bridge
```

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
helm delete my-release --purge
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration
Read through the charts [values.yaml](https://github.com/k8s-at-home/charts/blob/master/charts/protonmail-bridge/values.yaml)
file. It has several commented out suggested values.
Additionally you can take a look at the common library [values.yaml](https://github.com/k8s-at-home/charts/blob/master/charts/common/values.yaml) for more (advanced) configuration options.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,
```console
helm install protonmail-bridge \
  --set env.TZ="America/New_York" \
    k8s-at-home/protonmail-bridge
```
Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the
chart. For example,
```console
helm install protonmail-bridge k8s-at-home/protonmail-bridge --values values.yaml 
```

```yaml
image:
  tag: ...
```

Get the name of your deployed pod kubectl get pods
Run interactively on the pod (setup only) kubectl exec --stdin --tty protonmail-bridge-deployment-6c79fd7f84-ftwcw -- /bin/bash
Once logged in, execute the init command bash /protonmail/entrypoint.sh init
You should now see the CLI for protonmail-bridge, authenticate with login
(optional) if you're like me and use split address mode, change mode and info are good for printing the details.
Copy your SMTP server info (or IMAP, your choice)
delete the active pod so a new one gets created (which will properly fire up with your persisted settings)

---
**NOTE**

If you get
```console
Error: rendered manifests contain a resource that already exists. Unable to continue with install: existing resource conflict: ...`
```
it may be because you uninstalled the chart with `skipuninstall` enabled, you need to manually delete the pvc or use `existingClaim`.

---

## Upgrading an existing Release to a new major version

A major chart version change (like 4.0.1 -> 5.0.0) indicates that there is an incompatible breaking change potentially needing manual actions.

### Upgrading from 3.x.x to 4.x.x

Due to migrating to a centralized common library some values in `values.yaml` have changed.

Examples:

* `service.port` has been moved to `service.port.port`.
* `persistence.type` has been moved to `controllerType`.

Refer to the library values.yaml for more configuration options.
