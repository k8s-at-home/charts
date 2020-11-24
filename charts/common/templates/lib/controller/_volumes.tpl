{{/*
Volumes included by the controller.
*/}}
{{- define "common.controller.volumes" -}}
{{- range $index, $persistence := .Values.persistence }}
{{- if $persistence.enabled }}
- name: {{ $index }}
{{- if $persistence.existingClaim }}
{{- /* Always prefer an existingClaim if that is set */}}
  persistentVolumeClaim:
    claimName: {{ $persistence.existingClaim }}
{{- else -}}
  {{- if $persistence.emptyDir -}}
  {{- /* Always prefer an emptyDir next if that is set */}}
  emptyDir: {}
  {{- else -}}
  {{- /* Otherwise refer to the PVC name */}}
  persistentVolumeClaim:
    {{- if $persistence.nameSuffix }}
    claimName: {{ printf "%s-%s" (include "common.names.fullname" $) $persistence.nameSuffix }}
    {{- else }}
    claimName: {{ printf "%s-%s" (include "common.names.fullname" $) $index }}
    {{- end }}
  {{- end }}
{{- end }}
{{- end }}
{{- end }}
{{- if .Values.additionalVolumes }}
  {{- toYaml .Values.additionalVolumes | nindent 0 }}
{{- end }}
{{- end -}}
