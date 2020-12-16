{{/*
This template serves as the blueprint for the StatefulSet objects that are created 
within the common library.
*/}}
{{- define "common.statefulset" -}}
apiVersion: {{ include "common.capabilities.statefulset.apiVersion" . }}
kind: StatefulSet
metadata:
  name: {{ include "common.names.fullname" . }}
  labels:
  {{- include "common.labels" . | nindent 4 }}
  {{- with .Values.controllerLabels }}
  {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.controllerAnnotations }}
  annotations:
  {{- toYaml . | nindent 4 }}
  {{- end }}
spec:
  replicas: {{ .Values.replicas }}
  {{- with .Values.strategy }}
  updateStrategy:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  selector:
    matchLabels:
    {{- include "common.labels.selectorLabels" . | nindent 6 }}
  serviceName: {{ include "common.names.fullname" . }}
  template:
    metadata:
      {{- with .Values.podAnnotations }}
      annotations:
      {{- toYaml . | nindent 8 }}
      {{- end }}
      labels:
      {{- include "common.labels.selectorLabels" . | nindent 8 }}
    spec:
      {{- include "common.controller.pod" . | nindent 6 }}
{{- end }}
