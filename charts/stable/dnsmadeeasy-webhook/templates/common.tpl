{{/* Make sure all variables are set properly */}}
{{- include "common.values.setup" . }}

{{- define "dnsmadeeasy-webhook.selfSignedIssuer" -}}
{{ printf "%s-selfsign" (include "common.names.fullname" .) }}
{{- end -}}

{{- define "dnsmadeeasy-webhook.rootCAIssuer" -}}
{{ printf "%s-ca" (include "common.names.fullname" .) }}
{{- end -}}

{{- define "dnsmadeeasy-webhook.rootCACertificate" -}}
{{ printf "%s-ca" (include "common.names.fullname" .) }}
{{- end -}}

{{- define "dnsmadeeasy-webhook.servingCertificate" -}}
{{ printf "%s-webhook-tls" (include "common.names.fullname" .) }}
{{- end -}}


{{- $_ := set .Values.env "GROUP_NAME" .Values.groupName -}}


{{/* Append the cert secret to the additionalVolumes */}}
{{- define "dnsmadeeasy-webhook.servingCertificate.volume" -}}
name: certs
secret:
  secretName: {{ include "dnsmadeeasy-webhook.servingCertificate" . }}
{{- end -}}

{{- $volume := include "dnsmadeeasy-webhook.servingCertificate.volume" . | fromYaml -}}
{{- if $volume -}}
  {{- $additionalVolumes := append .Values.additionalVolumes $volume }}
  {{- $_ := set .Values "additionalVolumes" (deepCopy $additionalVolumes) -}}
{{- end -}}


{{/* Render the templates */}}
{{ include "common.all" . }}
