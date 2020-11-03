{{/*
ports shared by Deployment and Statefulset
*/}}
{{- define "media-common.ports" -}}
ports:
- name: {{ .Values.service.port.name }}
  containerPort: {{ .Values.service.port.port }}
  protocol: {{ .Values.service.port.protocol }}
{{- range $port := .Values.service.additionalPorts }}
- name: {{ $port.name }}
  containerPort: {{ $port.port }}
  protocol: {{ $port.protocol }}
{{- end }}
{{- end }}
