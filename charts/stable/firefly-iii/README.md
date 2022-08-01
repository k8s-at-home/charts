# firefly-iii

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square) ![AppVersion: version-5.6.14](https://img.shields.io/badge/AppVersion-version--5.6.14-informational?style=flat-square)

Firefly III: a personal finances manager

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/firefly-iii/firefly-iii>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | mariadb | 11.0.2 |
| https://charts.bitnami.com/bitnami | postgresql | 11.6.12 |
| https://charts.bitnami.com/bitnami | redis | 16.13.1 |
| https://library-charts.k8s-at-home.com | common | 4.5.0 |

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install firefly-iii k8s-at-home/firefly-iii
```

## Installing the Chart

To install the chart with the release name `firefly-iii`

```console
helm install firefly-iii k8s-at-home/firefly-iii
```

## Uninstalling the Chart

To uninstall the `firefly-iii` deployment

```console
helm uninstall firefly-iii
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install firefly-iii \
  --set env.TZ="America/New York" \
    k8s-at-home/firefly-iii
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install firefly-iii k8s-at-home/firefly-iii -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| cronjobs.recurring.affinity | object | `{}` |  |
| cronjobs.recurring.enabled | bool | `false` | Enable cronjob for creating recurring transactions |
| cronjobs.recurring.failedJobsHistoryLimit | int | `1` | How many pods to keep around for failed jobs |
| cronjobs.recurring.image.pullPolicy | string | `"IfNotPresent"` |  |
| cronjobs.recurring.image.repository | string | `"curlimages/curl"` |  |
| cronjobs.recurring.image.tag | string | `"7.81.0"` |  |
| cronjobs.recurring.imagePullSecrets | list | `[]` |  |
| cronjobs.recurring.nodeSelector | object | `{}` |  |
| cronjobs.recurring.podAnnotations | object | `{}` |  |
| cronjobs.recurring.podSecurityContext | object | `{}` |  |
| cronjobs.recurring.resources | object | `{}` |  |
| cronjobs.recurring.restartPolicy | string | `"OnFailure"` | How to treat failed jobs |
| cronjobs.recurring.schedule | string | `"0 3 * * *"` | Schedule time in UTC |
| cronjobs.recurring.securityContext | object | `{}` |  |
| cronjobs.recurring.successfulJobsHistoryLimit | int | `3` | How many pods to keep around for successful jobs |
| cronjobs.recurring.tolerations | list | `[]` |  |
| env | object | See below | environment variables. See [image docs](https://github.com/firefly-iii/firefly-iii/blob/main/.env.example) for more details. |
| env.ALLOW_WEBHOOKS | bool | `false` |  Firefly III supports webhooks. These are security sensitive and must be enabled manually first. |
| env.APP_DEBUG | bool | `false` | Set to true if you want to see debug information in error screens. |
| env.APP_ENV | string | `"local"` | You can leave this on "local". If you change it to production most console commands will ask for extra confirmation.   Never set it to "testing". |
| env.APP_KEY | string | `"SomeRandomStringOf32CharsExactly"` |  Change it to a string of exactly 32 chars or use something like `php artisan key:generate` to generate it. If you use Docker or similar, you can set this variable from a file by using APP_KEY_FILE |
| env.APP_LOG_LEVEL | string | `"notice"` |  debug, info, notice, warning, error, critical, alert, emergency If you set it to debug your logs will grow large, and fast. If you set it to emergency probably nothing will get logged, ever. |
| env.APP_NAME | string | `"FireflyIII"` |  Unless you like to tinker and know what you're doing. |
| env.APP_URL | string | `"http://localhost"` |  If you have trouble configuring your Firefly III installation, DON'T BOTHER setting this variable. It won't work. It doesn't do ANYTHING. Don't believe the lies you read online. I'm not joking. This configuration value WILL NOT HELP. Notable exception to this rule is Synology, which, according to some users, will use APP_URL to rewrite stuff. This variable is ONLY used in some of the emails Firefly III sends around. Nowhere else. So when configuring anything WEB related this variable doesn't do anything. Nothing If you're stuck I understand you get desperate but look SOMEWHERE ELSE. |
| env.AUDIT_LOG_LEVEL | string | `"info"` |  Set this to "emergency" if you dont want to store audit logs, leave on info otherwise. |
| env.AUTHENTICATION_GUARD | string | `"web"` |  Firefly III authentication settings Firefly III supports a few authentication methods: - 'web' (default, uses built in DB) - 'remote_user_guard' for Authelia etc Read more about these settings in the documentation. https://docs.firefly-iii.org/advanced-installation/authentication LDAP is no longer supported :( |
| env.AUTHENTICATION_GUARD_HEADER | string | `"REMOTE_USER"` |  Remote user guard settings |
| env.COOKIE_PATH | string | `"/"` |  If you use Docker or similar, you can set COOKIE_DOMAIN_FILE to set the value from a file instead of from an environment variable Setting samesite to "strict" may give you trouble logging in. |
| env.CUSTOM_LOGOUT_URL | string | `""` |  Extra authentication settings |
| env.DB_SOCKET | string | `""` |  # For other database types, please see the FAQ: https://docs.firefly-iii.org/support/faq # If you use Docker or similar, you can set these variables from a file by appending them with _FILE # Use "pgsql" for PostgreSQL # Use "mysql" for MySQL and MariaDB. # Use "sqlite" for SQLite. DB_CONNECTION=mysql DB_HOST=db DB_PORT=3306 DB_DATABASE=firefly DB_USERNAME=firefly DB_PASSWORD=secret_firefly_password leave empty or omit when not using a socket connection |
| env.DEFAULT_LANGUAGE | string | `"en_US"` |  For a list of available languages: https://github.com/firefly-iii/firefly-iii/tree/main/resources/lang If text is still in English, remember that not everything may have been translated. |
| env.DEFAULT_LOCALE | string | `"equal"` |  by default this value is the same as whatever the language is. |
| env.DISABLE_CSP_HEADER | bool | `false` |  or any version of Microsoft Edge / Internet Explorer (which amounts to the same thing really) This leaves you with the risk of not being able to stop XSS bugs should they ever surface. This is at your own risk. |
| env.DISABLE_FRAME_HEADER | bool | `false` |  Organizr. This is at your own risk. Applications running in frames run the risk of leaking information to their parent frame. |
| env.DKR_BUILD_LOCALE | bool | `false` |  Use this at your own risk. Disabling certain checks and features may result in lost of inconsistent data. However if you know what you're doing you can significantly speed up container start times. Set each value to true to enable, or false to disable. Set this to true to build all locales supported by Firefly III. This may take quite some time (several minutes) and is generally not recommended. If you wish to change or alter the list of locales, start your Docker container with `docker run -v locale.gen:/etc/locale.gen -e DKR_BUILD_LOCALE=true` and make sure your preferred locales are in your own locale.gen. |
| env.DKR_CHECK_SQLITE | bool | `true` |  Won't significantly speed up things. |
| env.DKR_RUN_MIGRATION | bool | `true` |  and is up to date. |
| env.DKR_RUN_PASSPORT_INSTALL | bool | `true` |  When disabled, Firefly III won't attempt to generate OAuth2 Passport keys. This won't be an issue, IFF (if and only if) you had previously generated keys already and they're stored in your database for restoration. |
| env.DKR_RUN_REPORT | bool | `true` |  Disabling this should have no impact on data integrity or safety but it won't warn you of possible issues. |
| env.DKR_RUN_UPGRADE | bool | `true` |  with the latest fixes (outside of migrations!) |
| env.DKR_RUN_VERIFY | bool | `true` |  Disabling this makes Firefly III assume your DB is intact. |
| env.ENABLE_EXTERNAL_MAP | bool | `false` |  of certain things, like transactions. Since this involves an external service, it's optional and disabled by default. |
| env.FIREFLY_III_LAYOUT | string | `"v1"` | Set UI layout version |
| env.LOG_CHANNEL | string | `"stack"` |  Several other options exist. You can use 'single' for one big fat error log (not recommended). Also available are 'syslog', 'errorlog' and 'stdout' which will log to the system itself. A rotating log option is 'daily', creates 5 files that (surprise) rotate. A cool option is 'papertrail' for cloud logging Default setting 'stack' will log to 'daily' and to 'stdout' at the same time. |
| env.MAILGUN_DOMAIN | string | `""` |  If you use Docker or similar, you can set these variables from a file by appending them with _FILE |
| env.MAILGUN_ENDPOINT | string | `"api.mailgun.net"` |  If you use Docker or similar, you can set this variable from a file by appending it with _FILE |
| env.MAIL_MAILER | string | `"log"` | If you want Firefly III to email you, update these settings   For instructions, see [this](https://docs.firefly-iii.org/advanced-installation/email)   If you use Docker or similar, you can set these variables from a file by appending them with _FILE |
| env.MYSQL_USE_SSL | bool | `false` |  If you use Docker or similar, you can set these variables from a file by appending them with _FILE |
| env.PAPERTRAIL_HOST | string | `""` |  Used when logging to papertrail: |
| env.PGSQL_SSL_MODE | string | `"prefer"` |  If you use Docker or similar, you can set these variables from a file by appending them with _FILE |
| env.REDIS_SCHEME | string | `"tcp"` |  If you use Docker or similar, you can set REDIS_HOST_FILE, REDIS_PASSWORD_FILE or REDIS_PORT_FILE to set the value from a file instead of from an environment variable can be tcp, unix or http |
| env.SEND_ERROR_MESSAGE | bool | `true` | Send mail on errors. |
| env.SEND_LOGIN_NEW_IP_WARNING | bool | `true` | Send mail on logins from new IP. |
| env.SEND_REGISTRATION_MAIL | bool | `true` | Send mail on new registrations. |
| env.SEND_REPORT_JOURNALS | bool | `false` | Send mail on recurring transactions.   These messages contain (sensitive) transaction information: |
| env.SITE_OWNER | string | `"mail@example.com"` |  If you use Docker or similar, you can set this variable from a file by using SITE_OWNER_FILE |
| env.STATIC_CRON_TOKEN | string | `""` | The static cron job token can be useful when you use Docker and wish to manage cron jobs.   1. Set this token to any 32-character value (this is important!).   2. Use this token in the cron URL instead of a user's command line token.   For more info: https://docs.firefly-iii.org/firefly-iii/advanced-installation/cron/   You can set this variable from a file by appending it with _FILE |
| env.TRACKER_SITE_ID | string | `""` |  Nobody uses this except for me on the demo site. But hey, feel free to use this if you want to. Do not prepend the TRACKER_URL with http:// or https:// The only tracker supported is Matomo. You can set the following variables from a file by appending them with _FILE: |
| env.TRUSTED_PROXIES | string | `"**"` |  Set it to ** and reverse proxies work just fine. |
| env.TZ | string | `"Europe/Amsterdam"` | Change this value to your preferred time zone.   Example: Europe/Amsterdam   For a list of supported time zones, see [this](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"fireflyiii/core"` | image repository |
| image.tag | string | `nil` |  |
| importer.affinity | object | `{}` |  |
| importer.controllerAnnotations | object | `{}` |  |
| importer.controllerLabels | object | `{}` |  |
| importer.enabled | bool | `false` | Deploy transaction importer |
| importer.image.pullPolicy | string | `"IfNotPresent"` |  |
| importer.image.repository | string | `"fireflyiii/data-importer"` |  |
| importer.image.tag | string | `"version-0.8.0"` |  |
| importer.imagePullSecrets | list | `[]` |  |
| importer.nodeSelector | object | `{}` |  |
| importer.podAnnotations | object | `{}` |  |
| importer.podSecurityContext | object | `{}` |  |
| importer.resources | object | `{}` |  |
| importer.securityContext | object | `{}` |  |
| importer.specs[0].accessToken | string | `""` | Fill your user's personal access token here |
| importer.specs[0].importerName | string | `"default-importer"` |  |
| importer.specs[0].port | int | `8080` |  |
| importer.specs[0].replicaCount | int | `1` |  |
| importer.specs[0].vanityUrl | string | `""` |  |
| importer.tolerations | list | `[]` |  |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| mariadb | object | See values.yaml | Enable and configure mariadb subchart under this key.    For more options see [mariadb chart documentation](https://github.com/bitnami/charts/tree/master/bitnami/mariadb) https://github.com/bitnami/charts/tree/master/bitnami/mariadb/#installing-the-chart |
| mariadb.auth | object | `{"database":"firefly","rootPassword":"","username":"firefly"}` |    persistence:     enabled: true |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| persistence.uploads.enabled | bool | `false` | Enable persistence for uploading attachments for transactions |
| postgresql | object | See values.yaml | Enable and configure postgresql subchart under this key.    For more options see [postgresql chart documentation](https://github.com/bitnami/charts/tree/master/bitnami/postgresql) https://github.com/bitnami/charts/tree/master/bitnami/postgresql/#installing-the-chart |
| redis | object | See values.yaml | Enable and configure redis subchart under this key.    For more options see [redis chart documentation](https://github.com/bitnami/charts/tree/master/bitnami/redis) |
| service | object | See values.yaml | Configures service settings for the chart. Normally this does not need to be modified. |
| strategy.type | string | `"Recreate"` |  |

## Changelog

### Version 0.2.0

#### Added

N/A

#### Changed

* Upgraded `common` chart dependency to version 4.5.0

#### Fixed

N/A

### Older versions

A historical overview of changes can be found on [ArtifactHUB](https://artifacthub.io/packages/helm/k8s-at-home/firefly-iii?modal=changelog)

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v0.1.1](https://github.com/k8s-at-home/helm-docs/releases/v0.1.1)
