{{/*
The OpenVPN secrets to be included
*/}}
{{- define "common.addon.openvpn.secret" -}}
{{- with .Values.addons.vpn.openvpn.auth -}}
apiVersion: v1
kind: Secret
metadata:
  name: {{ template "common.names.fullname" $ }}-openvpn
  labels:
  {{- include "common.labels" $ | nindent 4 }}
data:
  VPN_AUTH: {{ . | b64enc }}
{{- end -}}
{{- end -}}
