{{/*
The OpenVPN secrets to be included
*/}}
{{- define "media-common.addon.openvpn.secret" -}}
{{- if .Values.addons.vpn.openvpn.auth -}}
apiVersion: v1
kind: Secret
metadata:
  name: {{ template "k8s-at-home.fullname" . }}-openvpn
  labels:
  {{- include "k8s-at-home.labels" . | nindent 4 }}
data:
  VPN_AUTH: {{ .Values.addons.vpn.openvpn.auth | b64enc }}
{{- end -}}
{{- end -}}
