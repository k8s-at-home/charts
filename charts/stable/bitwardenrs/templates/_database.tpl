{{/* vim: set filetype=mustache: */}}
{{/*
Generate environment variables for external database
*/}}
{{- define "bitwardenrs.externalDatabaseConfigMap" -}}
{{- with .Values.bitwardenrs.externalDatabase }}
{{- if and .enabled (or (eq .type "postgresql") (eq .type "mysql")) }}
{{- if and (not .existingSecret.enabled) .user }}
DATABASE_USER: {{ .user | quote }}
{{- end }}
{{- if and (not .existingSecret.enabled) .password }}
DATABASE_PASSWORD: {{ .password | quote }}
{{- end }}
{{- end }}
{{- end }}
{{- end }}

{{- define "bitwardenrs.externalDatabaseEnv" -}}
{{- with .Values.bitwardenrs.externalDatabase }}
{{- if and .enabled (or (eq .type "postgresql") (eq .type "mysql")) }}
{{- if .existingSecret.enabled }}
- name: DATABASE_USER
  valueFrom:
    secretKeyRef:
      name: {{ .existingSecret.name | quote }}
      key: {{ .existingSecret.userKey | quote }}
- name: DATABASE_PASSWORD
  valueFrom:
    secretKeyRef:
      name: {{ .existingSecret.name | quote }}
      key: {{ .existingSecret.passwordKey | quote }}
{{- end }}
{{- $dbport := not (empty .port) | ternary (printf ":%v" .port) "" }}
- name: DATABASE_URL
  value: {{ printf "%v://$(DATABASE_USER):$(DATABASE_PASSWORD)@%v%v/%v" .type .host $dbport .database }}
{{- end }}
{{- end }}
{{- end }}
