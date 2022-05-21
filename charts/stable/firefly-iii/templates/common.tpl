{{- define "firefly.DB_CONNECTION" -}}
{{- if .Values.postgresql.enabled }}
    {{- printf "pgsql" -}}
{{- else if .Values.mariadb.enabled }}
    {{- printf "mysql" -}}
{{- else -}}
    {{- printf "sqlite" -}}
{{- end -}}
{{ end }}

{{- define "firefly.DB_HOST" -}}
{{- if .Values.postgresql.enabled }}
    {{- $postgrestmp := printf "%s-%s" .Release.Name "postgresql"}}
    {{- printf "%s" $postgrestmp -}}
{{- else if .Values.mariadb.enabled }}
    {{- $mysqltmp := printf "%s-%s" .Release.Name "mariadb"}}
    {{- printf "%s" $mysqltmp -}}
{{- else -}}
    {{- printf "localhost" -}}
{{- end -}}
{{ end }}

{{- define "firefly.DB_PORT" -}}
{{- if .Values.postgresql.enabled }}
    {{- printf "%s" "5432" -}}
{{- else if .Values.mariadb.enabled }}
    {{- printf "%s" "3306" -}}
{{- else -}}
    {{- printf "0" -}}
{{- end -}}
{{ end }}

{{- define "firefly.DB_USERNAME" -}}
{{- if .Values.postgresql.enabled }}
    {{- printf "%s" .Values.postgresql.auth.username -}}
{{- else if .Values.mariadb.enabled }}
    {{- printf "%s" .Values.mariadb.auth.username -}}
{{- else -}}
    {{- printf "firefly" -}}
{{- end -}}
{{ end }}

{{- define "firefly.DB_DATABASE" -}}
{{- if .Values.postgresql.enabled }}
    {{- printf "%s" .Values.postgresql.auth.database -}}
{{- else if .Values.mariadb.enabled }}
    {{- printf "%s" .Values.mariadb.auth.database -}}
{{- else -}}
    {{- printf "firefly" -}}
{{- end -}}
{{ end }}

{{- define "firefly.DB_PASSWORD_SECRET" -}}
{{- if .Values.postgresql.enabled }}
{{- printf "%s-%s" .Release.Name "postgresql" -}}
{{- else if .Values.mariadb.enabled }}
{{- printf "%s-%s" .Release.Name "mariadb" -}}
{{- else -}}
    {{- printf "firefly" -}}
{{- end -}}
{{ end }}

{{- define "firefly.DB_PASSWORD_SECRET_KEY" -}}
{{- if .Values.postgresql.enabled }}
{{- printf "%s" "password" -}}
{{- else if .Values.mariadb.enabled }}
{{- printf "%s" "mariadb-password" -}}
{{- else -}}
    {{- printf "firefly" -}}
{{- end -}}
{{ end }}


#   Database credentials. Make sure the database exists. I recommend a dedicated user for Firefly III
#   For other database types, please see the FAQ: https://docs.firefly-iii.org/support/faq
#   If you use Docker or similar, you can set these variables from a file by appending them with _FILE
#   Use "pgsql" for PostgreSQL
#   Use "mysql" for MySQL and MariaDB.
#   Use "sqlite" for SQLite.
#   DB_CONNECTION=mysql
#   DB_HOST=db
#   DB_PORT=3306
#   DB_DATABASE=firefly
#   DB_USERNAME=firefly
#   DB_PASSWORD=secret_firefly_password



{{- include "common.values.setup" . }}

{{/* Append the hardcoded settings */}}
{{- define "firefly.harcodedValues" -}}
env:
  DB_CONNECTION: {{ include "firefly.DB_CONNECTION" . | quote }}
  DB_HOST: {{ include "firefly.DB_HOST" . | quote }}
  DB_PORT: {{ include "firefly.DB_PORT" . | quote }}
  DB_DATABASE: {{ include "firefly.DB_DATABASE" . | quote }}
  DB_USERNAME: {{ include "firefly.DB_USERNAME" . | quote }}
  DB_PASSWORD: 
    valueFrom:
      secretKeyRef:
        name: {{ include "firefly.DB_PASSWORD_SECRET" . | quote }}
        key: {{ include "firefly.DB_PASSWORD_SECRET_KEY" . | quote }}
{{- end -}}
{{- $_ := mergeOverwrite .Values (include "firefly.harcodedValues" . | fromYaml) -}}

{{/* Render the templates */}}
{{ include "common.all" . }}