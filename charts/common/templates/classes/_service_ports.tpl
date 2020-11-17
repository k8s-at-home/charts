{{/*
logic that lists the ports and additionalPorts for a service
*/}}
{{- define "common.classes.service.ports" -}}
  {{- $ports := list -}}
  {{- $values := .values -}}
  {{- $ports = mustAppend $ports $values.port -}}
  {{- range $_ := $values.additionalPorts -}}
    {{- $ports = mustAppend $ports . -}}
  {{- end }}
  {{- if $ports -}}
  ports:
  {{- range $_ := $ports }}
  - port: {{ .port }}
    targetPort: {{ .targetPort | default .name }}
    protocol: {{ .protocol | default "TCP" }}
    name: {{ .name }}
    {{- if (and (eq $.svcType "NodePort") (not (empty .nodePort))) }}
    nodePort: {{ .nodePort }}
    {{ end }}
  {{- end -}}
  {{- end -}}
{{- end }}
