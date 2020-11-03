{{- define "k8s-at-home.service" -}}
{{- $values := .Values.service -}}
{{- if and (hasKey . "ObjectValues") (hasKey .ObjectValues "service") -}}
  {{- $values = .ObjectValues.service -}}
{{ end -}}
{{- $svcType := .Values.service.type -}}
apiVersion: v1
kind: Service
metadata:
  name: {{ include "k8s-at-home.fullname" . }}
  labels:
    {{- include "k8s-at-home.labels" . | nindent 4 }}
  {{- if .Values.service.labels }}
    {{ toYaml .Values.service.labels | nindent 4 }}
  {{- end }}
  {{- with .Values.service.annotations }}
  annotations:
    {{ toYaml . | nindent 4 }}
  {{- end }}
spec:
  {{- if (or (eq $svcType "ClusterIP") (empty $svcType)) }}
  type: ClusterIP
  {{- if .Values.service.clusterIP }}
  clusterIP: {{ .Values.service.clusterIP }}
  {{end}}
  {{- else if eq $svcType "LoadBalancer" }}
  type: {{ $svcType }}
  {{- if .Values.service.loadBalancerIP }}
  loadBalancerIP: {{ .Values.service.loadBalancerIP }}
  {{- end }}
  {{- if .Values.service.externalTrafficPolicy }}
  externalTrafficPolicy: {{ .Values.service.externalTrafficPolicy }}
  {{- end }}
  {{- if .Values.service.loadBalancerSourceRanges }}
  loadBalancerSourceRanges:
    {{ toYaml .Values.service.loadBalancerSourceRanges | nindent 4 }}
  {{- end -}}
  {{- else }}
  type: {{ $svcType }}
  {{- end }}
  {{- if .Values.service.sessionAffinity }}
  sessionAffinity: {{ .Values.service.sessionAffinity }}
  {{- if .Values.service.sessionAffinityConfig }}
  sessionAffinityConfig:
    {{ toYaml .Values.service.sessionAffinityConfig | nindent 4 }}
  {{- end -}}
  {{- end }}
  {{- with .Values.service.externalIPs }}
  externalIPs:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- if .Values.service.publishNotReadyAddresses }}
  publishNotReadyAddresses: {{ .Values.service.publishNotReadyAddresses }}
  {{- end }}
  ports:
    - port: {{ .Values.service.port.port }}
      targetPort: {{ .Values.service.port.targetPort }}
      protocol: {{ .Values.service.port.protocol }}
      name: {{ .Values.service.port.name }}
      {{- if (and (eq $svcType "NodePort") (not (empty .Values.service.port.nodePort))) }}
      nodePort: {{ .Values.service.port.nodePort }}
      {{ end }}
    {{- with .Values.service.additionalPorts }}
    {{ toYaml . | nindent 4 }}
    {{- end }}
  selector:
    {{- include "k8s-at-home.selectorLabels" . | nindent 4 }}
{{- end }}
