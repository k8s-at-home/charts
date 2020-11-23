{{/*
Template to render VPN addon
It will include / inject the required templates based on the given values.
*/}}
{{- define "common.addon.vpn" -}}
{{- if .Values.addons.vpn.enabled -}}
  {{- if eq "openvpn" .Values.addons.vpn.type -}}
    {{- include "common.addon.openvpn" . }}
  {{- end -}}
  
  {{- if eq "wireguard" .Values.addons.vpn.type -}}
    {{- include "common.addon.wireguard" . }}
  {{- end -}}

  {{/* Include the configmap if not empty */}}
  {{- $configmap := include "common.addon.vpn.configmap" . -}}
  {{- if $configmap -}}
    {{- print "---" | nindent 0 -}}
    {{- $configmap | nindent 0 -}}
  {{- end -}}

  {{/* Append the vpn config volume to the additionalVolumes */}}
  {{- $volume := include "common.addon.vpn.volume" . | fromYaml -}}
  {{- if $volume -}}
    {{- $additionalVolumes := append .Values.additionalVolumes $volume }}
    {{- $_ := set .Values "additionalVolumes" $additionalVolumes -}}
  {{- end -}}

  {{/* Include the networkpolicy if not empty */}}
  {{- $networkpolicy := include "common.addon.vpn.networkpolicy" . -}}
  {{- if $networkpolicy -}}
    {{- print "---" | nindent 0 -}}
    {{- $networkpolicy | nindent 0 -}}
  {{- end -}}
{{- end -}}
{{- end -}}
