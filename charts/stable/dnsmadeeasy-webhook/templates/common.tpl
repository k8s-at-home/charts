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


{{/* Append the hardcoded settings */}}
{{- define "dnsmadeeasy-webhook.harcodedValues" -}}

# -- Configure persistence settings for the chart under this key.
persistence:
  certs:
    enabled: true
    type: custom
    mountPath: /tls
    readOnly: true
    volumeSpec:
      name: certs
      secret:
        secretName: {{ include "dnsmadeeasy-webhook.servingCertificate" . }}

probes:
  liveness:
    enabled: true
    custom: true
    spec:
      httpGet:
        scheme: HTTPS
        path: /healthz
        port: https
  readiness:
    enabled: true
    custom: true
    spec:
      httpGet:
        scheme: HTTPS
        path: /healthz
        port: https
  startup:
    enabled: true
    custom: true
    spec:
      httpGet:
        scheme: HTTPS
        path: /healthz
        port: https

service:
  main:
    ports:
      https:
        targetPort: 4443
        port: 443

args:
- --tls-cert-file=/tls/tls.crt
- --tls-private-key-file=/tls/tls.key
- --secure-port=4443

env:
  GROUP_NAME: {{ .Values.groupName }}

{{- end -}}
{{- $_ := mergeOverwrite .Values (include "dnsmadeeasy-webhook.harcodedValues" . | fromYaml) -}}


{{/* Render the templates */}}
{{ include "common.all" . }}
