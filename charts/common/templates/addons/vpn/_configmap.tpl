{{/*
The OpenVPN configmaps to be included
*/}}
{{- define "common.addon.vpn.configmap" -}}
{{- if or .Values.addons.vpn.configFile .Values.addons.vpn.scripts.up .Values.addons.vpn.scripts.down }}
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ template "common.names.fullname" . }}-vpn
  labels:
  {{- include "common.labels" . | nindent 4 }}
data:
{{- if .Values.addons.vpn.configFile }}
  vpnConfigfile: |-
    {{- .Values.addons.vpn.configFile | nindent 4}}
{{- end }}
{{- if .Values.addons.vpn.scripts.up }}
  up.sh: |-
    {{- .Values.addons.vpn.scripts.up | nindent 4}}
{{- end }}
{{- if .Values.addons.vpn.scripts.down }}
  down.sh: |-
    {{- .Values.addons.vpn.scripts.down | nindent 4}}
{{- end }}
{{- end -}}
{{- end -}}
