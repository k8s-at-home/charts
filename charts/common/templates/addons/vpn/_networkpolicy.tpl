{{/*
Blueprint for the NetworkPolicy object that can be included in the addon.
*/}}
{{- define "common.addon.vpn.networkpolicy" -}}
{{- if .Values.addons.vpn.networkPolicy.enabled -}}
kind: NetworkPolicy
apiVersion: networking.k8s.io/v1
metadata:
  name: {{ include "common.names.fullname" . }}
spec:
  podSelector:
    matchLabels:
    {{- include "common.labels.selectorLabels" . | nindent 6 }}
  policyTypes:
    - Egress
  egress:
  {{- with .Values.addons.vpn.networkPolicy.egress }} 
    {{- . | toYaml | nindent 4 }}
  {{- end -}}
{{- end -}}
{{- end -}}
