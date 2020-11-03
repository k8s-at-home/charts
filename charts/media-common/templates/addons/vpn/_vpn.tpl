{{/*
Template to render VPN addon
*/}}
{{- define "media-common.addon.vpn" -}}
{{- if .Values.addons.vpn.enabled -}}
  {{- if eq "openvpn" .Values.addons.vpn.type -}}
    {{- include "media-common.addon.openvpn" . }}
  {{- end -}}
  
  {{- if eq "wireguard" .Values.addons.vpn.type -}}
    {{- include "media-common.addon.wireguard" . }}
  {{- end -}}

  {{/* Include the configmap if not empty */}}
  {{- $configmap := include "media-common.addon.vpn.configmap" . -}}
  {{- if $configmap -}}
    {{- print "---" | nindent 0 -}}
    {{- $configmap -}}
  {{- end -}}

  {{/* Append the vpn config volume to the additionalVolumes */}}
  {{- $volume := include "media-common.addon.vpn.volume" . | fromYaml -}}
  {{- if $volume -}}
    {{- $additionalVolumes := append .Values.additionalVolumes $volume }}
    {{- $_ := set .Values "additionalVolumes" $additionalVolumes -}}
  {{- end -}}

  {{/* Include the networkpolicy if not empty */}}
  {{- $networkpolicy := include "media-common.addon.vpn.networkpolicy" . -}}
  {{- if $networkpolicy -}}
    {{- print "---" | nindent 0 -}}
    {{- $networkpolicy -}}
  {{- end -}}
{{- end -}}
{{- end -}}
