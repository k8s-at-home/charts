# Recipes

This is a helm chart for [Recipes](https://github.com/vabene1111/recipes).

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## TL;DR;

```shell
$ helm repo add k8s-at-home https://k8s-at-home.com/charts/
$ helm install k8s-at-home/recipes
```

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install --name my-release k8s-at-home/recipes
```

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
helm delete my-release --purge
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the recipes chart and their default values that have to be overriden.

| Parameter                            | Description                                                                                 | Default                                     |
| -------------------------------------| ------------------------------------------------------------------------------------------- | ------------------------------------------- |
| `env.DEBUG`                          | Only set this to true when testing/debugging                                                | `0`                                         |
| `env.ALLOWED_HOSTS`                  | Hosts the application can run under e.g. recipes.mydomain.com,cooking.mydomain.com,...      | `*`                                         |
| `env.SECRET_KEY`                     | Random secret key, use for example `openssl rand -base64 24` to generate one                | `changeme`                                  |
| `env.TIMEZONE`                       | Your default timezone                                                                       | `America/New_York`                          |
| `env.DB_ENGINE`                      | Database connector                                                                          | `django.db.backends.postgresql_psycopg2`    |
| `env.POSTGRES_HOST`                  | External PostreSQL hostname                                                                 |                                             |
| `env.POSTGRES_PORT`                  | External PostreSQL port                                                                     |                                             |
| `env.POSTGRES_USER`                  | External PostreSQL user                                                                     |                                             |
| `env.POSTGRES_DB`                    | External PostreSQL database name                                                            |                                             |
| `env.POSTGRES_PASSWORD`              | External PostreSQL database password                                                        |                                             |
| `env.GUNICORN_MEDIA`                 | Serve mediafiles directly using gunicorn. Basically everyone recommends not doing this.     | `0`                                         |
| `env.FRACTION_PREF_DEFAULT`          | Enable/disable fraction support                                                             | `0`                                         |
| `env.COMMENT_PREF_DEFAULT`           | Enable/disable commenting system                                                            | `1`                                         |
| `env.SHOPPING_MIN_AUTOSYNC_INTERVAL` | Amount of time after which the shopping list is refreshed when they are in viewing mode     | `5`                                         |

You can add more environment variables, read through Recipes [.env.template](https://github.com/vabene1111/recipes/blob/master/.env.template)

Read through the charts [values.yaml](https://github.com/k8s-at-home/charts/blob/master/charts/recipes/values.yaml)
file.
Additionally you can take a look at the common library [values.yaml](https://github.com/k8s-at-home/charts/blob/master/charts/common/values.yaml) for more (advanced) configuration options.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,
```console
helm install recipes \
  --set env.POSTGRES_HOST="postgresql.domain" \
    k8s-at-home/recipes
```
Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the
chart. For example,
```console
helm install recipes k8s-at-home/recipes --values values.yaml
```

```yaml
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

## Upgrading an existing Release to a new major version

A major chart version change (like 1.0.1 -> 2.0.0) indicates that there is an incompatible breaking change potentially needing manual actions.
