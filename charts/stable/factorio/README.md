# factorio

![Version: 1.1.0](https://img.shields.io/badge/Version-1.1.0-informational?style=flat-square) ![AppVersion: stable](https://img.shields.io/badge/AppVersion-stable-informational?style=flat-square)

Factorio dedicated steam game server

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/factoriotools/factorio-docker>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://library-charts.k8s-at-home.com | common | 4.4.0 |

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install factorio k8s-at-home/factorio
```

## Installing the Chart

To install the chart with the release name `factorio`

```console
helm install factorio k8s-at-home/factorio
```

## Uninstalling the Chart

To uninstall the `factorio` deployment

```console
helm uninstall factorio
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install factorio \
  --set env.TZ="America/New York" \
    k8s-at-home/factorio
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install factorio k8s-at-home/factorio -f values.yaml
```

## Custom configuration

### Cart credits

This chart is partially inspired by [https://github.com/SQLJames/factorio-server-charts](https://github.com/SQLJames/factorio-server-charts) and the yaml for the server settings defaults is sourced from here.  Many thanks to @SQLJames for his work on that chart and the inspiration.

### Keeping server up to date

By default, this helm chart will follow `Factoriotools/Factorio:stable`.  Game servers need to be kept up to date regularly, but you might not want it updating during gameplay with traffic being forwarded from your router through open ports
The author recommends a approach of setting a `tag:` in your values.yaml to pin a specific version, and using a solution like [Renovate-bot](https://github.com/renovatebot/renovate) to control updates.
This can be best achieved to pinning to a specific sha release, which allows you to set the tag to follow.

Note that by default renovate follows latest which can sometimes be undesirable for this image.  The author notes that `stable` follows the version declared stable on [Factorio.com[(https://Factorio.com)] and on Steam, and `latest` can at times diverge into testing/beta releases (which require a Steam opt-in for downloading with traffic being forwarded from your router through open ports

### Pinning to one node

Whilst not best practice in k8s, it may be desirable to pin a game server to a node, so it is getting a paticular CPU (i.e. targeting best core performance).

```yaml
# Prefer higher single core speed node
affinity:
    nodeAffinity:
    preferredDuringSchedulingIgnoredDuringExecution:
        - weight: 1
        preference:
            matchExpressions:
            - key: kubernetes.io/hostname
                operator: In
                values:
                - <yourhostname>

```

### Map generation

This chart has yaml to allow you to pick map gen settings for first load.  One way that *may* be eaiser to get a map howver, is to generate the map in your local game with the UI, ensure you are happy with it.  You can run this helm once with default settings (to generate the folder structure in a PVC), spin it back down and mount the pvc in a test pod.  You can then copy your generated `map.zip` to the container and spin it back up - the server will load the 'latest' save and run your map.

### Networking

Networking may be a challenge as Factorio uses UDP.  One approach can be to use a load balancer in front of the service, with traffic being forwarded from your router through open ports pointed at the load balancer.  A load balancer could be set in this chart, for example with this addition (using metallb for load-balancing):

```yaml
service:
  main:
    ports:
      http:
        server:
            enabled: true
            type: LoadBalancer # Setting Ip external to cluster for easy port forward
            externalTrafficPolicy: Cluster
            loadBalancerIP: "192.168.2.100" # Set a IP here to ensure the game server is given a static internal IP
            annotations:
                metallb.universe.tf/allow-shared-ip: factorio
            ports:
                factorio-game:
                port: 34201
                protocol: UDP
                targetPort: 34197
        rcon:
            enabled: false
            type: LoadBalancer # Setting Ip external to cluster for easy port forward
            externalTrafficPolicy: Cluster
            loadBalancerIP: "192.168.2.100" # Set a IP here to ensure the game server is given a static internal IP
            annotations:
                metallb.universe.tf/allow-shared-ip: factorio
            ports:
                factorio-rcon:
                enabled: true
                port: 27015
                protocol: TCP
                targetPort: 27015
```

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| config | object | See values.yaml | Configure server settings.  Can be disabled if you wish to configure in the container in the json config files. -- See values.yaml for descriptions for many config options, ore refer to https://wiki.factorio.com/Multiplayer. |
| config.ban_list | string | `nil` |  - "jane_doe" |
| config.factorioServer.generate_new_save | bool | `false` | Generate a New Save |
| config.factorioServer.load_latest_save | bool | `true` | lets the game know if you want to load the latest save |
| config.factorioServer.save_name | string | `"_autosave1"` | name to be used for save |
| config.factorioServer.token | string | `nil` | factorio.com token |
| config.factorioServer.update_mods_on_start | bool | `false` | Update mods on start |
| config.factorioServer.username | string | `nil` | factorio.com password |
| config.map_gen_settings.cliff_settings.cliff_elevation_0 | int | `10` | Elevation of first row of cliffs |
| config.map_gen_settings.cliff_settings.cliff_elevation_interval | int | `40` | Elevation difference between successive rows of cliffs. -- This is inversely proportional to frequency in the map generation GUI. Specifically, when set from the GUI the value is 40 / frequency. |
| config.map_gen_settings.cliff_settings.name | string | `"cliff"` | Name of the cliff prototype |
| config.map_gen_settings.cliff_settings.richness | int | `1` | Called cliff continuity in the map generator GUI. 0 will result in no cliffs, 10 will make all cliff rows completely solid |
| config.map_gen_settings.height | int | `0` | Width and height of map, in tiles; 0 means infinite |
| config.map_gen_settings.property_expression_names | object | `{"control-setting:aux:bias":"0","control-setting:aux:frequency:multiplier":"1","control-setting:moisture:bias":"0","control-setting:moisture:frequency:multiplier":"1"}` | Overrides for property value generators (map type) -- Leave elevation blank to get normal terrain. -- Use ''elevation'': ''0_16-elevation'' to reproduce terrain from 0.16. -- Use ''elevation'': ''0_17-island'' to get an island. -- Moisture and terrain type are also controlled via this. -- "control-setting:moisture:frequency:multiplier is the inverse of the moisture scale in the map generator GUI." -- "control-setting:moisture:bias is the moisture bias in the map generator GUI." -- "control-setting:aux:frequency:multiplier is the inverse of the terrain type scale in the map generator GUI." -- "control-setting:aux:bias is the teraain type bias in the map generator GUI." |
| config.map_gen_settings.seed | string | `nil` | Use null for a random seed, number for a specific seed. |
| config.map_gen_settings.starting_area | int | `1` | Multiplier for biter free zone radius |
| config.map_gen_settings.terrain_segmentation | int | `1` | The inverse of water scale in the map generator GUI. |
| config.map_gen_settings.water | int | `1` | The equivalent to water coverage in the map generator GUI. Higher coverage means --  more water in larger oceans. --  Water level = 10 * log2(this value) |
| config.map_gen_settings.width | int | `0` | Width and height of map, in tiles; 0 means infinite |
| config.map_settings.pollution.diffusion_ratio | float | `0.02` | these are values for 60 ticks (1 simulated second) -- amount that is diffused to neighboring chunk |
| config.rcon | object | `{"external":true,"password":"replaceme","port":30100,"type":"LoadBalancer"}` | Password and port for the rcon service |
| config.server_settings.afk_autokick_interval | int | `0` | How many minutes until someone is kicked when doing nothing, 0 for never. |
| config.server_settings.allow_commands | string | `"admins-only"` | possible values are, true, false and admins-only |
| config.server_settings.auto_pause | bool | `true` | Whether should the server be paused when no players are present. |
| config.server_settings.autosave_interval | int | `10` | Autosave interval in minutes |
| config.server_settings.autosave_only_on_server | bool | `true` | Whether autosaves should be saved only on server or also on all connected clients. Default is true. |
| config.server_settings.autosave_slots | int | `5` | server autosave slots, it is cycled through when the server autosaves. |
| config.server_settings.description | string | `"Factorio running on Kubernetes"` | Your Instance Description |
| config.server_settings.game_password | string | `""` | password required to log into the factorio server |
| config.server_settings.ignore_player_limit_for_returning_players | bool | `false` | Players that played on this map already can join even when the max player limit was reached. |
| config.server_settings.max_players | int | `0` | Maximum number of players allowed, admins can join even a full server. 0 means unlimited. |
| config.server_settings.max_upload_in_kilobytes_per_second | int | `0` | optional, default value is 0. 0 means unlimited. |
| config.server_settings.max_upload_slots | int | `5` | optional, default value is 5. 0 means unlimited. |
| config.server_settings.minimum_latency_in_ticks | int | `0` | optional one tick is 16ms in default speed, default value is 0. 0 means no minimum. |
| config.server_settings.minimum_segment_size | int | `25` | Long network messages are split into segments that are sent --  over multiple ticks. Their size depends on the number of peers currently connected. --  Increasing the segment size will increase upload bandwidth requirement for the server --  and download bandwidth requirement for clients. This setting only affects server --  outbound messages. Changing these settings can have a negative impact on connection --  stability for some clients. |
| config.server_settings.name | string | `"Factorio"` | Your Instance Name |
| config.server_settings.non_blocking_saving | bool | `false` | Highly experimental feature, enable only at your own --  risk of losing your saves. On UNIX systems, server will fork itself to create an --  autosave. Autosaving on connected Windows clients will be disabled regardless of --  autosave_only_on_server option. |
| config.server_settings.only_admins_can_pause_the_game | bool | `true` | specifies if anyone can pause or only admins |
| config.server_settings.require_user_verification | bool | `false` | When set to true, the server will only allow clients that have a valid Factorio.com account |
| config.server_settings.token | string | `""` | Authentication token. May be used instead of password above. |
| config.server_settings.username | string | `""` | Your factorio.com login credentials. Required for games with visibility public |
| config.server_settings.visibility | object | `{"lan":true,"public":false}` | Game visibility |
| config.server_settings.visibility.lan | bool | `true` | Game will be broadcast on LAN |
| config.server_settings.visibility.public | bool | `false` | Game will be published on the official Factorio matching server |
| config.white_list | string | `nil` |  - "jane_doe" |
| env | object | See below | environment variables. See more environment variables in the [factorio documentation](https://factorio.org/docs). |
| env.GENERATE_NEW_SAVE | string | `"{{ .Values.config.factorioServer.generate_new_save }}"` | Generate a new save if one does not exist before starting the server |
| env.LOAD_LATEST_SAVE | string | `"{{ .Values.config.factorioServer.load_latest_save }}"` | Load latest when true. Otherwise load SAVE_NAME |
| env.PORT | string | `"{{ .Values.service.main.ports.server.port }}"` | UDP port the server listens on |
| env.RCON_PORT | string | `"{{ .Values.service.main.ports.rcon.port }}"` | TCP port the rcon server listens on |
| env.SAVE_NAME | string | `"{{ .Values.config.factorioServer.save_name }}"` | Name to use for the save file |
| env.TOKEN | string | `"{{ .Values.config.factorioServer.token }}"` | factorio.com token |
| env.TZ | string | `"UTC"` | Set the container timezone |
| env.UPDATE_MODS_ON_START | string | `"{{ .Values.config.factorioServer.update_mods_on_start }}"` | If mods should be updated befoqre starting the server |
| env.USERNAME | string | `"{{ .Values.config.factorioServer.username }}"` | factorio.com username |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"factoriotools/factorio"` | image repository |
| image.tag | string | chart.appVersion | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| initContainers.copy-configmap | object | See values.yaml | Configures an initContainer that copies the configmap to the factorio conf directory |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| service | object | See values.yaml | Configures service settings for the chart. |

## Changelog

### Version 1.1.0

#### Added

N/A

#### Changed

* Upgraded `common` chart dependency to version 4.4.0

#### Fixed

N/A

### Older versions

A historical overview of changes can be found on [ArtifactHUB](https://artifacthub.io/packages/helm/k8s-at-home/factorio?modal=changelog)

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v0.1.1](https://github.com/k8s-at-home/helm-docs/releases/v0.1.1)
