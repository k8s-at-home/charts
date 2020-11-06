{{- define "common.pvc" -}}
  {{- /* Generate pvc as required */ -}}
  {{- $context := . -}}
  {{- range $index, $PVC := .Values.persistence }}
    {{- if and $PVC.enabled (not (or $PVC.emptyDir $PVC.existingClaim)) -}}
      {{- $persistenceValues := $PVC -}}
      {{- if not $persistenceValues.nameSuffix -}}
        {{- $_ := set $persistenceValues "nameSuffix" $index -}}
      {{- end -}}
      {{- $_ := set $context "ObjectValues" (dict "persistence" $persistenceValues) -}}
      {{- print ("---") | nindent 0 -}}
      {{- include "common.classes.pvc" $context -}}
    {{- end }}
  {{- end }}
{{- end }}
