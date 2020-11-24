{{/*
Render all the ports and additionalPorts for a Service object.
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
    targetPort: {{ .targetPort | default "http" }}
    protocol: {{ .protocol | default "TCP" }}
    name: {{ .name | default "http" }}
    {{- if (and (eq $.svcType "NodePort") (not (empty .nodePort))) }}
    nodePort: {{ .nodePort }}
    {{ end }}
  {{- end -}}
  {{- end -}}
{{- end }}
