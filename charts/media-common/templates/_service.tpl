{{- define "media-common.service" -}}
  {{- /* Generate service */ -}}
  {{- $_ := set . "ObjectValues" (dict "service" .Values.service) -}}
  {{- include "k8s-at-home.service" . }}
{{- end }}
