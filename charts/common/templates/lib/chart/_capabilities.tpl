{{/*
Return the appropriate apiVersion for DaemonSet objects.
*/}}
{{- define "common.capabilities.daemonset.apiVersion" -}}
{{- if semverCompare "<1.14-0" .Capabilities.KubeVersion.GitVersion -}}
{{- print "extensions/v1beta1" -}}
{{- else -}}
{{- print "apps/v1" -}}
{{- end -}}
{{- end -}}

{{/*
Waiting on https://github.com/helm/helm/pull/8608
{{- define "common.capabilities.daemonset.apiVersion" -}}
{{- if .Capabilities.APIVersions.Has "apps/v1/DaemonSet" -}}
{{- print "apps/v1" -}}
{{- else -}}
{{- print "extensions/v1beta1" -}}
{{- end -}}
{{- end -}}
*/}}

{{/*
Return the appropriate apiVersion for Deployment objects.
*/}}
{{- define "common.capabilities.deployment.apiVersion" -}}
{{- if semverCompare "<1.14-0" .Capabilities.KubeVersion.GitVersion -}}
{{- print "extensions/v1beta1" -}}
{{- else -}}
{{- print "apps/v1" -}}
{{- end -}}
{{- end -}}

{{/*
Waiting on https://github.com/helm/helm/pull/8608
{{- define "common.capabilities.deployment.apiVersion" -}}
{{- if .Capabilities.APIVersions.Has "apps/v1/Deployment" -}}
{{- print "apps/v1" -}}
{{- else -}}
{{- print "extensions/v1beta1" -}}
{{- end -}}
{{- end -}}
*/}}

{{/*
Return the appropriate apiVersion for StatefulSet objects.
*/}}
{{- define "common.capabilities.statefulset.apiVersion" -}}
{{- if semverCompare "<1.14-0" .Capabilities.KubeVersion.GitVersion -}}
{{- print "apps/v1beta1" -}}
{{- else -}}
{{- print "apps/v1" -}}
{{- end -}}
{{- end -}}

{{/*
Waiting on https://github.com/helm/helm/pull/8608
{{- define "common.capabilities.statefulset.apiVersion" -}}
{{- if .Capabilities.APIVersions.Has "apps/v1/StatefulSet" -}}
{{- print "apps/v1" -}}
{{- else -}}
{{- print "apps/v1beta1" -}}
{{- end -}}
{{- end -}}
*/}}

{{/*
Return the appropriate apiVersion for Ingress objects.
*/}}

{{- define "common.capabilities.ingress.apiVersion" -}}
{{- if semverCompare "<1.14-0" .Capabilities.KubeVersion.GitVersion -}}
{{- print "extensions/v1beta1" -}}
{{- else if semverCompare "<1.19-0" .Capabilities.KubeVersion.GitVersion -}}
{{- print "networking.k8s.io/v1beta1" -}}
{{- else -}}
{{- print "networking.k8s.io/v1" -}}
{{- end }}
{{- end -}}

{{/*
Waiting on https://github.com/helm/helm/pull/8608
{{- define "common.capabilities.ingress.apiVersion" -}}
{{- if .Capabilities.APIVersions.Has "networking.k8s.io/v1/Ingress" -}}
{{- print "networking.k8s.io/v1" -}}
{{- else if .Capabilities.APIVersions.Has "networking.k8s.io/v1beta1/Ingress" -}}
{{- print "networking.k8s.io/v1beta1" -}}
{{- else -}}
{{- print "extensions/v1beta1" -}}
{{- end }}
{{- end -}}
*/}}
