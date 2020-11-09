{{- /* The main containter that will be included in the controller */ -}}
{{- define "common.controller.mainContainer" -}}
- name: {{ template "common.names.fullname" . }}
  image: "{{ .Values.image.repository }}:{{ .Values.image.tag | default .Chart.AppVersion }}"
  imagePullPolicy: {{ .Values.image.pullPolicy }}
  {{- with .Values.securityContext }}
  securityContext:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- if .Values.env }}
  env:
  {{- range $key, $value := .Values.env }}
  - name: {{ $key }}
    value: {{ $value | quote }}
  {{- end }}
  {{- end }}
  ports:
  - name: {{ .Values.service.port.name }}
    containerPort: {{ .Values.service.port.port }}
    protocol: {{ .Values.service.port.protocol }}
  {{- range $port := .Values.service.additionalPorts }}
  - name: {{ $port.name }}
    containerPort: {{ $port.port }}
    protocol: {{ $port.protocol }}
  {{- end }}
  volumeMounts:
  {{- range $index, $PVC := .Values.persistence }}
  {{- if $PVC.enabled }}
  - mountPath: {{ $PVC.mountPath }}
    name: {{ $index }}
  {{- end }}
  {{- end }}
  {{- if .Values.additionalVolumeMounts }}
    {{- toYaml .Values.additionalVolumeMounts | nindent 2 }}
  {{- end }}

  {{- include "common.controller.probes.tcpSocket" . | nindent 2 }}

  {{- with .Values.resources }}
  resources:
    {{- toYaml . | nindent 4 }}
  {{- end }}
{{- end -}}
