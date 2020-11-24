{{/*
This template serves as a blueprint for all PersistentVolumeClaim objects that are created 
within the common library.
*/}}
{{- define "common.classes.pvc" -}}
{{- $values := .Values.persistence -}}
{{- if hasKey . "ObjectValues" -}}
  {{- with .ObjectValues.persistence -}}
    {{- $values = . -}}
  {{- end -}}
{{ end -}}
{{- $pvcName := include "common.names.fullname" . -}}
{{- if hasKey $values "nameSuffix" -}}
  {{- $pvcName = printf "%v-%v" $pvcName $values.nameSuffix -}}
{{ end -}}
kind: PersistentVolumeClaim
apiVersion: v1
metadata:
  name: {{ $pvcName }}
  {{- if or $values.skipuninstall $values.annotations }}
  annotations:
    {{- if $values.skipuninstall }}
    "helm.sh/resource-policy": keep
    {{- end }}
    {{- with $values.annotations }}
    {{- toYaml . | nindent 4 }}
    {{- end }}
  {{- end }}
  labels:
  {{- include "common.labels" . | nindent 4 }}
spec:
  accessModes:
    - {{ required (printf "accessMode is required for PVC %v" $pvcName) $values.accessMode | quote }}
  resources:
    requests:
      storage: {{ required (printf "size is required for PVC %v" $pvcName) $values.size | quote }}
  {{- if $values.storageClass }}
  storageClassName: {{ if (eq "-" $values.storageClass) }}""{{- else }}{{ $values.storageClass | quote }}{{- end }}
  {{- end }}
{{- end -}}
