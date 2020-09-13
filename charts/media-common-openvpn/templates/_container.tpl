{{/*
The OpenVPN container(s) to be inserted
*/}}
{{- define "media-common.openvpn.container" -}}
- name: openvpn
  image: "{{ .Values.openvpn.image.repository }}:{{ .Values.openvpn.image.tag }}"
  imagePullPolicy: {{ .Values.openvpn.image.pullPolicy }}
  securityContext:
    capabilities:
      add: ["NET_ADMIN"]
  {{- if .Values.openvpn.env }}
  env:
  {{- if .Values.openvpn.env }}
  {{- range $k, $v := .Values.openvpn.env }}
    - name: {{ $k }}
      value: {{ $v }}
  {{- end }}
  {{- end }}  
  envFrom:
    {{- if or .Values.openvpn.auth .Values.openvpn.authSecret }}
    - secretRef:
      {{- if .Values.openvpn.authSecret }}
      name: {{ .Values.openvpn.authSecret }}
      {{- else }}
      name: {{ template "media-common.fullname" . }}-openvpn
      {{- end }}
    {{- end }}
  {{- end }}
  volumeMounts:
    {{- if .Values.openvpn.vpnConf }}
    - name: openvpnconf
      mountPath: /vpn/vpn.conf
      subPath: vpnConf
    {{- end }}
    {{- if .Values.openvpn.scripts.up }}
    - name: openvpnconf
      mountPath: /vpn/up.sh
      subPath: up.sh
    {{- end }}
    {{- if .Values.openvpn.scripts.down }}
    - name: openvpnconf
      mountPath: /vpn/down.sh
      subPath: down.sh
    {{- end }}
    {{- if .Values.openvpn.additionalVolumeMounts }}
    {{- toYaml .Values.openvpn.additionalVolumeMounts | nindent 4 }}
    {{- end }}
  livenessProbe:
    {{- toYaml .Values.openvpn.livenessProbe | nindent 4 }}
{{- end -}}
