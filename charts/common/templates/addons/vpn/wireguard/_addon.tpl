{{/*
Template to render Wireguard addon. It will add the container to the list of additionalContainers.
*/}}
*/}}
{{- define "common.addon.wireguard" -}}
  {{/* Append the Wireguard container to the additionalContainers */}}
  {{- $container := fromYaml (include "common.addon.wireguard.container" .) -}}
  {{- if $container -}}
    {{- $additionalContainers := append .Values.additionalContainers $container -}}
    {{- $_ := set .Values "additionalContainers" $additionalContainers -}}
  {{- end -}}
{{- end -}}
