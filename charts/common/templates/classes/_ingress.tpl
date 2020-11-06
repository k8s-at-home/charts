{{- define "common.classes.ingress" -}}
{{- $apiv1 := .Capabilities.APIVersions.Has "networking.k8s.io/v1" -}}
{{- $apiv1beta1 := .Capabilities.APIVersions.Has "networking.k8s.io/v1beta1" -}}
{{- $ingressName := include "common.names.fullname" . -}}
{{- $values := .Values.ingress -}}
{{- if hasKey . "ObjectValues" -}}
  {{- with .ObjectValues.ingress -}}
    {{- $values = . -}}
  {{- end -}}
{{ end -}}
{{- if hasKey $values "nameSuffix" -}}
  {{- $ingressName = printf "%v-%v" $ingressName $values.nameSuffix -}}
{{ end -}}
{{- $svcPort := $values.svcPort -}}
{{- if $apiv1 -}}
apiVersion: networking.k8s.io/v1
{{- else if $apiv1beta1 -}}
apiVersion: networking.k8s.io/v1beta1
{{- else }}
apiVersion: extensions/v1beta1
{{ end }}
kind: Ingress
metadata:
  name: {{ $ingressName }}
  labels:
    {{- include "common.labels" . | nindent 4 }}
  {{- with $values.annotations }}
  annotations:
    {{- toYaml . | nindent 4 }}
  {{- end }}
spec:
  {{- if $values.tls }}
  tls:
    {{- range $values.tls }}
    - hosts:
        {{- range .hosts }}
        - {{ . | quote }}
        {{- end }}
      secretName: {{ .secretName }}
    {{- end }}
  {{- end }}
  rules:
  {{- range $values.hosts }}
    - host: {{ .host | quote }}
      http:
        paths:
          {{- range .paths }}
          - path: {{ .path }}
            {{- if or $apiv1beta1 $apiv1 }}
            pathType: {{ .pathType }}
            {{- end }}
            backend:
              {{- if $apiv1 }}
              service:
                name: {{ $ingressName }}
                port:
                  name: {{ $svcPort }}
              {{- else }}
              serviceName: {{ $ingressName }}
              servicePort: {{ $svcPort }}
              {{- end }}
          {{- end }}
  {{- end }}
{{- end }}
