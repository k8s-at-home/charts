{{/*
The OpenVPN configmaps to be included
*/}}
{{- define "media-common.addon.vpn.configmap" -}}
{{- if or .Values.addons.vpn.configFile .Values.addons.vpn.scripts.up .Values.addons.vpn.scripts.down }}
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ template "k8s-at-home.fullname" . }}-vpn
  labels:
  {{- include "k8s-at-home.labels" . | nindent 4 }}
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