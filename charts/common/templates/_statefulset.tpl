{{- define "common.statefulset" -}}
apiVersion: {{ include "common.capabilities.statefulset.apiVersion" . }}
kind: StatefulSet
metadata:
  name: {{ template "common.names.fullname" . }}
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
  replicas: 1
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
      {{- with .Values.imagePullSecrets }}
      imagePullSecrets:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with .Values.podSecurityContext }}
      securityContext:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with .Values.initContainers }}
      initContainers:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      containers:
      {{- include "common.controller.mainContainer" . | nindent 6 }}
      {{- with .Values.additionalContainers }}
        {{- toYaml . | nindent 6 }}
      {{- end }}

      volumes:
      {{- include "common.controller.volumes" . | trim | nindent 6 }}

      {{- with .Values.nodeSelector }}
      nodeSelector:
        {{- toYaml . | indent 8 }}
      {{- end }}
      {{- with .Values.affinity }}
      affinity:
        {{- toYaml . | indent 8 }}
      {{- end }}
      {{- with .Values.tolerations }}
      tolerations:
        {{- toYaml . | indent 8 }}
      {{- end }}
{{- end }}
