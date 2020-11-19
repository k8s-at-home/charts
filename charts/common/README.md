# Library chart for k8s@home media charts

**THIS CHART IS NOT MEANT TO BE INSTALLED DIRECTLY**

This is a [Helm Library Chart](https://helm.sh/docs/topics/library_charts/#helm) for grouping common logic between the k8s@home charts.

## Introduction

This chart provides common template helpers which can be used to develop new charts using [Helm](https://helm.sh) package manager.

## TL;DR

When using one of the many charts that uses this library be sure to view this [values.yaml](./values.yaml) for configuration options. Any setting here can be used to define what values your helm deployment will use.

For example using the helm CLI tool

```bash
helm install node-red \
  --set image.repository="nodered/node-red" \
  --set image.tag="1.2.5" \
  --set env.TZ="America/New_York" \
  k8s-at-home/node-red
```

or

```yaml
# node-red-values.yaml
image:
  repository: nodered/node-red
  tag: 1.2.5
env:
  TZ: America/New_York
```

```bash
helm install node-red \
  --values=./node-red-values.yaml \
  k8s-at-home/node-red
```

## Creating a new chart

Include this chart as a dependency in your `Chart.yaml`

```yaml
dependencies:
  - name: common
    version: x.x.x
    repository: https://k8s-at-home.com/charts/
```

```bash
helm dependency update
```

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ include "common.names.fullname" . }}
data:
  myvalue: "Hello World"
```
