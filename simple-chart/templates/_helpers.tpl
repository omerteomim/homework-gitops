{{/*
Expand the name of the chart.
*/}}
{{- define "simple-chart.name" -}}
{{- default .Chart.Name }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "simple-chart.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "simple-chart.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "simple-chart.labels" -}}
helm.sh/chart: {{ include "simple-chart.chart" . }}
{{ include "simple-chart.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "simple-chart.selectorLabels" -}}
app.kubernetes.io/name: {{ include "simple-chart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
