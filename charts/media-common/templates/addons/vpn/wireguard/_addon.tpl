{{/*
Template to render Wireguard addon
*/}}
{{- define "media-common.addon.wireguard" -}}
  {{/* Append the Wireguard container to the additionalContainers */}}
  {{- $container := include "media-common.addon.wireguard.container" . | fromYaml -}}
  {{- if $container -}}
    {{- $additionalContainers := append .Values.additionalContainers $container }}
    {{- $_ := set .Values "additionalContainers" $additionalContainers -}}
  {{- end -}}
{{- end -}}
