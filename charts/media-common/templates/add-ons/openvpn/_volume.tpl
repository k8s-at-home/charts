{{/*
The OpenVPN volumes to be inserted
*/}}
{{- define "media-common.openvpn.volume" -}}
{{- if or .Values.openvpn.vpnConf .Values.openvpn.scripts.up .Values.openvpn.scripts.down -}}
- name: openvpnconf
  configMap:
    name: {{ template "media-common.fullname" . }}-openvpn
    items:
      {{- if .Values.openvpn.vpnConf }}
      - key: vpnConf
        path: vpnConf
      {{- end }}
      {{- if .Values.openvpn.scripts.up }}
      - key: up.sh
        path: up.sh
        mode: 0777
      {{- end }}
      {{- if .Values.openvpn.scripts.down }}
      - key: down.sh
        path: down.sh
        mode: 0777
      {{- end }}
{{- end -}}
{{- end -}}
