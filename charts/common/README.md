# Library chart for k8s@home media charts

**WARNING: THIS CHART IS NOT MEANT TO BE INSTALLED DIRECTLY**

This is a [Helm Library Chart](https://helm.sh/docs/topics/library_charts/#helm). It's purpose is for grouping common logic between the k8s@home charts. 

Since a lot of charts follow the same pattern this library was built to reduce maintenance cost between the charts that use it and try achieve a goal of being DRY.

## Introduction

This chart provides common template helpers which can be used to develop new charts using [Helm](https://helm.sh) package manager.

## :star2: Changelog

Please refer to [CHANGELOG.md](CHANGELOG.md) for an overview of notable changes to the chart. **This is especially important for major version updates!**

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

First be sure to checkout the many charts that already use this like [qBittorrent](../qbittorrent/), [node-red](../node-red/) or the many others in this repository.

Include this chart as a dependency in your `Chart.yaml` e.g.

```yaml
# Chart.yaml
dependencies:
  - name: common
    version: x.x.x
    repository: https://k8s-at-home.com/charts/
```

Write a `values.yaml` with some basic defaults you want to present to the user e.g.

```yaml
# Default values for node-red.

image:
  repository: nodered/node-red
  pullPolicy: IfNotPresent
  tag: 1.2.5

strategy:
  type: Recreate

# See more environment varaibles in the node-red documentation
# https://nodered.org/docs/getting-started/docker
env: {}
  # TZ:
  # NODE_OPTIONS:
  # NODE_RED_ENABLE_PROJECTS:
  # NODE_RED_ENABLE_SAFE_MODE:
  # FLOWS:

service:
  port:
    port: 1880

persistence:
  data:
    enabled: false
    emptyDir: false
    mountPath: /data
```

If testing locally make sure you update the dependencies with:

```bash
helm dependency update
```
