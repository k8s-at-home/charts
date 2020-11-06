{{/*
volumes included by the controller
*/}}
{{- define "common.controller.volumes" -}}
{{/* Store the context to refer in later scope */}}
{{- $context := . -}}
{{/* Determine the PVC name */}}
{{- range $index, $PVC := .Values.persistence }}
{{- if $PVC.enabled }}

{{- $claimName := "" -}}
{{- if $PVC.existingClaim -}}
  {{- $claimName = $PVC.existingClaim -}}
{{- else }}
  {{- if $PVC.nameSuffix -}}
    {{- $claimName = printf "%s-%s" (include "common.names.fullname" $context) $PVC.nameSuffix -}}
  {{- else }}
    {{- $claimName = printf "%s-%s" (include "common.names.fullname" $context) $index -}}
  {{- end -}}
{{- end -}}
- name: {{ $index }}
  {{- if not $PVC.emptyDir }}
  persistentVolumeClaim:
    claimName: {{ $claimName }}
  {{- else }}
  emptyDir: {}
  {{- end }}
{{ end }}
{{- end }}
{{- if .Values.additionalVolumes }}
  {{- toYaml .Values.additionalVolumes | nindent 0 }}
{{- end }}
{{- end }}
