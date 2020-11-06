{{/*
The OpenVPN shared volume to be inserted
*/}}
{{- define "common.addon.vpn.volume" -}}
{{- if or .Values.addons.vpn.vpnConf .Values.addons.vpn.scripts.up .Values.addons.vpn.scripts.down -}}
name: vpnconfig
configMap:
  name: {{ template "common.names.fullname" . }}-vpn
  items:
    {{- if .Values.addons.vpn.vpnConf }}
    - key: vpnConfigfile
      path: vpnConfigfile
    {{- end }}
    {{- if .Values.addons.vpn.scripts.up }}
    - key: up.sh
      path: up.sh
      mode: 0777
    {{- end }}
    {{- if .Values.addons.vpn.scripts.down }}
    - key: down.sh
      path: down.sh
      mode: 0777
    {{- end }}
{{- end -}}
{{- end -}}
