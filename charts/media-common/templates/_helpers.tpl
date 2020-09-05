{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "media-common.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "media-common.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "media-common.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "media-common.labels" -}}
helm.sh/chart: {{ include "media-common.chart" . }}
{{ include "media-common.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "media-common.selectorLabels" -}}
app.kubernetes.io/name: {{ include "media-common.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Config Path Selector
*/}}
{{- define "media-common.configPathSelector" -}}
  {{- if eq .Values.image.organization "itscontained" -}}
    {{- if eq .Values.image.repository "radarr" -}}
/var/lib/radarr
    {{- else if eq .Values.image.repository "sonarr" -}}
/var/lib/sonarr
    {{- else if eq .Values.image.repository "lidarr" -}}
      {{- fail "lidarr not yet implemented" -}}
    {{- else -}}
      {{- fail "Could not establish the service port from the repository and no service port was set" -}}
    {{- end -}}
  {{- else -}}
/config
  {{- end -}}
{{- end -}}