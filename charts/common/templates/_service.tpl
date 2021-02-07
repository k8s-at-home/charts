{{/*
Renders the Service objects required by the chart by returning a concatinated list
of the main Service and any additionalServices.
*/}}
{{- define "common.service" -}}
  {{- if .Values.service.enabled -}}
    {{- /* Generate primary service */ -}}
    {{- include "common.classes.service" . }}

    {{- /* Generate additional services as required */ -}}
    {{- range $index, $extraService := .Values.service.additionalServices }}
      {{- if $extraService.enabled -}}
        {{- print ("---") | nindent 0 -}}
        {{- $serviceValues := $extraService -}}
        {{- if not $serviceValues.nameSuffix -}}
          {{- $_ := set $serviceValues "nameSuffix" $index -}}
        {{ end -}}
        {{- $_ := set $ "ObjectValues" (dict "service" $serviceValues) -}}
        {{- include "common.classes.service" $ -}}
      {{- end }}
    {{- end }}
  {{- end }}
{{- end }}
