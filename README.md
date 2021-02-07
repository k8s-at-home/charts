# k8s@Home collection of helm charts

[![Discord](https://img.shields.io/badge/discord-chat-7289DA.svg)](https://discord.com/invite/7PbmHRK)
[![](https://github.com/k8s-at-home/charts/workflows/Release%20Charts/badge.svg?branch=master)](https://github.com/k8s-at-home/charts/actions)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/k8s-at-home)](https://artifacthub.io/packages/search?repo=k8s-at-home)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

## Usage

[Helm](https://helm.sh) must be installed to use the charts.
Please refer to Helm's [documentation](https://helm.sh/docs/) to get started.

Once Helm is set up properly, add the repo as follows:

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
```

You can then run `helm search repo k8s-at-home` to see the charts.

## Charts

See [Artifact Hub](https://artifacthub.io/packages/search?org=k8s-at-home) or [charts](./charts/) for a complete list.

## Common Library

The majority of the charts in this repository are using a common library we built. The reason we went with this pattern is a lot of applications are pretty similar in their requirements for Helm charts. Using a library makes maintaining much easier and keeps charts consistent in features. If contributing a new chart first try to make it using the library we built.

More information can be found [here](https://github.com/k8s-at-home/charts/tree/master/charts/common).

## Support

- Having problems with a chart or have a feature request? Open a new [issue](https://github.com/k8s-at-home/charts/issues/new/choose).
- New idea? Discuss [here](https://github.com/k8s-at-home/charts/discussions) or in our [Discord](https://discord.gg/sTMX7Vh) in the `#charts` channel.

## Contributing

See [CONTRIBUTING.md](./CONTRIBUTING.md)

## License

[Apache 2.0 License](./LICENSE)
