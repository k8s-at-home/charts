{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "traefik-forward-auth.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "traefik-forward-auth.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "traefik-forward-auth.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "traefik-forward-auth.labels" -}}
helm.sh/chart: {{ include "traefik-forward-auth.chart" . }}
{{ include "traefik-forward-auth.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "traefik-forward-auth.selectorLabels" -}}
app.kubernetes.io/name: {{ include "traefik-forward-auth.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "traefik-forward-auth.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "traefik-forward-auth.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
If there's an existing secret, reuse it, otherwise generate a new one.
*/}}
{{- define "traefik-forward-auth.secret" -}}
{{- $secret := (lookup "v1" "Secret" .Release.Namespace (include "traefik-forward-auth.fullname" .) ) -}}
  {{- if $secret -}}
    {{-  index $secret "data" "secret" -}}
  {{- else -}}
    {{- randAlphaNum 16 | b64enc | quote -}}
  {{- end -}}
{{- end -}}
