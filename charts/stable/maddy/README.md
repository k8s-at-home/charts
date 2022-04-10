# maddy

![Version: 2.1.0](https://img.shields.io/badge/Version-2.1.0-informational?style=flat-square) ![AppVersion: v0.5.2](https://img.shields.io/badge/AppVersion-v0.5.2-informational?style=flat-square)

Maddy Mail Server

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/foxcpp/maddy>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | postgresql | 10.16.2 |
| https://library-charts.k8s-at-home.com | common | 4.3.0 |

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install maddy k8s-at-home/maddy
```

## Installing the Chart

To install the chart with the release name `maddy`

```console
helm install maddy k8s-at-home/maddy
```

## Uninstalling the Chart

To uninstall the `maddy` deployment

```console
helm uninstall maddy
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install maddy \
  --set env.TZ="America/New York" \
    k8s-at-home/maddy
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install maddy k8s-at-home/maddy -f values.yaml
```

## Custom configuration

After you have deployed the Helm chart you need to update your DNS. See
[Maddy initial setup instructions](https://maddy.email/tutorials/setting-up/)
about how to do this.

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"foxcpp/maddy"` | image repository |
| image.tag | string | chart.appVersion | image tag |
| maddy.auth.ldap | object | See [See Maddy auth](https://maddy.email/man/_generated_maddy-auth.5/#configuration-directives_5) | If type is ldap the following options are required |
| maddy.auth.ldap."bind plain" | string | `"\"cn=maddy,ou=people,dc=maddy,dc=test\" \"123456\""` | Specify initial bind credentials. Not required ('bind off') if DN template is used. |
| maddy.auth.ldap.base_dn | string | `"\"ou=people,dc=maddy,dc=test\""` | Specify base_dn to lookup DN. |
| maddy.auth.ldap.connect_timeout | string | `"1m"` | Timeout for initial connection to the directory server. |
| maddy.auth.ldap.debug | string | `"off"` | Enable verbose logging. You don't need that unless you are reporting a bug. |
| maddy.auth.ldap.dn_template | string | `"\"cn={username},ou=people,dc=maddy,dc=test\""` | Specify DN template to skip lookup. |
| maddy.auth.ldap.filter | string | `"\"(&(objectClass=posixAccount)(uid={username}))\""` | Specify filter to lookup DN. |
| maddy.auth.ldap.starttls | string | `"off"` | Whether to upgrade connection to TLS using STARTTLS. |
| maddy.auth.ldap.urls | string | `"ldap://maddy.test:389"` | URLs of the directory servers to use. First available server is used - no load-balancing is done. |
| maddy.auth.type | string | `"sql"` | Where to store authorised users. Valid values are `sql` and `ldap` |
| maddy.config_files.alias | string | `"## Replace 'cat' with any domain to 'dog'.\n## E.g. cat@example.net -> dog@example.net\n# cat: dog\n\n## Replace cat@example.org with cat@example.com.\n## Takes priority over the previous line.\n#cat@example.org: cat@example.com\n"` | Alias file used in smtp_rule See [alias examples](https://maddy.email/man/_generated_maddy-filters.5/). |
| maddy.extra_settings.imap | object | `{}` | Additional settings for imap backend |
| maddy.extra_settings.local_mailboxes | object | `{}` | Additional settings for local_mailboxes storage |
| maddy.hostname | string | `"mx.example.com"` | Hostname the service will listen to (incoming SMTP and IMAP) |
| maddy.primary_domain | string | `"example.com"` | Primary domain - will be included in SMTP protocol |
| maddy.secondary_domains | string | `nil` | Space separated list of additional domains this server handles |
| maddy.smtp_rules | object | See values.yaml | The main part of the configuration - rules for the smtp pipelines. You can define multiple blocks. Content comes from the chart when setting `file` (see files/smtp_rules folder) and/or the custom block |
| maddy.sql.postgres_dsn | object | See [Go DSN](https://pkg.go.dev/github.com/lib/pq?utm_source=godoc#hdr-Connection_String_Parameters) | If type is postgres configure the Data Source Name (DSN) |
| maddy.sql.postgres_dsn.dbname | string | DB name set in embedded postgres chart | The name of the DB |
| maddy.sql.postgres_dsn.host | string | host of embedded postgres chart | The host to connect to |
| maddy.sql.postgres_dsn.password | string | user set in embedded postgres chart | The DB user password |
| maddy.sql.postgres_dsn.sslmode | string | `"disable"` | SSL model for the DB disable - No SSL require - Always SSL (skip verification) verify-ca - Always SSL (verify that the certificate presented by the             server was signed by a trusted CA) verify-full - Always SSL (verify that the certification presented by               the server was signed by a trusted CA and the server host name               matches the one in the certificate) |
| maddy.sql.postgres_dsn.user | string | user set in embedded postgres chart | The DB user |
| maddy.sql.type | string | `"sqlite3"` | DB type to use. Supported are `sqlite3` and `postgres` Database is used to store IMAP indexes and (when not using LDAP) authorized users |
| maddy.tls_secret_name | string | `"myTLSSecret"` | name of K8S secret containing the cert and key to use by maddy. |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| postgresql | object | see bellow | Bitnami postgres chart. For more options see https://github.com/bitnami/charts/tree/master/bitnami/postgresql |
| postgresql.enabled | bool | `false` | Enable if you want to use the embedded postgresql chart (not neeeded if you use your own postgres DB). |
| postgresql.persistence.enabled | bool | `false` | if database is stored to a PVC. Set to true when you are done testing. |
| postgresql.postgresqlDatabase | string | `"postgres"` | Postgres database password |
| postgresql.postgresqlPassword | string | `"changeme"` | Postgres database password |
| postgresql.postgresqlUsername | string | `"postgres"` | Postgres database user name |
| service | object | See values.yaml | Configures service settings for the chart. |

## Changelog

### Version 2.1.0

#### Added

N/A

#### Changed

* Upgraded `postgresql` chart dependency to version `10.16.2`.

#### Fixed

N/A

### Older versions

A historical overview of changes can be found on [ArtifactHUB](https://artifacthub.io/packages/helm/k8s-at-home/maddy?modal=changelog)

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v0.1.1](https://github.com/k8s-at-home/helm-docs/releases/v0.1.1)
