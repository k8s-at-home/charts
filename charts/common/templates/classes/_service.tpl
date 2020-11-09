{{- define "common.classes.service" -}}
{{- $values := .Values.service -}}
{{- if hasKey . "ObjectValues" -}}
  {{- with .ObjectValues.service -}}
    {{- $values = . -}}
  {{- end -}}
{{ end -}}
{{- $svcType := $values.type -}}
apiVersion: v1
kind: Service
metadata:
  name: {{ include "common.names.fullname" . }}
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
  ports:
    - port: {{ $values.port.port }}
      targetPort: {{ $values.port.targetPort }}
      protocol: {{ $values.port.protocol }}
      name: {{ $values.port.name }}
      {{- if (and (eq $svcType "NodePort") (not (empty $values.port.nodePort))) }}
      nodePort: {{ $values.port.nodePort }}
      {{ end }}
    {{- with $values.additionalPorts }}
    {{ toYaml . | nindent 4 }}
    {{- end }}
  selector:
    {{- include "common.labels.selectorLabels" . | nindent 4 }}
{{- end }}
