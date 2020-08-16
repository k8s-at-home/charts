{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "lazylibrarian.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "lazylibrarian.fullname" -}}
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
{{- define "lazylibrarian.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "lazylibrarian.labels" -}}
helm.sh/chart: {{ include "lazylibrarian.chart" . }}
{{ include "lazylibrarian.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "lazylibrarian.selectorLabels" -}}
app.kubernetes.io/name: {{ include "lazylibrarian.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "lazylibrarian.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "lazylibrarian.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Determine the addons to be installed
*/}}
{{- define "lazylibrarian.enabledAddons" -}}
{{- $enabledAddons := list -}}
{{- if .Values.dockerMods.calibre.enabled }}
{{- $enabledAddons = printf "%s:%s" .Values.dockerMods.calibre.image.repository .Values.dockerMods.calibre.image.tag | append $enabledAddons -}}
{{- end -}}
{{- if .Values.dockerMods.ffmpeg.enabled }}
{{- $enabledAddons = printf "%s:%s" .Values.dockerMods.ffmpeg.image.repository .Values.dockerMods.ffmpeg.image.tag | append $enabledAddons -}}
{{- end -}}
{{- join "|" $enabledAddons | quote -}}
{{- end -}}

{{/*
Get the additional volumes
*/}}
{{- define "lazylibrarian.extraVolumes" -}}
{{- if .Values.persistence.extraVolumes }}
{{- $extraVolumes := .Values.persistence.extraVolumes -}}
{{- range $extraVolumes }}
{{- $_ := unset . "mountPath" }}
{{- end }}
{{- toYaml $extraVolumes }}
{{- end }}
{{- end }}

{{/*
Get the additional volumeMounts
*/}}
{{- define "lazylibrarian.extraVolumeMounts" -}}
{{- if .Values.persistence.extraVolumes }}
{{- $extraVolumeMounts := list -}}
{{- range .Values.persistence.extraVolumes }}
{{- if .mountPath }}
{{- $extraVolumeMounts = dict "name" .name "mountPath" .mountPath | append $extraVolumeMounts -}}
{{- else }}
{{- $extraVolumeMounts = dict "name" .name "mountPath" (printf "/mnt/%s" .name) | append $extraVolumeMounts -}}
{{- end }}
{{- end }}
{{- toYaml $extraVolumeMounts }}
{{- end }}
{{- end }}