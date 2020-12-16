{{/*
This template serves as the blueprint for the DaemonSet objects that are created 
within the common library.
*/}}
{{- define "common.daemonset" -}}
apiVersion: {{ include "common.capabilities.daemonset.apiVersion" . }}
kind: DaemonSet
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
      {{- include "common.controller.pod" . | nindent 6 }}
{{- end }}
