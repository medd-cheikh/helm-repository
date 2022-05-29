{{/* vim: set filetype=mustache: */}}
{{/* STARTX example-fruitapp-app helpers */}}

{{/* Common labels */}}
{{- define "example-fruitapp-app.labels" -}}
{{ include "startx.labelsCommon" . }}
app.startx.fr/component: {{ include "startx.appComponent" . | default "component" | quote }}
app.kubernetes.io/component: {{ include "startx.appComponent" . | default "component" | quote }}
app.kubernetes.io/part-of: {{ include "startx.appCluster" . | default "cluster" | quote }}
app.kubernetes.io/instance: {{ include "startx.appNameVersion" . | default "myapp-0.0.1" | quote }}
{{- end -}}

{{/* Common example-fruitapp-app annotations */}}
{{- define "example-fruitapp-app.annotations" -}}
{{- include "startx.annotationsCommon" . -}}
{{- end -}}