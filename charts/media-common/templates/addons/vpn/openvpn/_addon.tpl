{{/*
Template to render OpenVPN addon
*/}}
{{- define "media-common.addon.openvpn" -}}
  {{/* Append the openVPN container to the additionalContainers */}}
  {{- $container := include "media-common.addon.openvpn.container" . | fromYaml -}}
  {{- if $container -}}
    {{- $additionalContainers := append .Values.additionalContainers $container }}
    {{- $_ := set .Values "additionalContainers" $additionalContainers -}}
  {{- end -}}

  {{/* Include the secret if not empty */}}
  {{- $secret := include "media-common.addon.openvpn.secret" . -}}
  {{- if $secret -}}
    {{- print "---" | nindent 0 -}}
    {{- $secret -}}
  {{- end -}}
{{- end -}}
