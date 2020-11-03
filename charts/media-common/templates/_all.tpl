{{- define "media-common.all" -}}
  {{- /* Merge the local chart values and the media-common defaults */ -}}
  {{- $defaultValues := (index .Values "media-common") -}}
  {{- $_ := deepCopy $defaultValues | merge .Values -}}
  {{- $_ := unset .Values "media-common" -}}
  
  {{- /* Enable OpenVPN VPN add-on if required */ -}}
  {{- if .Values.addons.vpn.enabled }}
  {{- include "media-common.addon.vpn" . }}
  {{- end -}}

  {{- /* Build the templates */ -}}
  {{- include "media-common.pvc" . }}
  {{- print "---" | nindent 0 -}}
  {{- if eq .Values.persistence.type "statefulset" }}
  {{ include "media-common.statefulset" . }}
  {{ else }}
  {{ include "media-common.deployment" . }}
  {{- end -}}
  {{- print "---" | nindent 0 -}}
  {{ include "media-common.service" . }}
  {{- print "---" | nindent 0 -}}
  {{ include "media-common.ingress" . }}
{{- end -}}
