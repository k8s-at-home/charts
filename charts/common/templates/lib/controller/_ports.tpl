{{/*
Ports included by the controller.
*/}}
{{- define "common.controller.ports" -}}
  {{- $ports := list -}}
  {{- with .Values.service -}}
    {{- $serviceValues := deepCopy . -}}
    {{/* append the ports for the main service */}}
    {{- if .enabled -}}
      {{- $_ := set .port "name" (default "http" .port.name) -}}
      {{- $ports = mustAppend $ports .port -}}
      {{- range $_ := .additionalPorts -}}
        {{/* append the additonalPorts for the main service */}}
        {{- $ports = mustAppend $ports . -}}
      {{- end }}
    {{- end }}
    {{/* append the ports for each additional service */}}
    {{- range $_ := .additionalServices }}
      {{- if .enabled -}}
        {{- $_ := set .port "name" (required "Missing port.name" .port.name) -}}
        {{- $ports = mustAppend $ports .port -}}
        {{- range $_ := .additionalPorts -}}
          {{/* append the additonalPorts for each additional service */}}
          {{- $ports = mustAppend $ports . -}}
        {{- end }}
      {{- end }}
    {{- end }}
  {{- end }}

{{/* export/render the list of ports */}}
{{- if $ports -}}
ports:
{{- range $_ := $ports }}
- name: {{ .name }}
  {{- if and .targetPort (kindIs "string" .targetPort) }}
  {{- fail (printf "Our charts do not support named ports for targetPort. (port name %s, targetPort %s)" .name .targetPort) }}
  {{- end }}
  containerPort: {{ .targetPort | default .port }}
  protocol: {{ .protocol | default "TCP" }}
{{- end -}}
{{- end -}}
{{- end -}}
