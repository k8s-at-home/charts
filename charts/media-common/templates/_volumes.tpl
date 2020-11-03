{{/*
volumes shared by Deployment and Statefulset
*/}}
{{- define "media-common.volumes" -}}
volumes:
- name: config
  {{- if .Values.persistence.config.enabled }}
  persistentVolumeClaim:
    claimName: {{ if .Values.persistence.config.existingClaim }}{{ .Values.persistence.config.existingClaim }}{{- else }}{{ template "k8s-at-home.fullname" . }}{{- end }}
  {{- else }}
  emptyDir: {}
  {{- end }}
{{- if .Values.persistence.media.enabled }}
- name: media
  persistentVolumeClaim:
    claimName: {{ if .Values.persistence.media.existingClaim }}{{ .Values.persistence.media.existingClaim }}{{- else }}{{ template "k8s-at-home.fullname" . }}-media{{- end }}
{{- end }}
{{- if .Values.persistence.shared.enabled }}
- name: shared
  emptyDir: {}
{{- end }}
{{- if .Values.additionalVolumes }}
{{- toYaml .Values.additionalVolumes | nindent 0 }}
{{- end }}
{{- end }}
