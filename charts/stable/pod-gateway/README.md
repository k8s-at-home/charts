# pod-gateway

![Version: 5.2.1](https://img.shields.io/badge/Version-5.2.1-informational?style=flat-square) ![AppVersion: 1.2.6](https://img.shields.io/badge/AppVersion-1.2.6-informational?style=flat-square)

Admision controller to change the default gateway and DNS server of PODs

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/k8s-at-home/gateway-admision-controller>
* <https://github.com/k8s-at-home/pod-gateway>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://library-charts.k8s-at-home.com | common | 4.3.0 |

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

Please check [this guide](https://docs.k8s-at-home.com/guides/pod-gateway/)
for the full instructions.

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
| DNSPolicy | string | `"None"` | The DNSPolicy to apply to the POD. Only when set to "None" will the DNS value above apply. To avoid altering POD DNS (i.e., to allow initContainers to use DNS before the the VXLAN is up), set to "ClusterFirst" |
| addons | object | `{"vpn":{"enabled":false,"networkPolicy":{"egress":[{"ports":[{"port":443,"protocol":"UDP"}],"to":[{"ipBlock":{"cidr":"0.0.0.0/0"}}]},{"to":[{"ipBlock":{"cidr":"10.0.0.0/8"}}]}],"enabled":true},"type":"openvpn"}}` |    IP: 10   ports:   - type: udp     port: 18289   - type: tcp     port: 18289 |
| addons.vpn.enabled | bool | `false` | Enable the VPN if you want to route through a VPN. You might also want to set VPN_BLOCK_OTHER_TRAFFIC to true for extra safeness in case the VPN does connect |
| addons.vpn.networkPolicy | object | `{"egress":[{"ports":[{"port":443,"protocol":"UDP"}],"to":[{"ipBlock":{"cidr":"0.0.0.0/0"}}]},{"to":[{"ipBlock":{"cidr":"10.0.0.0/8"}}]}],"enabled":true}` |  wireguard: env: configFileSecret: openvpn |
| clusterName | string | `"cluster.local"` | cluster name used to derive the gateway full name |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy of the gateway and inserted helper cotainers |
| image.repository | string | `"ghcr.io/k8s-at-home/pod-gateway"` | image repository of the gateway and inserted helper containers |
| image.tag | string | `"v1.2.6"` | image tag of the gateway and inserted helper containers |
| publicPorts | string | `nil` | settings to expose ports, usually through a VPN provider. NOTE: if you change it you will need to manually restart the gateway POD |
| routed_namespaces | list | `[]` | Namespaces that might contain routed PODs and therefore require a copy of the gneerated settings configmap. |
| settings.DNS_LOCAL_CIDRS | string | `"local"` | DNS queries to these domains will be resolved by K8S DNS instead of the default (typcally the VPN client changes it) |
| settings.NOT_ROUTED_TO_GATEWAY_CIDRS | string | `""` | IPs not sent to the POD gateway but to the default K8S. Multiple CIDRs can be specified using blanks as separator. Example for Calico: ""172.22.0.0/16 172.24.0.0/16" This is needed, for example, in case your CNI does not add a non-default rule for the K8S addresses (Flannel does). |
| settings.VPN_BLOCK_OTHER_TRAFFIC | bool | `false` | Prevent non VPN traffic to leave the gateway |
| settings.VPN_INTERFACE | string | `"tun0"` | If using a VPN, interface name created by it |
| settings.VPN_LOCAL_CIDRS | string | `"10.0.0.0/8 192.168.0.0/16"` | Traffic to these IPs will be send through the K8S gateway |
| settings.VPN_TRAFFIC_PORT | int | `443` | If VPN_BLOCK_OTHER_TRAFFIC is true, allow VPN traffic over this port |
| settings.VXLAN_GATEWAY_FIRST_DYNAMIC_IP | int | `20` | Keep a range of IPs for static assignment in nat.conf |
| settings.VXLAN_ID | int | `42` | Vxlan ID to use |
| settings.VXLAN_IP_NETWORK | string | `"172.16.0"` | VXLAN needs an /24 IP range not conflicting with K8S and local IP ranges |
| webhook | object | See below | The webhook is used to mutate the PODs matching the given namespace labels. It inserts an init and sidecard helper containers that connect to the gateway pod created by this chart. |
| webhook.gatewayAnnotation | string | `"setGateway"` | annotation name to check when evaluating POD. If true the POD will get the gateway. If not set setGatewayDefault will apply. |
| webhook.gatewayDefault | bool | `true` | default behviour for new PODs in the evaluated namespace |
| webhook.gatewayLabel | string | `"setGateway"` | label name to check when evaluating POD. If true the POD will get the gateway. If not set setGatewayDefault will apply. |
| webhook.image.pullPolicy | string | `"IfNotPresent"` | image pullPolicy of the webhook |
| webhook.image.repository | string | `"ghcr.io/k8s-at-home/gateway-admision-controller"` | image repository of the webhook |
| webhook.image.tag | string | `"v3.3.2"` | image tag of the webhook |
| webhook.namespaceSelector | object | `{"custom":{},"label":"routed-gateway","type":"label"}` | Selector for namespace. All pods in this namespace will get evaluated by the webhook. **IMPORTANT**: Do not select the namespace where the webhook is deployed to or you will get locking issues. |
| webhook.replicas | int | `1` | number of webhook instances to deploy |
| webhook.strategy | object | `{"type":"RollingUpdate"}` | strategy for updates |

## Changelog

### Version 5.2.1

#### Added

N/A

#### Changed

* Added option to override mutated pod's DNSPolicy.

#### Fixed

N/A

### Older versions

A historical overview of changes can be found on [ArtifactHUB](https://artifacthub.io/packages/helm/k8s-at-home/pod-gateway?modal=changelog)

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v0.1.1](https://github.com/k8s-at-home/helm-docs/releases/v0.1.1)
