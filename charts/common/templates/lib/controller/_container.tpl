{{- /*
The main container included in the controller.
*/ -}}
{{- define "common.controller.mainContainer" -}}
- name: {{ include "common.names.fullname" . }}
  image: "{{ .Values.image.repository }}:{{ .Values.image.tag | default .Chart.AppVersion }}"
  imagePullPolicy: {{ .Values.image.pullPolicy }}
  {{- with .Values.command }}
  command: {{ . }}
  {{- end }}
  {{- with .Values.args }}
  args: {{ . }}
  {{- end }}
  {{- with .Values.securityContext }}
  securityContext:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- if or .Values.env .Values.envTpl .Values.envValueFrom }}
  env:
  {{- range $key, $value := .Values.env }}
  - name: {{ $key }}
    value: {{ $value | quote }}
  {{- end }}
  {{- range $key, $value := .Values.envTpl }}
  - name: {{ $key }}
    value: {{ tpl $value $ | quote }}
  {{- end }}
  {{- range $key, $value := .Values.envValueFrom }}
  - name: {{ $key }}
    valueFrom:
      {{- $value | toYaml | nindent 6 }}
  {{- end }}
  {{- end }}
  {{- if or .Values.envFrom .Values.secret }}
  envFrom:
  {{- with .Values.envFrom }}
    {{- toYaml . | nindent 2 }}
  {{- end }}
  {{- if or .Values.secret }}
  - secretRef:
      name: {{ include "common.names.fullname" . }}
  {{- end }}
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
  {{- if eq .Values.controllerType "statefulset"  }}
  {{- range $index, $vct := .Values.volumeClaimTemplates }}
  - mountPath: {{ $vct.mountPath }}
    name: {{ $vct.name }}
  {{- if $vct.subPath }}
    subPath: {{ $vct.subPath }}
  {{- end }}
  {{- end }}
  {{- end }}
  {{- include "common.controller.probes" . | nindent 2 }}
  {{- with .Values.resources }}
  resources:
    {{- toYaml . | nindent 4 }}
  {{- end }}
{{- end -}}
