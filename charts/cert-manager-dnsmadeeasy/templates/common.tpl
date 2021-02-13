{{/* Make sure all variables are set properly */}}
{{- include "common.values.setup" . }}

{{- define "cert-manager-dnsmadeeasy.selfSignedIssuer" -}}
{{ printf "%s-selfsign" (include "common.names.fullname" .) }}
{{- end -}}

{{- define "cert-manager-dnsmadeeasy.rootCAIssuer" -}}
{{ printf "%s-ca" (include "common.names.fullname" .) }}
{{- end -}}

{{- define "cert-manager-dnsmadeeasy.rootCACertificate" -}}
{{ printf "%s-ca" (include "common.names.fullname" .) }}
{{- end -}}

{{- define "cert-manager-dnsmadeeasy.servingCertificate" -}}
{{ printf "%s-webhook-tls" (include "common.names.fullname" .) }}
{{- end -}}


{{- $_ := set .Values.env "GROUP_NAME" .Values.groupName -}}


{{/* Append the cert secret to the additionalVolumes */}}
{{- define "cert-manager-dnsmadeeasy.servingCertificate.volume" -}}
name: certs
secret:
  secretName: {{ include "cert-manager-dnsmadeeasy.servingCertificate" . }}
{{- end -}}

{{- $volume := include "cert-manager-dnsmadeeasy.servingCertificate.volume" . | fromYaml -}}
{{- if $volume -}}
  {{- $additionalVolumes := append .Values.additionalVolumes $volume }}
  {{- $_ := set .Values "additionalVolumes" (deepCopy $additionalVolumes) -}}
{{- end -}}


{{/* Render the templates */}}
{{ include "common.all" . }}
