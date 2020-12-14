{{/*
The Wireguard sidecar container to be inserted.
*/}}
{{- define "common.addon.wireguard.container" -}}
name: wireguard
image: "{{ .Values.addons.vpn.wireguard.image.repository }}:{{ .Values.addons.vpn.wireguard.image.tag }}"
imagePullPolicy: {{ .Values.addons.vpn.wireguard.pullPolicy }}
{{- with .Values.addons.vpn.securityContext }}
securityContext:
  {{- toYaml . | nindent 2 }}
{{- end }}
{{- with .Values.addons.vpn.env }}
env:
{{- range $k, $v := . }}
  - name: {{ $k }}
    value: {{ $v | quote }}
{{- end }}
{{- end }}
{{- if or .Values.addons.vpn.configFile .Values.addons.vpn.scripts.up .Values.addons.vpn.scripts.down .Values.addons.vpn.additionalVolumeMounts .Values.persistence.shared.enabled }}
volumeMounts:
{{- if .Values.addons.vpn.configFile }}
  - name: vpnconfig
    mountPath: /etc/wireguard/wg0.conf
    subPath: vpnConfigfile
{{- end }}
{{- if .Values.addons.vpn.scripts.up }}
  - name: vpnconfig
    mountPath: /config/up.sh
    subPath: up.sh
{{- end }}
{{- if .Values.addons.vpn.scripts.down }}
  - name: vpnconfig
    mountPath: /config/down.sh
    subPath: down.sh
{{- end }}
{{- if .Values.persistence.shared.enabled }}
  - mountPath: {{ .Values.persistence.shared.mountPath }}
    name: shared
{{- end }}
{{- with .Values.addons.vpn.additionalVolumeMounts }}
  {{- toYaml . | nindent 2 }}
{{- end }}
{{- end }}
{{- with .Values.addons.vpn.livenessProbe }}
livenessProbe:
  {{- toYaml . | nindent 2 }}
{{- end -}}
{{- with .Values.addons.vpn.resources }}
resources:
  {{- toYaml . | nindent 2 }}
{{- end }}
{{- end -}}
