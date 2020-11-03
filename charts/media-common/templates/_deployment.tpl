{{- define "media-common.deployment" -}}
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ template "k8s-at-home.fullname" . }}
  labels:
  {{- include "k8s-at-home.labels" . | nindent 4 }}
spec:
  replicas: 1
  selector:
    matchLabels:
    {{- include "k8s-at-home.selectorLabels" . | nindent 6 }}
  template:
    metadata:
      {{- with .Values.podAnnotations }}
      annotations:
      {{- toYaml . | nindent 8 }}
      {{- end }}
      labels:
      {{- include "k8s-at-home.selectorLabels" . | nindent 8 }}
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
      - name: {{ template "k8s-at-home.fullname" . }}
        {{- with .Values.securityContext }}
        securityContext:
          {{- toYaml . | nindent 8 }}
        {{- end }}
        image: "{{ .Values.image.organization }}/{{ .Values.image.repository }}:{{ .Values.image.tag | default .Chart.AppVersion }}"
        imagePullPolicy: {{ .Values.image.pullPolicy }}
        {{- if .Values.env }}
        env:
          {{- range $key, $value := .Values.env }}
          - name: {{ $key }}
            value: {{ $value | quote }}
          {{- end }}
        {{- end }}
        {{- include "media-common.ports" . | nindent 8 }}
        {{- include "media-common.volumeMounts" . | nindent 8 }}
        {{- include "k8s-at-home.probes.tcpSocket" . | nindent 8 }}
        {{- with .Values.resources }}
        resources:
          {{- toYaml . | nindent 12 }}
        {{- end }}

      {{- if .Values.additionalContainers }}
        {{ toYaml .Values.additionalContainers | nindent 6 }}
      {{ end }}

      {{ include "media-common.volumes" . | nindent 6 }}

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
