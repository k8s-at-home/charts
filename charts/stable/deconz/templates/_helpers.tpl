{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "deconz.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "deconz.fullname" -}}
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
{{- define "deconz.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "deconz.labels" -}}
helm.sh/chart: {{ include "deconz.chart" . }}
{{ include "deconz.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "deconz.selectorLabels" -}}
app.kubernetes.io/name: {{ include "deconz.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "deconz.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "deconz.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Return true if a secret object should be created
*/}}
{{- define "deconz.createSecret" -}}
{{- if .Values.vnc.existingSecret }}
{{- else -}}
    {{- true -}}
{{- end -}}
{{- end -}}

{{/*
Get the password secret.
*/}}
{{- define "deconz.secretName" -}}
{{- if .Values.vnc.existingSecret }}
    {{- printf "%s" .Values.vnc.existingSecret -}}
{{- else -}}
    {{- printf "%s" (include "deconz.fullname" .) -}}
{{- end -}}
{{- end -}}

{{/*
Get the additional volumes
*/}}
{{- define "deconz.extraVolumes" -}}
{{- if .Values.extraVolumes }}
{{- $extraVolumes := .Values.extraVolumes -}}
{{- range $extraVolumes }}
{{- $_ := unset . "mountPath" }}
{{- end }}
{{- toYaml $extraVolumes }}
{{- end }}
{{- end }}

{{/*
Get the additional volumeMounts
*/}}
{{- define "deconz.extraVolumeMounts" -}}
{{- if .Values.extraVolumes }}
{{- $extraVolumeMounts := list -}}
{{- range .Values.extraVolumes }}
{{- if .mountPath }}
{{- $extraVolumeMounts = dict "name" .name "mountPath" .mountPath | append $extraVolumeMounts -}}
{{- else }}
{{- $extraVolumeMounts = dict "name" .name "mountPath" (printf "/mnt/%s" .name) | append $extraVolumeMounts -}}
{{- end }}
{{- end }}
{{- toYaml $extraVolumeMounts }}
{{- end }}
{{- end }}