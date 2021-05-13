{{/* Gollum Additional Volumes */}}
{{- define "gollum.volume.sync" -}}
name: git-sync
configMap:
  name: {{ include "common.names.fullname" . }}
  defaultMode: 0755
  items:
    - key: git-sync
      path: git-sync
{{- end -}}

{{- define "gollum.volume.config" -}}
name: gollum-config
configMap:
  name: {{ include "common.names.fullname" . }}
  defaultMode: 0755
  items:
    - key: config.rb
      path: config.rb
{{- end -}}

{{- define "gollum.volume.wiki" -}}
name: wiki
emptyDir: {}
{{- end -}}
