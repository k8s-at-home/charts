{{/*
The VPN config and scripts to be included.
*/}}
{{- define "common.addon.vpn.configmap" -}}
{{- if or .Values.addons.vpn.configFile .Values.addons.vpn.scripts.up .Values.addons.vpn.scripts.down }}
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ include "common.names.fullname" . }}-vpn
  labels:
  {{- include "common.labels" . | nindent 4 }}
data:
{{- with .Values.addons.vpn.configFile }}
  vpnConfigfile: |-
    {{- . | nindent 4}}
{{- end }}
{{- with .Values.addons.vpn.scripts.up }}
  up.sh: |-
    {{- . | nindent 4}}
{{- end }}
{{- with .Values.addons.vpn.scripts.down }}
  down.sh: |-
    {{- . | nindent 4}}
{{- end }}
{{- end -}}
{{- end -}}
