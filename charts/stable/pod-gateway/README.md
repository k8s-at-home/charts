# pod-gateway

![Version: 2.0.0](https://img.shields.io/badge/Version-2.0.0-informational?style=flat-square) ![AppVersion: 1.2.3](https://img.shields.io/badge/AppVersion-1.2.3-informational?style=flat-square)

Admision controller to change the default gateway and DNS server of PODs

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/pod-gateway/pod-gateway-docker>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://library-charts.k8s-at-home.com | common | 2.5.0 |

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install pod-gateway k8s-at-home/pod-gateway
```

## Installing the Chart

To install the chart with the release name `pod-gateway`

```console
helm install pod-gateway k8s-at-home/pod-gateway
```

## Uninstalling the Chart

To uninstall the `pod-gateway` deployment

```console
helm uninstall pod-gateway
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install pod-gateway \
  --set env.TZ="America/New York" \
    k8s-at-home/pod-gateway
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install pod-gateway k8s-at-home/pod-gateway -f values.yaml
```

## Custom configuration

You need to add `routed-gateway=true` to the namespaces with PODs you
want to route through this POD gateway. If needed the label name can be changed
in .Values.

The webhook by default changes all processed pods (remove `--setGatewayDefault`
if you want to change the default). You can also change the default for a
POD by adding a label or annotation (`setGateway` by default).

Processed PODs will get their default gateway changed. DNS server will
also be set to the gateway (at least the option `--keepDNS` is used).

If you want to use the VPN please follow the
[common chart VPN sidecar docummentation](https://github.com/k8s-at-home/library-charts/blob/main/charts/stable/common/values.yaml).
If you want to test without VPN client you can
set the `VPN_BLOCK_OTHER_TRAFFIC` to false.

**IMPORTANT**: Do not deploy this chart to a namespace controlled by this
webhook. This would result in a likelly deathlock when upgrading the chart.

**NOTE**: This char requires the cert-manager CRD to generate the required
certificates. It does not install it as dependency to avoid conflicts.

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| DNS | string | `"172.16.0.1"` | IP address of the DNS server within the vxlan tunnel. All mutated PODs will get this as their DNS server. It must match VXLAN_GATEWAY_IP in settings.sh |
| additionalVolumeMounts[0].mountPath | string | `"/config"` |  |
| additionalVolumeMounts[0].name | string | `"config"` |  |
| additionalVolumeMounts[0].readOnly | bool | `true` |  |
| addons.vpn.configFileSecret | string | `"openvpn"` |  |
| addons.vpn.enabled | bool | `false` | Enable the VPN if you want to route through a VPN. You might also want to set VPN_BLOCK_OTHER_TRAFFIC to true for extra safeness in case the VPN does connect |
| addons.vpn.env | string | `nil` |  |
| addons.vpn.networkPolicy.egress[0].ports[0].port | int | `443` |  |
| addons.vpn.networkPolicy.egress[0].ports[0].protocol | string | `"UDP"` |  |
| addons.vpn.networkPolicy.egress[0].to[0].ipBlock.cidr | string | `"0.0.0.0/0"` |  |
| addons.vpn.networkPolicy.egress[1].to[0].ipBlock.cidr | string | `"10.0.0.0/8"` |  |
| addons.vpn.networkPolicy.enabled | bool | `true` |  |
| addons.vpn.openvpn | string | `nil` |  |
| addons.vpn.type | string | `"openvpn"` |  |
| addons.vpn.wireguard | string | `nil` |  |
| clusterName | string | `"cluster.local"` | cluster name used to derive the gateway full name |
| command[0] | string | `"/bin/gateway_sidecar.sh"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"ghcr.io/k8s-at-home/pod-gateway"` |  |
| image.tag | string | `"v1.2.3"` |  |
| initContainers[0].command[0] | string | `"/bin/gateway_init.sh"` |  |
| initContainers[0].image | string | `nil` | Will be set automatically |
| initContainers[0].imagePullPolicy | string | `nil` | Will be set automatically |
| initContainers[0].name | string | `"routes"` |  |
| initContainers[0].securityContext.privileged | bool | `true` |  |
| initContainers[0].volumeMounts[0].mountPath | string | `"/config"` |  |
| initContainers[0].volumeMounts[0].name | string | `"config"` |  |
| initContainers[0].volumeMounts[0].readOnly | bool | `true` |  |
| probes.liveness.enabled | bool | `false` |  |
| probes.readiness.enabled | bool | `false` |  |
| probes.startup.enabled | bool | `false` |  |
| publicPorts | string | `nil` | settings to expose ports, usually through a VPN provider. NOTE: if you change it you will need to manually restart the gateway POD |
| routed_namespaces | list | `[]` | Namespaces that might contain routed PODs and therefore require a copy of the gneerated settings configmap. |
| securityContext.capabilities.add[0] | string | `"NET_ADMIN"` |  |
| service.clusterIP | string | `"None"` |  |
| service.port.port | int | `4789` |  |
| service.port.protocol | string | `"UDP"` |  |
| service.type | string | `"ClusterIP"` |  |
| settings.DNS_LOCAL_CIDRS | string | `"local"` | DNS queries to these domains will be resolved by K8S DNS instead of the default (typcally the VPN client changes it) |
| settings.NOT_ROUTED_TO_GATEWAY_CIDRS | string | `""` | IPs not sent to the POD gateway but to the default K8S. Multiple CIDRs can be specified using blanks as separator. Example for Calico: ""172.22.0.0/16 172.24.0.0/16" This is needed, for example, in case your CNI does not add a non-default rule for the K8S addresses (Flannel does). |
| settings.VPN_BLOCK_OTHER_TRAFFIC | bool | `false` | Prevent non VPN traffic to leave the gateway |
| settings.VPN_INTERFACE | string | `"tun0"` | If using a VPN, interface name created by it |
| settings.VPN_LOCAL_CIDRS | string | `"10.0.0.0/8 192.168.0.0/16"` | Traffic to these IPs will be send through the K8S gateway |
| settings.VPN_TRAFFIC_PORT | int | `443` | If VPN_BLOCK_OTHER_TRAFFIC is true, allow VPN traffic over this port |
| settings.VXLAN_GATEWAY_FIRST_DYNAMIC_IP | int | `20` | Keep a range of IPs for static assignment in nat.conf |
| settings.VXLAN_ID | int | `42` | Vxlan ID to use |
| settings.VXLAN_IP_NETWORK | string | `"172.16.0"` | VXLAN needs an /24 IP range not conflicting with K8S and local IP ranges |
| webhook.additionalVolumes | list | `[]` |  |
| webhook.args[0] | string | `"--tls-cert-file-path=/tls/tls.crt"` |  |
| webhook.args[1] | string | `"--tls-key-file-path=/tls/tls.key"` |  |
| webhook.args[2] | string | `"--setGatewayDefault"` |  |
| webhook.args[3] | string | `"--setGatewayLabel=setGateway"` |  |
| webhook.args[4] | string | `"--setGatewayAnnotation=setGateway"` |  |
| webhook.args[5] | string | `"--DNSPolicy=None"` |  |
| webhook.image.pullPolicy | string | `"IfNotPresent"` |  |
| webhook.image.repository | string | `"ghcr.io/k8s-at-home/gateway-admision-controller"` |  |
| webhook.image.tag | string | `"v3.2.0"` |  |
| webhook.inserted.init.cmd | string | `"/bin/client_init.sh"` |  |
| webhook.inserted.init.mountPath | string | `"/config"` |  |
| webhook.inserted.init.pullPolicy | string | `nil` | Will be set automatically |
| webhook.inserted.init.repository | string | `nil` | Will be set automatically |
| webhook.inserted.init.tag | string | `nil` | Will be set automatically |
| webhook.inserted.sidecar.cmd | string | `"/bin/client_sidecar.sh"` |  |
| webhook.inserted.sidecar.mountPath | string | `"/config"` |  |
| webhook.inserted.sidecar.pullPolicy | string | `nil` | Will be set automatically |
| webhook.inserted.sidecar.repository | string | `nil` | Will be set automatically |
| webhook.inserted.sidecar.tag | string | `nil` | Will be set automatically |
| webhook.namespaceSelector | object | `{"matchLabels":{"routed-gateway":"true"}}` | Selector for namespace. All pods in this namespace will get their default gateway changed |
| webhook.replicas | int | `1` |  |
| webhook.service.port.path | string | `"/wh/mutating/setgateway"` |  |
| webhook.service.port.port | int | `8080` |  |
| webhook.service.port.protocol | string | `"HTTPS"` |  |
| webhook.strategy.type | string | `"RollingUpdate"` |  |

## Changelog

All notable changes to this application Helm chart will be documented in this file but does not include changes from our common library. To read those click [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common#changelog).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [2.0.0]

#### Added

- N/A

#### Changed

- run gateway init container as privileged
- configmap is now a dictionary instead of a long string
- only modifed settings need to be specified

#### Removed

- N/A

[1.0.2]: #1.0.2

### [1.0.1]

#### Added

- N/A

#### Changed

- remove test container - sidecar allows exec as well
- remove hardcoded namespaces for configmaps

#### Removed

- N/A

[1.0.1]: #1.0.1

### [1.0.0]

#### Added

- renamed chart from `pod-gateway-setter` to `pod-gateway`
- sidecar support
- gatewaySufix
- init container uses now an image

#### Changed

- N/A

#### Removed

- N/A

[1.0.0]: #1.0.0

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
