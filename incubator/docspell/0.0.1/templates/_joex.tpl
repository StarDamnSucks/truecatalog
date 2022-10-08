{{/* Define the joex container */}}
{{- define "docspell.joex" -}}
image: {{ .Values.joexImage.repository }}:{{ .Values.joexImage.tag }}
imagePullPolicy: {{ .Values.joexImage.pullPolicy }}
securityContext:
  runAsUser: {{ .Values.podSecurityContext.runAsUser }}
  runAsGroup: {{ .Values.podSecurityContext.runAsGroup }}
  readOnlyRootFilesystem: {{ .Values.securityContext.readOnlyRootFilesystem }}
  runAsNonRoot: {{ .Values.securityContext.runAsNonRoot }}
args:
  - /opt/joex.conf
volumeMounts:
  - name: joex
    mountPath: /opt/joex.conf
    subPath: joex.conf
    readOnly: true
ports:
  - containerPort: {{ .Values.service.joex.ports.joex.port }}
    name: joex
{{/* TODO: Find out a path for healthchecks and come back to enable probes
readinessProbe:
  httpGet:
    path: /
    port: {{ .Values.service.joex.ports.joex.port }}
  initialDelaySeconds: {{ .Values.probes.readiness.spec.initialDelaySeconds }}
  timeoutSeconds: {{ .Values.probes.readiness.spec.timeoutSeconds }}
  periodSeconds: {{ .Values.probes.readiness.spec.periodSeconds }}
  failureThreshold: {{ .Values.probes.readiness.spec.failureThreshold }}
livenessProbe:
  httpGet:
    path: /
    port: {{ .Values.service.joex.ports.joex.port }}
  initialDelaySeconds: {{ .Values.probes.liveness.spec.initialDelaySeconds }}
  timeoutSeconds: {{ .Values.probes.liveness.spec.timeoutSeconds }}
  periodSeconds: {{ .Values.probes.liveness.spec.periodSeconds }}
  failureThreshold: {{ .Values.probes.liveness.spec.failureThreshold }}
startupProbe:
  httpGet:
    path: /
    port: {{ .Values.service.joex.ports.joex.port }}
  initialDelaySeconds: {{ .Values.probes.startup.spec.initialDelaySeconds }}
  timeoutSeconds: {{ .Values.probes.startup.spec.timeoutSeconds }}
  periodSeconds: {{ .Values.probes.startup.spec.periodSeconds }}
  failureThreshold: {{ .Values.probes.startup.spec.failureThreshold }}
*/}}
{{- end -}}
