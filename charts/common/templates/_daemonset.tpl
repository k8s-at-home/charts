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
      {{- with .Values.imagePullSecrets }}
      imagePullSecrets:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      serviceAccountName: {{ include "common.names.serviceAccountName" . }}
      {{- with .Values.podSecurityContext }}
      securityContext:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with .Values.hostNetwork }}
      hostNetwork: {{ . }}
      {{- end }}
      {{- with .Values.dnsPolicy }}
      dnsPolicy: {{ . }}
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
      {{- with (include "common.controller.volumes" . | trim) }}
      volumes:
        {{- . | nindent 6 }}
      {{- end }}
      {{- with .Values.hostAliases }}
      hostAliases:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with .Values.nodeSelector }}
      nodeSelector:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with .Values.affinity }}
      affinity:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with .Values.tolerations }}
      tolerations:
        {{- toYaml . | nindent 8 }}
      {{- end }}
{{- end }}
