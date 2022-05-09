# zalando-postgres-cluster

![Version: 3.3.2](https://img.shields.io/badge/Version-3.3.2-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

Creates a postgres cluster using the Zalando Postgres operator and local storage

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/zalando/postgres-operator>

## Requirements

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://library-charts.k8s-at-home.com | common | 4.4.2 |

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install zalando-postgres-cluster k8s-at-home/zalando-postgres-cluster
```

## Installing the Chart

To install the chart with the release name `zalando-postgres-cluster`

```console
helm install zalando-postgres-cluster k8s-at-home/zalando-postgres-cluster
```

## Uninstalling the Chart

To uninstall the `zalando-postgres-cluster` deployment

```console
helm uninstall zalando-postgres-cluster
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install zalando-postgres-cluster \
  --set env.TZ="America/New York" \
    k8s-at-home/zalando-postgres-cluster
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install zalando-postgres-cluster k8s-at-home/zalando-postgres-cluster -f values.yaml
```

## Custom configuration

This chart is a wrapper for the [Zalando postgres operator](https://github.com/zalando/postgres-operator) to create
a high available Postgres cluster using nodes local storage.

**IMPORTANT:** You have to install the [Zalando postgres operator](https://github.com/zalando/postgres-operator) before you you
install this chart. This chart does not do it as you typically will deploy multiple instances of it (on per postgres cluster)
while the operator is installed only once.

Features added by this wrapper:
- creates an storage class using local storage in the nodes specified in `persistentVolumes.replicaNodes`. These replicas survive
  a tear-down and tear-up of the cluster.
- (optional) does sql dumps to an existing PVC with K8S cronjobs. The Operator only supports backups to cloud, not NFS PVC for example.
- Define the password for the DB so that it can be used accross tear-down and tear-up of the cluster.

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| dumpBackup.enabled | bool | `false` | Enable backups to a PVC |
| dumpBackup.existingClaim | string | `nil` | existing claim |
| dumpBackup.image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| dumpBackup.image.repository | string | `"postgres"` | image used for the backups |
| dumpBackup.image.tag | string | `"latest"` | image pull tag |
| dumpBackup.resources.requests.cpu | string | `"5m"` | requested cpu for backup |
| dumpBackup.resources.requests.memory | string | `"10Mi"` | requested memory for backup |
| dumpBackup.schedule | string | `"@daily"` | Backup schedule for postgres dumps |
| dumpBackup.subpath | string | `nil` | Persistent volume claim subpath for the backups @default: <subpathPrefix/<release-name> |
| dumpBackup.subpathPrefix | string | `"backup/db"` | Persistent volume claim subpath prefix for the backups |
| dumpBackup.type | string | `nil` | Sets the persistence type. Valid options are pvc, emptyDir, hostPath or custom. See [common chart persistence doc](https://github.com/k8s-at-home/library-charts/blob/main/charts/stable/common/values.yaml) |
| persistentVolumes.accessModes[0] | string | `"ReadWriteOnce"` |  |
| persistentVolumes.annotations | object | `{}` |  |
| persistentVolumes.hostPath | string | `nil` | Local path for the persistent volumes @default: <hostPathPrefix/<release-name> |
| persistentVolumes.hostPathPrefix | string | `"/run/db"` | Local prefix for persistent volumes NOTE: The default is in tempfs - you should change to a persistent place for production!!! |
| persistentVolumes.labels | object | `{}` |  |
| persistentVolumes.reclaimPolicy | string | `"Retain"` | persistentVolumeReclaimPolicy for the persistent volumes Recicle will delete content once DB is deleted while Retain (default) will keep it. |
| persistentVolumes.replicaNodes | list | `["node1.example.com","node2.example.com"]` | Replica nodes Must set with at least 2 nodes for the cluster to be highly available |
| postgresql.databases | object | `{"postgres":"postgres"}` | databases to create and their user |
| postgresql.numberOfInstances | string | `nil` | Number of replicas It will be automatically set with the number of replicaNodes so any values set here are ignored. |
| postgresql.postgresql.version | string | `"13"` | Postgres version to deploy - see which versions are supported by the operator |
| postgresql.teamId | string | `nil` | team Id for the DB cluster |
| postgresql.users | object | `{"postgres":["superuser","createdb"]}` | DB users to create (see operator) |
| postgresql.volume.size | string | `"1Gi"` | Size of the persistance volume to allocate |
| postgresql.volume.storageClass | string | chart fullname | Name of the storage class |
| superuser.password | string | randomly generated on first install of the chart | Superuser password |
| superuser.secret | string | <user>.<db name>.credentials.postgresql.acid.zalan.do | Superuser k8s secret name. It must match the patter used by the operator |
| superuser.user | string | first user in postgresql.users | Superuser user used for cronjobs |

## Changelog

### Version 3.3.2

#### Added

N/A

#### Changed

* Upgraded `common` chart dependency to version 4.4.2

#### Fixed

N/A

### Older versions

A historical overview of changes can be found on [ArtifactHUB](https://artifacthub.io/packages/helm/k8s-at-home/zalando-postgres-cluster?modal=changelog)

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v0.1.1](https://github.com/k8s-at-home/helm-docs/releases/v0.1.1)
