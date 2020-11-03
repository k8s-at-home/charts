{{/*
volumeMounts shared by Deployment and Statefulset
*/}}
{{- define "media-common.volumeMounts" -}}
volumeMounts:
- mountPath: {{ .Values.configPath }}
  name: config
  {{- if .Values.persistence.config.subPath }}
  subPath: {{ .Values.persistence.config.subPath }}
  {{- end }}
{{- if .Values.persistence.media.enabled }}
- mountPath: /media
  name: media
  {{- if .Values.persistence.media.subPath }}
  subPath: {{ .Values.persistence.media.subPath }}
  {{- end }}
{{- end }}
{{- if .Values.persistence.shared.enabled }}
- mountPath: {{ .Values.persistence.shared.mountPath }}
  name: shared
{{- end }}
{{- if .Values.additionalVolumeMounts }}
{{- toYaml .Values.additionalVolumeMounts | nindent 0 }}
{{- end }}
{{- end }}
