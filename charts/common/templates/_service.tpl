{{- define "common.service" -}}
  {{- if .Values.service.enabled -}}
    {{- include "common.classes.service" . }}
  {{- end }}
{{- end }}
