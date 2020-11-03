{{- define "k8s-at-home.ingress" -}}
{{- $kubeVersion := .Capabilities.KubeVersion.GitVersion -}}
{{- $ingressName := include "k8s-at-home.fullname" . -}}
{{- $values := .Values.ingress -}}
{{- if and (hasKey . "ObjectValues") (hasKey .ObjectValues "ingress") -}}
  {{- $values = .ObjectValues.ingress -}}
{{ end -}}
{{- if hasKey $values "nameSuffix" -}}
  {{- $ingressName = printf "%v-%v" $ingressName $values.nameSuffix -}}
{{ end -}}
{{- $svcPort := $values.svcPort -}}
{{ if semverCompare ">= 1.19-0" $kubeVersion }}
apiVersion: networking.k8s.io/v1
{{ else if semverCompare ">= 1.14-0 < 1.19-0" $kubeVersion }}
apiVersion: networking.k8s.io/v1beta1
{{ else }}
apiVersion: extensions/v1beta1
{{ end -}}
kind: Ingress
metadata:
  name: {{ $ingressName }}
  labels:
  {{- include "k8s-at-home.labels" . | nindent 4 }}
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
            {{- if semverCompare ">= 1.14-0" $kubeVersion}}
            pathType: {{ .pathType }}
            {{- end }}
            backend:
              {{- if semverCompare ">= 1.19-0" $kubeVersion}}
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
