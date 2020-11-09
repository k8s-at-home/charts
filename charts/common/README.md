# Library chart for k8s@home media charts
## **THIS CHART IS NOT MEANT TO BE INSTALLED DIRECTLY**

This is a [Helm Library Chart](https://helm.sh/docs/topics/library_charts/#helm) for grouping common logic between k8s@home charts.

## Introduction

This chart provides common template helpers which can be used to develop new charts using [Helm](https://helm.sh) package manager.

## TL;DR

```yaml
dependencies:
  - name: common
    version: 0.x.x
    repository: https://k8s-at-home.com/charts/
```

```bash
$ helm dependency update
```

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ include "common.names.fullname" . }}
data:
  myvalue: "Hello World"
```
