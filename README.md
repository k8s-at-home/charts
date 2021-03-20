# Helm charts
<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/all_contributors-9-orange.svg?style=flat-square)](#contributors-)
<!-- ALL-CONTRIBUTORS-BADGE:END -->

[![docs](https://img.shields.io/badge/docs-rtfm-yellow?logo=gitbook&logoColor=white&style=for-the-badge)](https://docs.k8s-at-home.com/)
[![Discord](https://img.shields.io/badge/discord-chat-7289DA.svg?maxAge=60&style=for-the-badge)](https://discord.gg/sTMX7Vh)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white&style=for-the-badge)](https://github.com/pre-commit/pre-commit)
[![renovate](https://img.shields.io/badge/renovate-enabled-brightgreen?style=for-the-badge&logo=data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjUgNSAzNzAgMzcwIj48Y2lyY2xlIGN4PSIxODkiIGN5PSIxOTAiIHI9IjE4NCIgZmlsbD0iI2ZlMiIvPjxwYXRoIGZpbGw9IiM4YmIiIGQ9Ik0yNTEgMjU2bC0zOC0zOGExNyAxNyAwIDAxMC0yNGw1Ni01NmMyLTIgMi02IDAtN2wtMjAtMjFhNSA1IDAgMDAtNyAwbC0xMyAxMi05LTggMTMtMTNhMTcgMTcgMCAwMTI0IDBsMjEgMjFjNyA3IDcgMTcgMCAyNGwtNTYgNTdhNSA1IDAgMDAwIDdsMzggMzh6Ii8+PHBhdGggZmlsbD0iI2Q1MSIgZD0iTTMwMCAyODhsLTggOGMtNCA0LTExIDQtMTYgMGwtNDYtNDZjLTUtNS01LTEyIDAtMTZsOC04YzQtNCAxMS00IDE1IDBsNDcgNDdjNCA0IDQgMTEgMCAxNXoiLz48cGF0aCBmaWxsPSIjYjMwIiBkPSJNMjg1IDI1OGw3IDdjNCA0IDQgMTEgMCAxNWwtOCA4Yy00IDQtMTEgNC0xNiAwbC02LTdjNCA1IDExIDUgMTUgMGw4LTdjNC01IDQtMTIgMC0xNnoiLz48cGF0aCBmaWxsPSIjYTMwIiBkPSJNMjkxIDI2NGw4IDhjNCA0IDQgMTEgMCAxNmwtOCA3Yy00IDUtMTEgNS0xNSAwbC05LThjNSA1IDEyIDUgMTYgMGw4LThjNC00IDQtMTEgMC0xNXoiLz48cGF0aCBmaWxsPSIjZTYyIiBkPSJNMjYwIDIzM2wtNC00Yy02LTYtMTctNi0yMyAwLTcgNy03IDE3IDAgMjRsNCA0Yy00LTUtNC0xMSAwLTE2bDgtOGM0LTQgMTEtNCAxNSAweiIvPjxwYXRoIGZpbGw9IiNiNDAiIGQ9Ik0yODQgMzA0Yy00IDAtOC0xLTExLTRsLTQ3LTQ3Yy02LTYtNi0xNiAwLTIybDgtOGM2LTYgMTYtNiAyMiAwbDQ3IDQ2YzYgNyA2IDE3IDAgMjNsLTggOGMtMyAzLTcgNC0xMSA0em0tMzktNzZjLTEgMC0zIDAtNCAybC04IDdjLTIgMy0yIDcgMCA5bDQ3IDQ3YTYgNiAwIDAwOSAwbDctOGMzLTIgMy02IDAtOWwtNDYtNDZjLTItMi0zLTItNS0yeiIvPjxwYXRoIGZpbGw9IiMxY2MiIGQ9Ik0xNTIgMTEzbDE4LTE4IDE4IDE4LTE4IDE4em0xLTM1bDE4LTE4IDE4IDE4LTE4IDE4em0tOTAgODlsMTgtMTggMTggMTgtMTggMTh6bTM1LTM2bDE4LTE4IDE4IDE4LTE4IDE4eiIvPjxwYXRoIGZpbGw9IiMxZGQiIGQ9Ik0xMzQgMTMxbDE4LTE4IDE4IDE4LTE4IDE4em0tMzUgMzZsMTgtMTggMTggMTgtMTggMTh6Ii8+PHBhdGggZmlsbD0iIzJiYiIgZD0iTTExNiAxNDlsMTgtMTggMTggMTgtMTggMTh6bTU0LTU0bDE4LTE4IDE4IDE4LTE4IDE4em0tODkgOTBsMTgtMTggMTggMTgtMTggMTh6bTEzOS04NWwyMyAyM2M0IDQgNCAxMSAwIDE2TDE0MiAyNDBjLTQgNC0xMSA0LTE1IDBsLTI0LTI0Yy00LTQtNC0xMSAwLTE1bDEwMS0xMDFjNS01IDEyLTUgMTYgMHoiLz48cGF0aCBmaWxsPSIjM2VlIiBkPSJNMTM0IDk1bDE4LTE4IDE4IDE4LTE4IDE4em0tNTQgMThsMTgtMTcgMTggMTctMTggMTh6bTU1LTUzbDE4LTE4IDE4IDE4LTE4IDE4em05MyA0OGwtOC04Yy00LTUtMTEtNS0xNiAwTDEwMyAyMDFjLTQgNC00IDExIDAgMTVsOCA4Yy00LTQtNC0xMSAwLTE1bDEwMS0xMDFjNS00IDEyLTQgMTYgMHoiLz48cGF0aCBmaWxsPSIjOWVlIiBkPSJNMjcgMTMxbDE4LTE4IDE4IDE4LTE4IDE4em01NC01M2wxOC0xOCAxOCAxOC0xOCAxOHoiLz48cGF0aCBmaWxsPSIjMGFhIiBkPSJNMjMwIDExMGwxMyAxM2M0IDQgNCAxMSAwIDE2TDE0MiAyNDBjLTQgNC0xMSA0LTE1IDBsLTEzLTEzYzQgNCAxMSA0IDE1IDBsMTAxLTEwMWM1LTUgNS0xMSAwLTE2eiIvPjxwYXRoIGZpbGw9IiMxYWIiIGQ9Ik0xMzQgMjQ4Yy00IDAtOC0yLTExLTVsLTIzLTIzYTE2IDE2IDAgMDEwLTIzTDIwMSA5NmExNiAxNiAwIDAxMjIgMGwyNCAyNGM2IDYgNiAxNiAwIDIyTDE0NiAyNDNjLTMgMy03IDUtMTIgNXptNzgtMTQ3bC00IDItMTAxIDEwMWE2IDYgMCAwMDAgOWwyMyAyM2E2IDYgMCAwMDkgMGwxMDEtMTAxYTYgNiAwIDAwMC05bC0yNC0yMy00LTJ6Ii8+PC9zdmc+)](https://github.com/renovatebot/renovate)
[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/k8s-at-home&style=for-the-badge)](https://artifacthub.io/packages/search?repo=k8s-at-home)

## Usage

[Helm](https://helm.sh) must be installed to use the charts.
Please refer to Helm's [documentation](https://helm.sh/docs/) to get started.

Once Helm is set up properly, add the repo as follows:

```console
helm repo add k8s-at-home https://k8s-at-home.com/charts/
```

You can then run `helm search repo k8s-at-home` to see the charts.

## Support

We have a few outlets for getting support with our projects:

- Visit our [Docs](https://docs.k8s-at-home.com/).
- Bugs or feature requests should be opened in an [issue](https://github.com/k8s-at-home/charts/issues/new/choose).
- Questions or comments should be discussed in our [Discord](https://discord.gg/sTMX7Vh) or via [Github discussions](https://github.com/k8s-at-home/organization/discussions).

## Contributing

See [CONTRIBUTING.md](./CONTRIBUTING.md)

## License

[Apache 2.0 License](./LICENSE)

## Contributors ✨

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="https://github.com/devfaz"><img src="https://avatars.githubusercontent.com/u/4060372?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Fabian Zimmermann</b></sub></a><br /><a href="https://github.com/k8s-at-home/charts/commits?author=devfaz" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/angelnu"><img src="https://avatars.githubusercontent.com/u/4406403?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Vegetto</b></sub></a><br /><a href="https://github.com/k8s-at-home/charts/commits?author=angelnu" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/trly"><img src="https://avatars.githubusercontent.com/u/212733?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Travis Lyons</b></sub></a><br /><a href="https://github.com/k8s-at-home/charts/commits?author=trly" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/bjw-s"><img src="https://avatars.githubusercontent.com/u/6213398?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Bᴇʀɴᴅ Sᴄʜᴏʀɢᴇʀs</b></sub></a><br /><a href="https://github.com/k8s-at-home/charts/commits?author=bjw-s" title="Code">💻</a></td>
    <td align="center"><a href="http://schouten-lebbing.nl"><img src="https://avatars.githubusercontent.com/u/7613738?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Kjeld Schouten-Lebbing</b></sub></a><br /><a href="https://github.com/k8s-at-home/charts/commits?author=Ornias1993" title="Code">💻</a></td>
    <td align="center"><a href="https://www.meetup.com/nl-NL/I-I-Inspiratie-Innovatie/"><img src="https://avatars.githubusercontent.com/u/30292281?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Rolf Berkenbosch</b></sub></a><br /><a href="https://github.com/k8s-at-home/charts/commits?author=rolfberkenbosch" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/auricom"><img src="https://avatars.githubusercontent.com/u/27022259?v=4?s=100" width="100px;" alt=""/><br /><sub><b>auricom</b></sub></a><br /><a href="https://github.com/k8s-at-home/charts/commits?author=auricom" title="Code">💻</a></td>
  </tr>
  <tr>
    <td align="center"><a href="http://aaronjohnson.io"><img src="https://avatars.githubusercontent.com/u/1386238?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Aaron Johnson</b></sub></a><br /><a href="https://github.com/k8s-at-home/charts/commits?author=acjohnson" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/brujoand"><img src="https://avatars.githubusercontent.com/u/124421?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Anders Brujordet</b></sub></a><br /><a href="https://github.com/k8s-at-home/charts/commits?author=brujoand" title="Code">💻</a></td>
  </tr>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!
