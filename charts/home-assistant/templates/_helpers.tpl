{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "home-assistant.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "home-assistant.fullname" -}}
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
{{- define "home-assistant.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create argument list for vscode image.
*/}}
{{- define "home-assistant.vscode.args" -}}
{{- if empty .Values.vscode.args -}}
{{- "" -}}
{{- else if (eq (typeOf .Values.vscode.args) "string") -}}
- --port={{ .Values.vscode.service.port }}
{{- if not (.Values.vscode.password) }}
- --auth=none
{{- end }}
{{- if .Values.vscode.vscodePath }}
- --extensions-dir={{ .Values.vscode.vscodePath }}
- --user-data-dir={{ .Values.vscode.vscodePath }}
- {{ .Values.vscode.hassConfig }}
{{- end }}
{{- else -}}
{{ toYaml .Values.vscode.args }}
{{- end -}}
{{- end -}}