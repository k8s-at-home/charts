{{/*
The OpenVPN networkpolicy to be included
*/}}
{{- define "common.addon.vpn.networkpolicy" -}}
{{- if .Values.addons.vpn.networkPolicy.enabled -}}
kind: NetworkPolicy
apiVersion: networking.k8s.io/v1
metadata:
  name: {{ template "common.names.fullname" . }}
spec:
  podSelector:
    matchLabels:
    {{- include "common.labels.selectorLabels" . | nindent 6 }}
  policyTypes:
    - Egress
  egress:
  {{- if .Values.addons.vpn.networkPolicy.egress }} 
    {{- .Values.addons.vpn.networkPolicy.egress | toYaml | nindent 4 }}
  {{- end -}}
{{- end -}}
{{- end -}}
