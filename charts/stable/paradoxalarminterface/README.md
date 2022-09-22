# paradoxalarminterface

![Version: 1.0.9](https://img.shields.io/badge/Version-1.0.9-informational?style=flat-square) ![AppVersion: 3.0.1](https://img.shields.io/badge/AppVersion-3.0.1-informational?style=flat-square)

Middleware that aims to connect to a Paradox Alarm panel, exposing the interface for monitoring and control via several technologies.

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/ParadoxAlarmInterface/pai>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://library-charts.k8s-at-home.com | common | 4.4.2 |

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install paradoxalarminterface k8s-at-home/paradoxalarminterface
```

## Installing the Chart

To install the chart with the release name `paradoxalarminterface`

```console
helm install paradoxalarminterface k8s-at-home/paradoxalarminterface
```

## Uninstalling the Chart

To uninstall the `paradoxalarminterface` deployment

```console
helm uninstall paradoxalarminterface
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install paradoxalarminterface \
  --set env.TZ="America/New York" \
    k8s-at-home/paradoxalarminterface
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install paradoxalarminterface k8s-at-home/paradoxalarminterface -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| config.commandAlias | object | `{"arm":"partition all arm","disarm":"partition all disarm"}` | alias for commands through text based interfaces |
| config.connectionType | string | `"Serial"` | Serial or IP Connection Type |
| config.developmentDumpMemory | bool | `false` | Development |
| config.dummyEventFilters | list | `[]` |  |
| config.dummyInterfaceEnable | bool | `false` | Dummy Interface for testing |
| config.dummyMinEventLevel | string | `"DEBUG"` |  |
| config.gsmAllowEvents | list | `[]` | Event filtering using regexp. Cannot be used together with gsmEventFilters List of tuples or regexp matching "type,label,property=value,property2=value" eg. [(major, minor), "zone:HOME:entry_delay=true", ...] eg r".*" |
| config.gsmContacts | list | `[]` | Contacts that are allowed to control the panel and receive notifications through SMS |
| config.gsmEnable | bool | `false` |  |
| config.gsmEventFilters | list | `[]` | Event filtering by tags: list of tags to include or exclude see hardware event.py for tag list eg "live,alarm,-restore" or "live,trouble,-clock" or "live,tamper" |
| config.gsmIgnoreEvents | list | `[]` | Same as gsmAllowEvents but to ignore some specific events that matched in _ALLOW_EVENTS eg r"zone,[\w]+,no_delay=true" or r"zone,[\w]+,exit_delay=.*" |
| config.gsmMinEventLevel | string | `"CRITICAL"` |  |
| config.gsmModemBaudrate | int | `115200` | Baudrate of the GSM modem |
| config.gsmModemPort | string | `""` | Pathname of the serial port |
| config.homeassistantNotificationsAllowEvents | list | `[]` | Event filtering using regexp. Cannot be used together with homeassistantNotificationsEventFilters List of tuples or regexp matching "type,label,property=value,property2=value" eg. [(major, minor), "zone:HOME:entry_delay=true", ...] eg r".*" |
| config.homeassistantNotificationsEnable | bool | `false` | Home Assistant Notifications (HASS.io required) |
| config.homeassistantNotificationsEventFilters | list | `[]` | Event filtering by tags: list of tags to include or exclude see hardware event.py for tag list eg "live,alarm,-restore" or "live,trouble,-clock" or "live,tamper" |
| config.homeassistantNotificationsIgnoreEvents | list | `[]` | Same as homeassistantNotificationsAllowEvents but to ignore some specific events that matched in _ALLOW_EVENTS eg r"zone,[\w]+,no_delay=true" or r"zone,[\w]+,exit_delay=.*" |
| config.homeassistantNotificationsMinEventLevel | string | `"INFO"` |  |
| config.homeassistantNotificationsNotifierName | string | `"notify"` |  |
| config.homeassistantPublishPartitionProperties[0] | string | `"target_state"` |  |
| config.homeassistantPublishPartitionProperties[1] | string | `"current_state"` |  |
| config.homeassistantPublishZoneProperties[0] | string | `"open"` |  |
| config.homeassistantPublishZoneProperties[1] | string | `"tamper"` |  |
| config.ipConnectionBare | bool | `false` | No not expect an IP150 module. Used this for base Serial over TCP tunnels |
| config.ipConnectionEmail | string | `nil` | Email registered in the site |
| config.ipConnectionHost | string | `"127.0.0.1"` | IP Module address when using direct IP Connection |
| config.ipConnectionPanelSerial | string | `nil` | Use a specific panel. Set it to None to use the first |
| config.ipConnectionPassword | string | `"paradox"` | IP Module password. "paradox" is default. |
| config.ipConnectionPort | int | `10000` | IP Module port when using direct IP Connection |
| config.ipConnectionSiteid | string | `nil` | SITE ID. IF defined, connection will be made through this method. |
| config.ipInterfaceBindAddress | string | `"0.0.0.0"` |  |
| config.ipInterfaceBindPort | int | `10000` |  |
| config.ipInterfaceEnable | bool | `false` | IP Socket Interface for remote PAI instance or Babyware |
| config.ipInterfacePassword | string | `"paradox"` |  |
| config.keepAliveInterval | int | `10` | Interval between status updates in seconds |
| config.labelEncoding | string | `"paradox-en"` | Encoding to use when decoding labels. paradox-* or https://docs.python.org/3/library/codecs.html#standard-encodings |
| config.labelRefreshInterval | int | `900` | Interval between refresh of labels in seconds |
| config.limits.door | list | `[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32]` | Doors to consider |
| config.limits.keypad | list | `[1,2,3,4,5,6,7,8,9]` | Keypads to monitor |
| config.limits.module | list | `[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17]` | Buses to monitor |
| config.limits.partition | list | `[1,2]` | Partitions to monitor and control |
| config.limits.pgm | list | `[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17]` | PGMs to monitor and control |
| config.limits.repeater | list | `[1,2,3,4,5,6,7,8,9]` | Repeaters to monitor |
| config.limits.user | list | `[1,2,3,4]` | Users to consider |
| config.limits.zone | list | `[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17]` | Zones to monitor and control |
| config.loggingDumpEvents | bool | `false` | Dump Event details to log |
| config.loggingDumpMessages | bool | `false` | Dump Messages to log |
| config.loggingDumpPackets | bool | `false` | Dump RAW Packets to log |
| config.loggingDumpStatus | bool | `false` | Dump Status to log |
| config.loggingFile | string | `nil` | Log file path |
| config.loggingFileMaxFiles | int | `2` | Max old log files to keep |
| config.loggingFileMaxSize | int | `10` | Max log file size in MB |
| config.loggingLevelConsole | int | `20` | Console logging level; CRITICAL: 50, ERROR: 40, WARNING: 30, INFO: 20, DEBUG: 10 |
| config.loggingLevelFile | int | `40` | File logging level; CRITICAL: 50, ERROR: 40, WARNING: 30, INFO: 20, DEBUG: 10 |
| config.mqttBaseTopic | string | `"paradox"` | Root of all topics |
| config.mqttBindAddress | string | `""` | MQTT Client bind address. Default: "" - pick automatically |
| config.mqttBindPort | int | `0` | MQTT Client bind port. Default: 0 - pick automatically |
| config.mqttBusTopic | string | `"buses"` | Base for buses states |
| config.mqttCommandAlias | object | `{"armed_away":"arm","armed_home":"arm_stay","armed_night":"arm_sleep","disarmed":"disarm"}` | For homebridge |
| config.mqttCommandStatusTopic | string | `"command_status"` | Topic for command statuses |
| config.mqttControlTopic | string | `"control"` | Base for control of other elements (ROOT/CONTROL/TYPE) |
| config.mqttDashPublish | bool | `false` | Publish dashboard app |
| config.mqttDashTemplate | string | `"/etc/pai/mqtt_dash.txt"` |  |
| config.mqttDashTopic | string | `"metrics/exchange/pai"` |  |
| config.mqttDefinitionsTopic | string | `"control"` | Base for definitions |
| config.mqttDoorTopic | string | `"doors"` | Topic for door events |
| config.mqttEnable | bool | `false` | Enable MQTT Interface |
| config.mqttEventsTopic | string | `"events"` | Base for events |
| config.mqttHomeassistantAutodiscoveryEnable | bool | `false` | MQTT Home Assistant Auto Discovery |
| config.mqttHomeassistantCode | string | `nil` |  |
| config.mqttHomeassistantDiscoveryPrefix | string | `"homeassistant"` | Prefix for Holme Assistant discovery |
| config.mqttHost | string | `"127.0.0.1"` | Hostname or address |
| config.mqttInterfaceTopic | string | `"interface"` | Topic for interfaces |
| config.mqttKeepalive | int | `60` | Keep alive |
| config.mqttKeypadTopic | string | `"keypads"` | Topic for keypad events |
| config.mqttModuleTopic | string | `"bus-module"` | Base for bus module states |
| config.mqttNotificationsTopic | string | `"notifications"` | Topic for notifications |
| config.mqttOutputTopic | string | `"outputs"` | Topic for output events |
| config.mqttPartitionTopic | string | `"partitions"` | Base for partition states |
| config.mqttPassword | string | `nil` | MQTT Password |
| config.mqttPort | int | `1883` | TCP Port (TLS port if mqttTlsCertPath is set) |
| config.mqttProtocol | string | `"3.1.1"` | Protocol to use ("3.1", "3.1.1" or "5") |
| config.mqttPublishCommandStatus | bool | `false` | Publish command statuses to MQTT |
| config.mqttPublishDefinitions | bool | `false` | Publish definitions of partitions/zones/users to MQTT. Not required in most cases. |
| config.mqttPublishRawEvents | bool | `true` |  |
| config.mqttQos | int | `0` | Publish messages with QOS level (0 - fire and forget, 1 - at least once, 2 - exactly once) |
| config.mqttRawTopic | string | `"raw"` | Topic for raw events |
| config.mqttRepeaterTopic | string | `"repeaters"` | Base for repeater states |
| config.mqttRepublishInterval | int | `43200` | Interval for republishing all data |
| config.mqttRetain | bool | `true` | Publish messages with Retain |
| config.mqttSendPanicTopic | string | `"panic"` |  |
| config.mqttStatesTopic | string | `"states"` | Topic for state events |
| config.mqttSystemTopic | string | `"system"` | Base for panel states |
| config.mqttTlsCertPath | string | `nil` | Path to ca cert (/etc/pai/certs/ca.pem), if you want TLS |
| config.mqttToggleCodes | object | `{}` |  |
| config.mqttTransport | string | `"tcp"` | Transport to use ("tcp" or "websockets") |
| config.mqttUseNumericStates | bool | `false` | use 0 and 1 instead of true and false |
| config.mqttUserTopic | string | `"users"` | Base for user states |
| config.mqttUsername | string | `nil` | MQTT Username for authentication |
| config.mqttZoneTopic | string | `"zones"` | Base for zone states |
| config.outputPulseDuration | int | `1` | Duration of a PGM pulse in seconds |
| config.password | string | `"0000"` | PC Password. Set to None if Panel has no Password. In Babyware: Right click on your panel -> Properties -> PC Communication (Babyware) -> PC Communication (Babyware) Tab. |
| config.powerUpdateInterval | int | `60` | Interval between updates of the battery, DC and VDC voltages |
| config.pushPowerUpdateWithoutChange | bool | `true` | Always notify interfaces of power changes |
| config.pushUpdateWithoutChange | bool | `false` | Always notify interfaces of all changes |
| config.pushbulletAllowEvents | list | `[]` | Event filtering using regexp. Cannot be used together with pushbulletEventFilters List of tuples or regexp matching "type,label,property=value,property2=value" eg. [(major, minor), "zone:HOME:entry_delay=true", ...] eg r".*" |
| config.pushbulletContacts | list | `[]` | Pushbullet user identifiers for notifications and interaction |
| config.pushbulletEnable | bool | `false` |  |
| config.pushbulletEventFilters | list | `[]` | Event filtering by tags list of tags to include or exclude see hardware event.py for tag list eg "live,alarm,-restore" or "live,trouble,-clock" or "live,tamper" |
| config.pushbulletIgnoreEvents | list | `[]` | Same as previous  but to ignore some specific events that matched in _ALLOW_EVENTS eg r"zone,[\w]+,no_delay=true" or r"zone,[\w]+,exit_delay=.*" |
| config.pushbulletKey | string | `""` | Authentication key used for Pushbullet |
| config.pushbulletMinEventLevel | string | `"INFO"` |  |
| config.pushoverAllowEvents | list | `[]` | Event filtering using regexp. Cannot be used together with pushoverEventFilters List of tuples or regexp matching "type,label,property=value,property2=value" eg. [(major, minor), "zone:HOME:entry_delay=true", ...] eg r".*" |
| config.pushoverBroadcastKeys | list | `[]` | Pushover user or group keys to broadcast notifications to @default [{user_key: "<user_key>", devices: "*"}] |
| config.pushoverEnable | bool | `false` |  |
| config.pushoverEventFilters | list | `[]` | Event filtering by tags: list of tags to include or exclude see hardware event.py for tag list eg "live,alarm,-restore" or "live,trouble,-clock" or "live,tamper" |
| config.pushoverIgnoreEvents | list | `[]` | Same as pushoverAllowEvents but to ignore some specific events that matched in _ALLOW_EVENTS eg r"zone,[\w]+,no_delay=true" or r"zone,[\w]+,exit_delay=.*" |
| config.pushoverKey | string | `""` | Application token for Pushover |
| config.pushoverMinEventLevel | string | `"INFO"` |  |
| config.serialBaud | int | `9600` | 9600 for SP/MG. For EVO: Use 38400(default setting) or 57600 |
| config.serialPort | string | `"/dev/ttyS1"` | Pathname of the Serial Port |
| config.signalAllowEvents | list | `[]` | Event filtering using regexp. Cannot be used together with signalEventFilters List of tuples or regexp matching "type,label,property=value,property2=value" eg. [(major, minor), "zone:HOME:entry_delay=true", ...] eg r".*" |
| config.signalContacts | list | `[]` | Contacts that are allowed to control the panel and receive notifications through Signal |
| config.signalEnable | bool | `false` |  |
| config.signalEventFilters | list | `[]` | Event filtering by tags: list of tags to include or exclude see hardware event.py for tag list eg "live,alarm,-restore" or "live,trouble,-clock" or "live,tamper" |
| config.signalIgnoreEvents | list | `[]` | Same as signalAllowEvents but to ignore some specific events that matched in _ALLOW_EVENTS eg r"zone,[\w]+,no_delay=true" or r"zone,[\w]+,exit_delay=.*" |
| config.signalMinEventLevel | string | `"INFO"` |  |
| config.syncTime | bool | `false` | Update panel time periodically when time drifts more than SYNC_TIME_MIN_DRIFT |
| config.syncTimeMinDrift | int | `60` | Minimum time drift in seconds to initiate time sync |
| env | object | See below | environment variables. See more environment variables in the [paradoxalarminterface documentation](https://paradoxalarminterface.org/docs). |
| env.TZ | string | `"UTC"` | Set the container timezone |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"paradoxalarminterface/pai"` | image repository |
| image.tag | string | chart.appVersion | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| service | object | See values.yaml | Configures service settings for the chart. |
| service.main.enabled | bool | `false` | Main service is disabled, only enable if you want to connect Babyware |
| service.main.ports.babyware | object | `{"enabled":true,"port":10000,"protocol":"TCP"}` | Port for Babyware connection. Set config.ipInterfaceEnable to true if you enable this |

## Changelog

### Version 1.0.9

#### Added

* Initial version

#### Changed

N/A

#### Fixed

N/A

### Older versions

A historical overview of changes can be found on [ArtifactHUB](https://artifacthub.io/packages/helm/k8s-at-home/paradoxalarminterface?modal=changelog)

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v0.1.1](https://github.com/k8s-at-home/helm-docs/releases/v0.1.1)
