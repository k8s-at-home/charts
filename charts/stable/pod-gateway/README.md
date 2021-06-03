# pod-gateway

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

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

**IMPORTANT**: Do not deploy this chart to a namespace controlled by this
webhook. This would result in a likelly deathlock when upgrading the chart.

**NOTE**: This char requires the cert-manager CRD to generate the required
certificates. It does not install it as dependency to avoid conflicts.

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| DNS | string | `"172.16.0.1"` | IP address of the DNS server within the vxlan tunnel. All mutated PODs will get this as their DNS server. It must match VXLAN_GATEWAY_IP in settings.sh |
| additionalContainers[0].command[0] | string | `"/bin/sh"` |  |
| additionalContainers[0].command[1] | string | `"-c"` |  |
| additionalContainers[0].command[2] | string | `"while true; do sleep 600 & wait $!; done"` |  |
| additionalContainers[0].image | string | `"ghcr.io/k8s-at-home/pod-gateway:dev"` |  |
| additionalContainers[0].imagePullPolicy | string | `nil` |  |
| additionalContainers[0].name | string | `"test"` |  |
| additionalContainers[0].securityContext.capabilities.add[0] | string | `"NET_ADMIN"` |  |
| additionalContainers[0].volumeMounts[0].mountPath | string | `"/config"` |  |
| additionalContainers[0].volumeMounts[0].name | string | `"config"` |  |
| additionalContainers[0].volumeMounts[0].readOnly | bool | `true` |  |
| additionalVolumeMounts[0].mountPath | string | `"/config"` |  |
| additionalVolumeMounts[0].name | string | `"config"` |  |
| additionalVolumeMounts[0].readOnly | bool | `true` |  |
| clusterName | string | `"cluster.local"` | cluster name used to derive the gateway full name |
| command[0] | string | `"/bin/gateway_sidecar.sh"` |  |
| configmap.data."nat.conf" | string | `"# Configure client PODs with static IP addresses\n# and ports exposed through NAT\n# static IPs must be bellow VXLAN_GATEWAY_FIRST_DYNAMIC_IP\n#\n# hostname IP ports(coma separated)\n# Example:\n# transmission 10 tcp:18289,udp:18289\n"` | settings to expose ports, usually through a VPN provider NOTE: if you change it you will need to manually restart all containers using it |
| configmap.data."settings.sh" | string | `"#!/bin/sh\n# hostname of the gateway - it must accept vxlan and DHCP traffic\n# clients get it as env variable\nGATEWAY_NAME=\"${gateway}\"\n# K8S DNS IP address\n# clients get it as env variable\nK8S_DNS_IPS=\"${K8S_DNS_ips}\"\n\n# Vxlan ID to use\nVXLAN_ID=\"42\"\n# VXLAN need an /24 IP range not conflicting with K8S and local IP ranges\nVXLAN_IP_NETWORK=\"172.16.0\"\n# Gateway IP within the VXLAN - client PODs will be routed through it\nVXLAN_GATEWAY_IP=\"${VXLAN_IP_NETWORK}.1\"\n# Keep a range of IPs for static assignment in nat.conf\nVXLAN_GATEWAY_FIRST_DYNAMIC_IP=20\n\n# If using a VPN, interface name created by it\nVPN_INTERFACE=tun0\n# Prevent non VPN traffic to leave the gateway\nVPN_BLOCK_OTHER_TRAFFIC=false\n# Traffic to these IPs will be send through the K8S gateway\nVPN_LOCAL_CIDRS=\"10.0.0.0/8 192.168.0.0/16\"\n\n# DNS queries to these domains will be resolved by K8S DNS instead of\n# the default (typcally the VPN client changes it)\nDNS_LOCAL_CIDRS=\"local\"\n"` | settings for gateway - defaults should usually be good NOTE: if you change it you will need to manually restart all containers using it |
| configmap.enabled | bool | `true` | configmap contains clients and gateway PODs setting |
| configmap.namespaces | list | `["kube-system","vpn"]` | Namespaces to create the configmap to. It must list all namespaces where client PODs get deployed to. The chart namespace is added automatically |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"ghcr.io/k8s-at-home/pod-gateway"` |  |
| image.tag | string | `"v1.1.0"` |  |
| initContainers[0].command[0] | string | `"/bin/gateway_init.sh"` |  |
| initContainers[0].image | string | `nil` | Will be set automatically |
| initContainers[0].imagePullPolicy | string | `nil` | Will be set automatically |
| initContainers[0].name | string | `"routes"` |  |
| initContainers[0].securityContext.capabilities.add[0] | string | `"NET_ADMIN"` |  |
| initContainers[0].volumeMounts[0].mountPath | string | `"/config"` |  |
| initContainers[0].volumeMounts[0].name | string | `"config"` |  |
| initContainers[0].volumeMounts[0].readOnly | bool | `true` |  |
| probes.liveness.enabled | bool | `false` |  |
| probes.readiness.enabled | bool | `false` |  |
| probes.startup.enabled | bool | `false` |  |
| securityContext.capabilities.add[0] | string | `"NET_ADMIN"` |  |
| service.clusterIP | string | `"None"` |  |
| service.port.port | int | `4789` |  |
| service.port.protocol | string | `"UDP"` |  |
| service.type | string | `"ClusterIP"` |  |
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

### [1.0.0]

#### Added

- renamed chart
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
