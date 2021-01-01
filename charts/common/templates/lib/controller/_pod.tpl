{{- /*
The pod definition included in the controller.
*/ -}}
{{- define "common.controller.pod" -}}
{{- with .Values.imagePullSecrets }}
imagePullSecrets:
  {{- toYaml . | nindent 2 }}
{{- end }}
serviceAccountName: {{ include "common.names.serviceAccountName" . }}
{{- with .Values.podSecurityContext }}
securityContext:
  {{- toYaml . | nindent 2 }}
{{- end }}
{{- with .Values.hostNetwork }}
hostNetwork: {{ . }}
{{- end }}
{{- with .Values.dnsPolicy }}
dnsPolicy: {{ . }}
{{- end }}
{{- with .Values.dnsConfig }}
dnsConfig:
  {{- toYaml . | nindent 2 }}
{{- end }}
enableServiceLinks: {{ .Values.enableServiceLinks }}
{{- with .Values.initContainers }}
initContainers:
  {{- toYaml . | nindent 2 }}
{{- end }}
containers:
  {{- include "common.controller.mainContainer" . | nindent 0 }}
  {{- with .Values.additionalContainers }}
    {{- toYaml . | nindent 0 }}
  {{- end }}
{{- with (include "common.controller.volumes" . | trim) }}
volumes:
  {{- . | nindent 0 }}
{{- end }}
{{- with .Values.hostAliases }}
hostAliases:
{{- toYaml . | nindent 2 }}
{{- end }}
{{- with .Values.nodeSelector }}
nodeSelector:
  {{- toYaml . | nindent 2 }}
{{- end }}
{{- with .Values.affinity }}
affinity:
  {{- toYaml . | nindent 2 }}
{{- end }}
{{- with .Values.tolerations }}
tolerations:
  {{- toYaml . | nindent 2 }}
{{- end }}
{{- end -}}
