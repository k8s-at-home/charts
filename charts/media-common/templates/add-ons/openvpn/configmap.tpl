{{- define "media-common.openvpn.configmap" -}}
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ template "media-common.fullname" . }}-openvpn
  labels:
  {{- include "media-common.labels" . | nindent 4 }}
data:
{{- if .Values.openvpn.vpnConf }}
  vpnConf: |-
    {{- .Values.openvpn.vpnConf | nindent 4}}
{{- end }}
{{ if .Values.openvpn.scripts.up }}
  up.sh: |-
    {{- .Values.openvpn.scripts.up | nindent 4}}
{{- end }}
{{- if .Values.openvpn.scripts.down }}
  down.sh: |-
    {{- .Values.openvpn.scripts.down | nindent 4}}
{{- end }}
{{- end -}}
