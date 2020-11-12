{{- define "common.values.setup" -}}
  {{- /* Merge the local chart values and the common chart defaults */ -}}
  {{- if .Values.common -}}
    {{- $defaultValues := deepCopy .Values.common -}}
    {{- $userValues := deepCopy (omit .Values "common") -}}
    {{- $mergedValues := mustMerge $userValues $defaultValues -}}
    {{- $_ := set . "Values" (deepCopy $mergedValues) -}}
  {{- end }}  
{{- end }}
