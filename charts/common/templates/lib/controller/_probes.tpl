{{/*
Probes selection logic.
*/}}
{{- define "common.controller.probes" -}}
{{- $svcPort := .Values.service.port.name -}}
{{- range $probeName, $probe := .Values.probes }}
  {{- if $probe.enabled -}}
    {{- "" | nindent 0 }}
    {{- $probeName }}Probe:
    {{- if $probe.custom -}}
      {{- $probe.spec | toYaml | nindent 2 }}  
    {{- else }}
      {{- "tcpSocket:" | nindent 2 }}
        {{- printf "port: %v" $svcPort  | nindent 4 }}
      {{- printf "initialDelaySeconds: %v" $probe.spec.initialDelaySeconds  | nindent 2 }}
      {{- printf "failureThreshold: %v" $probe.spec.failureThreshold  | nindent 2 }}
      {{- printf "timeoutSeconds: %v" $probe.spec.timeoutSeconds  | nindent 2 }}
      {{- printf "periodSeconds: %v" $probe.spec.periodSeconds | nindent 2 }}
    {{- end }}
  {{- end }}
{{- end }}
{{- end }}
