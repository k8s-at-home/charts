# puppeteer

![Version: 1.2.1](https://img.shields.io/badge/Version-1.2.1-informational?style=flat-square) ![AppVersion: v13.3.2](https://img.shields.io/badge/AppVersion-v13.3.2-informational?style=flat-square)

Headless Chrome Node.js API

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/k8s-at-home/charts/issues/new/choose)**

## Source Code

* <https://github.com/jr0dd/container-images/tree/main/apps/puppeteer>
* <https://github.com/puppeteer/puppeteer>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://library-charts.k8s-at-home.com | common | 4.5.1 |

## TL;DR

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install puppeteer k8s-at-home/puppeteer
```

## Installing the Chart

To install the chart with the release name `puppeteer`

```console
helm install puppeteer k8s-at-home/puppeteer
```

## Uninstalling the Chart

To uninstall the `puppeteer` deployment

```console
helm uninstall puppeteer
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install puppeteer \
  --set env.TZ="America/New York" \
    k8s-at-home/puppeteer
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install puppeteer k8s-at-home/puppeteer -f values.yaml
```

## Special Instructions
### **Important!**

```console
You may need special headers to connect from outside of the cluster. Intra cluster works fine.
```

### Sample code to connect to Puppeteer

```javascript
const puppeteer = require('puppeteer-core')
const dns = require('dns').promises;

(async () => {
  // these dns options are not needed if using an load balancer or ingress
  const options = {
    family: 4,
    hints: dns.ADDRCONFIG | dns.V4MAPPED
  }
  const { address: host } = await dns.lookup('puppeteer', options, (address) => {
    return address
  })
  const browser = await puppeteer.connect({
    browserURL: `http://${host}:4000`
  })
  const page = await browser.newPage()
  await page.goto('https://example.com', { waitUntil: 'networkidle0' })
  await page.close()
    .catch((err) => {
      console.error(err)
    })
})()
```

### Default chromium flags in image

```javascript
'--disable-dev-shm-usage',
'--disable-setuid-sandbox',
'--no-sandbox',
'--remote-debugging-address=0.0.0.0',
'--remote-debugging-port=4000',
'--user-agent=Mozilla/5.0 (Macintosh; Intel Mac OS  X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/ 85.0.4183.121 Safari/537.36'
```

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| chromium.args | list | See below | chromium args. You can find more chromium expiremental flags [chromium switches](https://peter.sh/experiments/chromium-command-line-switches/). |
| env | object | See below | environment variables. See more environment variables in the [puppeteer documentation](https://github.com/puppeteer/puppeteer/blob/main/docs/api.md#environment-variables). |
| env.TZ | string | `"UTC"` | Set the container timezone |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"ghcr.io/jr0dd/puppeteer"` | image repository |
| image.tag | string | `"v13.3.2"` | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| service | object | See values.yaml | Configures service settings for the chart. |

## Changelog

### Version 1.2.1

#### Added

N/A

#### Changed

* Upgraded `common` chart dependency to version 4.5.1

#### Fixed

N/A

### Older versions

A historical overview of changes can be found on [ArtifactHUB](https://artifacthub.io/packages/helm/k8s-at-home/puppeteer?modal=changelog)

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v0.1.1](https://github.com/k8s-at-home/helm-docs/releases/v0.1.1)
