{{/* Gollum Additional Volume Mounts */}}
{{- define "gollum.volumeMounts.config" -}}
mountPath: /config
name: gollum-config
{{- end -}}

{{- define "gollum.volumeMounts.wiki" -}}
mountPath: /wiki
name: wiki
{{- end -}}
