{{- define "print-or-recurse" -}}
  {{- if and (kindIs "string" .value) .value -}}
    {{- printf "%s=%s" .key .value | nindent 0 -}}
  {{- else if and (kindIs "map" .value) .value -}}
    {{- $key := .key -}}
    {{- range $subKey, $value := .value -}}
      {{- template "print-or-recurse" (dict "key" (printf "%s.%s" $key $subKey) "value" $value) -}}
    {{- end -}}
  {{- end -}}
{{- end -}}

{{- define "jetbrains-projector.configmap.volume" -}}
name: jetbrains-projector-config
configMap:
  name: {{ template "common.names.fullname" . }}-config
{{- end -}}

{{- define "jetbrains-projector.configmap.volumeMount" -}}
name: jetbrains-projector-config
mountPath: /tmp/idea.properties
subPath: idea.properties
{{- end -}}

{{- define "jetbrains-projector.ide" -}}
  {{- $ide := without (splitList "-" (last (splitList  "/" .Values.image.repository))) "projector" "c" "u" "p" | first -}}
  {{- if eq $ide "webstorm" -}}
    {{- $ide = "webide" -}}
  {{- end -}}
  {{- $ide -}}
{{- end -}}
