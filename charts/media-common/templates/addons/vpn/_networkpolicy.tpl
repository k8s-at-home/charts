{{/*
The OpenVPN networkpolicy to be included
*/}}
{{- define "media-common.addon.vpn.networkpolicy" -}}
{{- if .Values.addons.vpn.networkPolicy.enabled -}}
kind: NetworkPolicy
apiVersion: networking.k8s.io/v1
metadata:
  name: {{ template "k8s-at-home.fullname" . }}
spec:
  podSelector:
    matchLabels:
    {{- include "k8s-at-home.selectorLabels" . | nindent 6 }}
  policyTypes:
    - Egress
  egress:
  {{- if .Values.addons.vpn.networkPolicy.egress }} 
    {{- .Values.addons.vpn.networkPolicy.egress | toYaml | nindent 4 }}
  {{- end -}}
{{- end -}}
{{- end -}}
