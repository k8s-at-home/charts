{{- define "common.ingress" -}}
  {{- if .Values.ingress.enabled -}}
    {{- $svcPort := .Values.service.port.port -}}

    {{- /* Generate primary ingress */ -}}
    {{- $ingressValues := .Values.ingress -}}
    {{- $_ := set $ingressValues "svcPort" $svcPort -}}
    {{- $_ := set . "ObjectValues" (dict "ingress" $ingressValues) -}}
    {{- include "common.classes.ingress" . }}

    {{- /* Generate additional ingresses as required */ -}}
    {{- range $index, $extraIngress := .Values.ingress.additionalIngresses }}
      {{- if $extraIngress.enabled -}}
        {{- print ("---") | nindent 0 -}}
        {{- $ingressValues := $extraIngress -}}
        {{- $_ := set $ingressValues "svcPort" $svcPort -}}
        {{- if not $ingressValues.nameSuffix -}}
          {{- $_ := set $ingressValues "nameSuffix" $index -}}
        {{ end -}}
        {{- $_ := set $ "ObjectValues" (dict "ingress" $ingressValues) -}}
        {{- include "common.classes.ingress" $ -}}
      {{- end }}
    {{- end }}
  {{- end }}
{{- end }}
