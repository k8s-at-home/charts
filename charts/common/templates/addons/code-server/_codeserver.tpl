{{/*
Template to render code-server addon
It will include / inject the required templates based on the given values.
*/}}
{{- define "common.addon.codeserver" -}}
{{- if .Values.addons.codeserver.enabled -}}
  {{/* Append the code-server container to the additionalContainers */}}
  {{- $container := include "common.addon.codeserver.container" . | fromYaml -}}
  {{- if $container -}}
    {{- $additionalContainers := append .Values.additionalContainers $container -}}
    {{- $_ := set .Values "additionalContainers" $additionalContainers -}}
  {{- end -}}

  {{/* Add the code-server service */}}
  {{- if .Values.addons.codeserver.service.enabled -}}
    {{- print ("---") | nindent 0 -}}
    {{- $serviceValues := .Values.addons.codeserver.service -}}
    {{- if not $serviceValues.nameSuffix -}}
        {{- $_ := set $serviceValues "nameSuffix" "codeserver" -}}
    {{ end -}}
    {{- $_ := set $ "ObjectValues" (dict "service" $serviceValues) -}}
    {{- include "common.classes.service" $ -}}
    {{- $_ := unset $ "ObjectValues" -}}
  {{- end -}}

  {{/* Add the code-server ingress */}}
  {{- if .Values.addons.codeserver.ingress.enabled -}}
    {{- print ("---") | nindent 0 -}}
    {{- $ingressValues := .Values.addons.codeserver.ingress -}}
    {{- if not $ingressValues.nameSuffix -}}
        {{- $_ := set $ingressValues "nameSuffix" "codeserver" -}}
    {{ end -}}

    {{/* Determine the target service name & port */}}
    {{- $svcName := printf "%v-%v" (include "common.names.fullname" .) .Values.addons.codeserver.service.nameSuffix -}}
    {{- $_ := set $ingressValues "serviceName" $svcName -}}
    {{- $_ := set $ingressValues "servicePort" .Values.addons.codeserver.service.port.port -}}

    {{- $_ := set $ "ObjectValues" (dict "ingress" $ingressValues) -}}
    {{- include "common.classes.ingress" $ -}}
    {{- $_ := unset $ "ObjectValues" -}}
  {{- end -}}
{{- end -}}
{{- end -}}
