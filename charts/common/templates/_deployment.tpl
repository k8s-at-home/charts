{{- define "common.deployment" -}}
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ template "common.names.fullname" . }}
  labels:
  {{- include "common.labels" . | nindent 4 }}
spec:
  replicas: 1
  selector:
    matchLabels:
    {{- include "common.labels.selectorLabels" . | nindent 6 }}
  template:
    metadata:
      {{- with .Values.podAnnotations }}
      annotations:
      {{- toYaml . | nindent 8 }}
      {{- end }}
      labels:
      {{- include "common.labels.selectorLabels" . | nindent 8 }}
    spec:
      {{- with .Values.imagePullSecrets }}
      imagePullSecrets:
      {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with .Values.podSecurityContext }}
      securityContext:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- if .Values.initContainers }}
      initContainers:
        {{- toYaml .Values.initContainers | nindent 8 }}
      {{- end }}
      containers:
      {{- include "common.controller.mainContainer" . | nindent 6 }}
      {{- if .Values.additionalContainers }}
        {{ toYaml .Values.additionalContainers | nindent 6 }}
      {{- end }}

      volumes:
      {{- include "common.controller.volumes" . | nindent 6 }}

      {{- with .Values.nodeSelector }}
      nodeSelector:
      {{ toYaml . | indent 8 }}
      {{- end }}
      {{- with .Values.affinity }}
      affinity:
      {{ toYaml . | indent 8 }}
      {{- end }}
      {{- with .Values.tolerations }}
      tolerations:
      {{ toYaml . | indent 8 }}
      {{- end }}
{{- end }}
