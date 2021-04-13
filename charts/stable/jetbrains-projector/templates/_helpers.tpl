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
name: idea-properties
configMap:
  name: {{ template "common.names.fullname" . }}-config
{{- end -}}

{{- define "jetbrains-projector.configmap.volumeMount" -}}
name: idea-properties
mountPath: /tmp/idea.properties
subPath: idea.properties
{{- end -}}

{{- define "jetbrains-projector.certs.volume" -}}
name: certs
secret:
  secretName: {{ required "a secret name is required when sslGen is enabled" .Values.sslGen.certs.secret }}
{{- end -}}

{{- define "jetbrains-projector.certs.volumeMount" -}}
name: certs
mountPath: /tmp/certs
{{- end -}}

{{- define "jetbrains-projector.secret.volume" -}}
name: ssl-properties
secret:
  secretName: {{ default (printf "%s-secrets" (include "common.names.fullname" .)) .Values.sslGen.properties.existingSecret }}
{{- end -}}

{{- define "jetbrains-projector.secret.volumeMount" -}}
name: ssl-properties
mountPath: /tmp/{{ .Values.sslGen.properties.key }}
subPath: {{ .Values.sslGen.properties.key }}
{{- end -}}

{{- define "jetbrains-projector.ide" -}}
  {{- $ide := without (splitList "-" (last (splitList  "/" .Values.image.repository))) "projector" "c" "u" "p" | first -}}
  {{- if eq $ide "webstorm" -}}
    {{- $ide = "webide" -}}
  {{- end -}}
  {{- $ide -}}
{{- end -}}
