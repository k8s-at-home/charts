{{- /*
The main container included in the controller.
*/ -}}
{{- define "common.controller.mainContainer" -}}
- name: {{ include "common.names.fullname" . }}
  image: "{{ .Values.image.repository }}:{{ .Values.image.tag | default .Chart.AppVersion }}"
  imagePullPolicy: {{ .Values.image.pullPolicy }}
  {{- with .Values.args }}
  args: {{ . }}
  {{- end }}
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
  {{- with .Values.envFrom }}
  envFrom:
    {{- toYaml . | nindent 12 }}
  {{- end }}
  {{- include "common.controller.ports" . | trim | nindent 2 }}
  volumeMounts:
  {{- range $index, $PVC := .Values.persistence }}
  {{- if $PVC.enabled }}
  - mountPath: {{ $PVC.mountPath }}
    name: {{ $index }}
  {{- if $PVC.subPath }}
    subPath: {{ $PVC.subPath }}
  {{- end }}
  {{- end }}
  {{- end }}
  {{- if .Values.additionalVolumeMounts }}
    {{- toYaml .Values.additionalVolumeMounts | nindent 2 }}
  {{- end }}
  {{- include "common.controller.probes" . | nindent 2 }}
  {{- with .Values.resources }}
  resources:
    {{- toYaml . | nindent 4 }}
  {{- end }}
{{- end -}}
