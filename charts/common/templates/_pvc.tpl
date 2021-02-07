{{/*
Renders the PersistentVolumeClaim objects required by the chart by returning a concatinated list
of all the entries of the persistence key.
*/}}
{{- define "common.pvc" -}}
  {{- /* Generate pvc as required */ -}}
  {{- range $index, $PVC := .Values.persistence }}
    {{- if and $PVC.enabled (not (or $PVC.emptyDir $PVC.existingClaim)) -}}
      {{- $persistenceValues := $PVC -}}
      {{- if not $persistenceValues.nameSuffix -}}
        {{- $_ := set $persistenceValues "nameSuffix" $index -}}
      {{- end -}}
      {{- $_ := set $ "ObjectValues" (dict "persistence" $persistenceValues) -}}
      {{- print ("---") | nindent 0 -}}
      {{- include "common.classes.pvc" $ -}}
    {{- end }}
  {{- end }}
{{- end }}
