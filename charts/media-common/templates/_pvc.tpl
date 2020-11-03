{{- define "media-common.pvc" -}}
  {{- /* Generate config PVC */ -}}
  {{- if and .Values.persistence.config.enabled (not .Values.persistence.config.existingClaim) -}}
    {{- $persistenceValues := .Values.persistence.config -}}
    {{- $_ := set . "ObjectValues" (dict "persistence" $persistenceValues) -}}    
    {{- print "---" | nindent 0 -}}
    {{- include "k8s-at-home.pvc" . -}}
  {{- end }}

  {{- /* Generate media PVC */ -}}
  {{- if and .Values.persistence.media.enabled (not .Values.persistence.media.existingClaim) -}}
    {{- $persistenceValues := .Values.persistence.media -}}
    {{- $_ := set $persistenceValues "nameSuffix" "media" -}}
    {{- $_ := set . "ObjectValues" (dict "persistence" $persistenceValues) -}}    
    {{- print "---" | nindent 0 -}}
    {{- include "k8s-at-home.pvc" . -}}
  {{- end }}

  {{- /* Generate additional pvc as required */ -}}
  {{- $context := . -}}
  {{- range $index, $extraPVC := .Values.persistence.additionalPVC }}
    {{- if $extraPVC.enabled -}}
      {{- $persistenceValues := $extraPVC -}}
      {{- if not $persistenceValues.nameSuffix -}}
        {{- $_ := set $persistenceValues "nameSuffix" $index -}}
      {{- end -}}
      {{- $_ := set $context "ObjectValues" (dict "persistence" $persistenceValues) -}}
      {{- print ("---") | nindent 0 -}}
      {{- include "k8s-at-home.pvc" $context -}}
    {{- end }}
  {{- end }}
{{- end }}
