{{/*
service class: all services should adhere to this
*/}}
{{- define "common.classes.service" -}}
{{- $values := .Values.service -}}
{{- if hasKey . "ObjectValues" -}}
  {{- with .ObjectValues.service -}}
    {{- $values = . -}}
  {{- end -}}
{{ end -}}
{{- $serviceName := include "common.names.fullname" . -}}
{{- if hasKey $values "nameSuffix" -}}
  {{- $serviceName = printf "%v-%v" $serviceName $values.nameSuffix -}}
{{ end -}}
{{- $svcType := $values.type | default "" -}}
apiVersion: v1
kind: Service
metadata:
  name: {{ $serviceName }}
  labels:
    {{- include "common.labels" . | nindent 4 }}
  {{- if $values.labels }}
    {{ toYaml $values.labels | nindent 4 }}
  {{- end }}
  {{- with $values.annotations }}
  annotations:
    {{ toYaml . | nindent 4 }}
  {{- end }}
spec:
  {{- if (or (eq $svcType "ClusterIP") (empty $svcType)) }}
  type: ClusterIP
  {{- if $values.clusterIP }}
  clusterIP: {{ $values.clusterIP }}
  {{end}}
  {{- else if eq $svcType "LoadBalancer" }}
  type: {{ $svcType }}
  {{- if $values.loadBalancerIP }}
  loadBalancerIP: {{ $values.loadBalancerIP }}
  {{- end }}
  {{- if $values.externalTrafficPolicy }}
  externalTrafficPolicy: {{ $values.externalTrafficPolicy }}
  {{- end }}
  {{- if $values.loadBalancerSourceRanges }}
  loadBalancerSourceRanges:
    {{ toYaml $values.loadBalancerSourceRanges | nindent 4 }}
  {{- end -}}
  {{- else }}
  type: {{ $svcType }}
  {{- end }}
  {{- if $values.sessionAffinity }}
  sessionAffinity: {{ $values.sessionAffinity }}
  {{- if $values.sessionAffinityConfig }}
  sessionAffinityConfig:
    {{ toYaml $values.sessionAffinityConfig | nindent 4 }}
  {{- end -}}
  {{- end }}
  {{- with $values.externalIPs }}
  externalIPs:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- if $values.publishNotReadyAddresses }}
  publishNotReadyAddresses: {{ $values.publishNotReadyAddresses }}
  {{- end }}
  {{- include "common.classes.service.ports" (dict "svcType" $svcType "values" $values ) | trim | nindent 2 }}
  selector:
    {{- include "common.labels.selectorLabels" . | nindent 4 }}
{{- end }}

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