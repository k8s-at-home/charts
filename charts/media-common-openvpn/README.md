# Add-on chart for k8s@home media charts

This chart provides a single maintainable OpenVPN add-on to the `meda-common` chart.

## Configuration

Read through the [values.yaml](https://github.com/k8s-at-home/charts/blob/master/charts/media-common-openvpn/values.yaml) file.
It has several commented out suggested values.

These values will normally be nested as it is a dependency, for example:
```yaml
radarr:
  openvpn:
    enabled: true
    <values>
```