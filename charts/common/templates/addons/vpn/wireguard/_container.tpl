{{/*
The Wireguard container(s) to be inserted
*/}}
{{- define "common.addon.wireguard.container" -}}
name: wireguard
image: "{{ .Values.addons.vpn.wireguard.image.repository }}:{{ .Values.addons.vpn.wireguard.image.tag }}"
imagePullPolicy: {{ .Values.addons.vpn.imagePullPolicy }}
securityContext:
  privileged: true
  capabilities:
    add: 
      - NET_ADMIN
      - SYS_MODULE
{{- if .Values.addons.vpn.env }}
env:
{{- range $k, $v := .Values.addons.vpn.env }}
  - name: {{ $k }}
    value: {{ $v }}
{{- end }}
{{- end }}  
{{- if or .Values.addons.vpn.configFile .Values.addons.vpn.scripts.up .Values.addons.vpn.scripts.down .Values.addons.vpn.additionalVolumeMounts .Values.persistence.shared.enabled }}
volumeMounts:
{{- if .Values.addons.vpn.configFile }}
  - name: vpnconfig
    mountPath: /config/wg0.conf
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
{{- if .Values.addons.vpn.additionalVolumeMounts }}
  {{- toYaml .Values.addons.vpn.additionalVolumeMounts | nindent 2 }}
{{- end }}
{{- end }}
{{- if .Values.addons.vpn.livenessProbe }}
livenessProbe:
  {{- toYaml .Values.addons.vpn.livenessProbe | nindent 4 }}
{{- end -}}
{{- end -}}
