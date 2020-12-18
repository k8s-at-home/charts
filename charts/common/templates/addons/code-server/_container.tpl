{{/*
The code-server sidecar container to be inserted.
*/}}
{{- define "common.addon.codeserver.container" -}}
{{- if lt (len .Values.addons.codeserver.volumeMounts) 1 }}
{{- fail "At least 1 volumeMount is required for codeserver container" }}
{{- end -}}
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
{{- range .Values.addons.codeserver.args }}
- {{ . | quote }}
{{- end }}
- "--port"
- "{{ .Values.addons.codeserver.service.port.port }}"
- {{ .Values.addons.codeserver.workingDir | default (first .Values.addons.codeserver.volumeMounts).mountPath }}
{{- with .Values.addons.codeserver.volumeMounts }}
volumeMounts:
  {{- toYaml . | nindent 2 }}
{{- end }}
{{- with .Values.addons.codeserver.resources }}
resources:
  {{- toYaml . | nindent 2 }}
{{- end }}
{{- end -}}
