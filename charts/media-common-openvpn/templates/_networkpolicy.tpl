{{/*
The OpenVPN networkpolicy to be inserted
*/}}
{{- define "media-common.openvpn.networkpolicy" -}}
{{- if .Values.openvpn.networkPolicy.enabled -}}
kind: NetworkPolicy
apiVersion: networking.k8s.io/v1
metadata:
  name: {{ template "media-common.fullname" . }}-deny-all-netpol
spec:
  podSelector:
    matchLabels:
      app.kubernetes.io/name: {{ include "media-common.name" . }}
      app.kubernetes.io/instance: {{ .Release.Name }}
  policyTypes:
  - Egress
  egress:
  {{- if .Values.openvpn.networkPolicy.egress }} 
  {{- .Values.openvpn.networkPolicy.egress | toYaml | nindent 4 }}
  {{- end -}}
{{- end -}}
{{- end -}}
