{{/* Gollum Additional Containers */}}
{{- define "gollum.container.cron" -}}
name: cron
image: alpine/git
command: ["crond", "-f", "-l", "8"]
volumeMounts:
  - mountPath: /etc/periodic/15min/
    name: git-sync
  - mountPath: /wiki
    name: wiki
{{- end -}}
