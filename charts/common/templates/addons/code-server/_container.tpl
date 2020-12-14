{{/*
The code-server sidecar container to be inserted.
*/}}
{{- define "common.addon.codeserver.container" -}}
name: codeserver
image: "{{ .Values.addons.codeserver.image.repository }}:{{ .Values.addons.codeserver.image.tag }}"
imagePullPolicy: {{ .Values.addons.codeserver.pullPolicy }}
{{- with .Values.addons.codeserver.securityContext }}
securityContext:
  {{- toYaml . | nindent 2 }}
{{- end }}
{{- with .Values.addons.codeserver.env }}
env:
{{- range $k, $v := . }}
  - name: {{ $k }}
    value: {{ $v | quote }}
{{- end }}
{{- end }}
ports:
- name: {{ .Values.addons.codeserver.service.port.name }}
  containerPort: {{ .Values.addons.codeserver.service.port.port }}
  protocol: TCP
args:
- "--port"
- "{{ .Values.addons.codeserver.service.port.port }}"
- "--auth"
- "none"
{{- with .Values.addons.codeserver.workingDir }}
- {{ . }}
{{- end }}
{{- with .Values.addons.codeserver.volumeMounts }}
volumeMounts:
  {{- toYaml . | nindent 2 }}
{{- end }}
{{- with .Values.addons.codeserver.resources }}
resources:
  {{- toYaml . | nindent 2 }}
{{- end }}
{{- end -}}
