{{/*
Probes selection logic.
*/}}
{{- define "common.controller.probes" -}}
{{- if .Values.probes.liveness.enabled -}}
  {{- include "common.controller.probeTemplate" (dict "context" . "probe" "liveness") | nindent 0 }}
{{- end }}
{{- if .Values.probes.readiness.enabled -}}
  {{- include "common.controller.probeTemplate" (dict "context" . "probe" "readiness") | nindent 0 }}
{{- end }}
{{- if .Values.probes.startup.enabled -}}
  {{- include "common.controller.probeTemplate" (dict "context" . "probe" "startup") | nindent 0  }}
{{- end }}
{{- end }}

{{/*
Probes template definition. Will default to tcpSocket type probe
*/}}
{{- define "common.controller.probeTemplate" -}}
{{- $svcPort := .context.Values.service.port.name -}}
{{- $probe := get .context.Values.probes .probe -}}
{{- if and $probe $probe.enabled -}}
{{ .probe }}Probe:
{{- if eq $probe.type "custom" -}}
  {{ $probe.spec | toYaml | nindent 2 }}
{{- else }}
  tcpSocket:
    port: {{ $svcPort }}
  initialDelaySeconds: {{ $probe.spec.initialDelaySeconds }}
  failureThreshold: {{ $probe.spec.failureThreshold }}
  timeoutSeconds: {{ $probe.spec.timeoutSeconds }}
{{- end }}
{{- end }}
{{- end }}
