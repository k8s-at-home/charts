{{/*
The OpenVPN secrets to be inserted
*/}}
{{- define "media-common.openvpn.secret" -}}
{{- if .Values.openvpn.auth -}}
apiVersion: v1
kind: Secret
metadata:
  name: {{ template "media-common.fullname" . }}-openvpn
  labels:
  {{- include "media-common.labels" . | nindent 4 }}
data:
  VPN_AUTH: {{ .Values.openvpn.auth | b64enc }}
{{- end -}}
{{- end -}}
