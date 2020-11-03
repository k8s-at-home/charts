{{/*
Common labels
*/}}
{{- define "k8s-at-home.labels" -}}
helm.sh/chart: {{ include "k8s-at-home.chart" . }}
{{ include "k8s-at-home.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "k8s-at-home.selectorLabels" -}}
app.kubernetes.io/name: {{ include "k8s-at-home.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
