{{/*
The OpenVPN container(s) to be inserted
*/}}
{{- define "common.addon.openvpn.container" -}}
name: openvpn
image: "{{ .Values.addons.vpn.openvpn.image.repository }}:{{ .Values.addons.vpn.openvpn.image.tag }}"
imagePullPolicy: {{ .Values.addons.vpn.imagePullPolicy }}
securityContext:
  capabilities:
    add: 
      - NET_ADMIN
{{- if .Values.addons.vpn.env }}
env:
{{- range $k, $v := .Values.addons.vpn.env }}
  - name: {{ $k }}
    value: {{ $v }}
{{- end }}
{{- end }}  
{{- if or .Values.addons.vpn.openvpn.auth .Values.addons.vpn.openvpn.authSecret }}
envFrom:
  - secretRef:
    {{- if .Values.addons.vpn.openvpn.authSecret }}
      name: {{ .Values.addons.vpn.openvpn.authSecret }}
    {{- else }}
      name: {{ template "common.names.fullname" . }}-openvpn
    {{- end }}
{{- end }}
{{- if or .Values.addons.vpn.configFile .Values.addons.vpn.scripts.up .Values.addons.vpn.scripts.down .Values.addons.vpn.additionalVolumeMounts .Values.persistence.shared.enabled }}
volumeMounts:
{{- if .Values.addons.vpn.configFile }}
  - name: vpnconfig
    mountPath: /vpn/vpn.conf
    subPath: vpnConfigfile
{{- end }}
{{- if .Values.addons.vpn.scripts.up }}
  - name: vpnconfig
    mountPath: /vpn/up.sh
    subPath: up.sh
{{- end }}
{{- if .Values.addons.vpn.scripts.down }}
  - name: vpnconfig
    mountPath: /vpn/down.sh
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
