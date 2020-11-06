{{/* vim: set filetype=mustache: */}}

{{/* STARTX Cluster config helpers */}}

{{/* Common labels */}}
{{- define "cluster-ocs.labels" -}}
{{ include "startx.labelsInfra" . }}
app.kubernetes.io/instance: {{ include "startx.appNameVersion" . | quote }}
{{- end -}}

{{/* Common cluster-ocs annotations */}}
{{- define "cluster-ocs.annotations" -}}
{{ include "startx.annotationsInfra" . }}
{{- end -}}

{{/* Common operator note */}}
{{- define "cluster-ocs.notes" -}}
-- Quay registry -------------------
{{- if .quay }}{{- if .quay.enabled }}
quay is enabled
{{- end }}{{- end }}
{{- if .rhn }}{{- if .rhn.enabled }}
RHN is enabled with user {{- .rhn.user }}
{{- end }}{{- end }}
{{- end -}}
