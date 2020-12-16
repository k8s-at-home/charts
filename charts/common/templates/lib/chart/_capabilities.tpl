{{/*
Return the appropriate apiVersion for DaemonSet objects.
*/}}
{{- define "common.capabilities.daemonset.apiVersion" -}}
{{- if .Capabilities.APIVersions.Has "apps/v1/DaemonSet" -}}
{{- print "apps/v1" -}}
{{- else -}}
{{- print "extensions/v1beta1" -}}
{{- end -}}
{{- end -}}

{{/*
Return the appropriate apiVersion for Deployment objects.
*/}}
{{- define "common.capabilities.deployment.apiVersion" -}}
{{- if .Capabilities.APIVersions.Has "apps/v1/Deployment" -}}
{{- print "apps/v1" -}}
{{- else -}}
{{- print "extensions/v1beta1" -}}
{{- end -}}
{{- end -}}

{{/*
Return the appropriate apiVersion for StatefulSet objects.
*/}}
{{- define "common.capabilities.statefulset.apiVersion" -}}
{{- if .Capabilities.APIVersions.Has "apps/v1/StatefulSet" -}}
{{- print "apps/v1" -}}
{{- else -}}
{{- print "apps/v1beta1" -}}
{{- end -}}
{{- end -}}

{{/*
Return the appropriate apiVersion for Ingress objects.
*/}}
{{- define "common.capabilities.ingress.apiVersion" -}}
{{- if .Capabilities.APIVersions.Has "networking.k8s.io/v1/Ingress" -}}
{{- print "networking.k8s.io/v1" -}}
{{- else if .Capabilities.APIVersions.Has "networking.k8s.io/v1beta1/Ingress" -}}
{{- print "networking.k8s.io/v1beta1" -}}
{{- else -}}
{{- print "extensions/v1beta1" -}}
{{- end }}
{{- end -}}
