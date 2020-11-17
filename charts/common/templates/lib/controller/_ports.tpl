{{/*
ports included by the controller
*/}}
{{- define "common.controller.ports" -}}
  {{- $ports := list -}}
  {{- with .Values.service -}}
    {{- $serviceValues := deepCopy . -}}
    {{/* append the ports for the main service */}}
    {{- if .enabled -}}
      {{- $ports = mustAppend $ports .port -}}
      {{- range $_ := .additionalPorts -}}
        {{/* append the additonalPorts for the main service */}}
        {{- $ports = mustAppend $ports . -}}
      {{- end }}
    {{- end }}
    {{/* append the ports for each additional service */}}
    {{- range $_ := .additionalServices }}
      {{- if .enabled -}}
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
  - name: {{ required "Missing port.name" .name }}
    containerPort: {{ required "Missing port.port" .port }}
    protocol: {{ .protocol | default "TCP" }}
  {{- end -}}
  {{- end -}}
{{- end -}}
