# Helm charts
<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/all_contributors-40-orange.svg?style=flat-square)](#contributors-)
<!-- ALL-CONTRIBUTORS-BADGE:END -->

[![docs](https://img.shields.io/badge/docs-rtfm-yellow?logo=gitbook&logoColor=white&style=for-the-badge)](https://docs.k8s-at-home.com/)
[![Discord](https://img.shields.io/badge/discord-chat-7289DA.svg?maxAge=60&style=for-the-badge)](https://discord.gg/sTMX7Vh)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white&style=for-the-badge)](https://github.com/pre-commit/pre-commit)
[![renovate](https://img.shields.io/badge/renovate-enabled-brightgreen?style=for-the-badge&logo=data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjUgNSAzNzAgMzcwIj48Y2lyY2xlIGN4PSIxODkiIGN5PSIxOTAiIHI9IjE4NCIgZmlsbD0iI2ZlMiIvPjxwYXRoIGZpbGw9IiM4YmIiIGQ9Ik0yNTEgMjU2bC0zOC0zOGExNyAxNyAwIDAxMC0yNGw1Ni01NmMyLTIgMi02IDAtN2wtMjAtMjFhNSA1IDAgMDAtNyAwbC0xMyAxMi05LTggMTMtMTNhMTcgMTcgMCAwMTI0IDBsMjEgMjFjNyA3IDcgMTcgMCAyNGwtNTYgNTdhNSA1IDAgMDAwIDdsMzggMzh6Ii8+PHBhdGggZmlsbD0iI2Q1MSIgZD0iTTMwMCAyODhsLTggOGMtNCA0LTExIDQtMTYgMGwtNDYtNDZjLTUtNS01LTEyIDAtMTZsOC04YzQtNCAxMS00IDE1IDBsNDcgNDdjNCA0IDQgMTEgMCAxNXoiLz48cGF0aCBmaWxsPSIjYjMwIiBkPSJNMjg1IDI1OGw3IDdjNCA0IDQgMTEgMCAxNWwtOCA4Yy00IDQtMTEgNC0xNiAwbC02LTdjNCA1IDExIDUgMTUgMGw4LTdjNC01IDQtMTIgMC0xNnoiLz48cGF0aCBmaWxsPSIjYTMwIiBkPSJNMjkxIDI2NGw4IDhjNCA0IDQgMTEgMCAxNmwtOCA3Yy00IDUtMTEgNS0xNSAwbC05LThjNSA1IDEyIDUgMTYgMGw4LThjNC00IDQtMTEgMC0xNXoiLz48cGF0aCBmaWxsPSIjZTYyIiBkPSJNMjYwIDIzM2wtNC00Yy02LTYtMTctNi0yMyAwLTcgNy03IDE3IDAgMjRsNCA0Yy00LTUtNC0xMSAwLTE2bDgtOGM0LTQgMTEtNCAxNSAweiIvPjxwYXRoIGZpbGw9IiNiNDAiIGQ9Ik0yODQgMzA0Yy00IDAtOC0xLTExLTRsLTQ3LTQ3Yy02LTYtNi0xNiAwLTIybDgtOGM2LTYgMTYtNiAyMiAwbDQ3IDQ2YzYgNyA2IDE3IDAgMjNsLTggOGMtMyAzLTcgNC0xMSA0em0tMzktNzZjLTEgMC0zIDAtNCAybC04IDdjLTIgMy0yIDcgMCA5bDQ3IDQ3YTYgNiAwIDAwOSAwbDctOGMzLTIgMy02IDAtOWwtNDYtNDZjLTItMi0zLTItNS0yeiIvPjxwYXRoIGZpbGw9IiMxY2MiIGQ9Ik0xNTIgMTEzbDE4LTE4IDE4IDE4LTE4IDE4em0xLTM1bDE4LTE4IDE4IDE4LTE4IDE4em0tOTAgODlsMTgtMTggMTggMTgtMTggMTh6bTM1LTM2bDE4LTE4IDE4IDE4LTE4IDE4eiIvPjxwYXRoIGZpbGw9IiMxZGQiIGQ9Ik0xMzQgMTMxbDE4LTE4IDE4IDE4LTE4IDE4em0tMzUgMzZsMTgtMTggMTggMTgtMTggMTh6Ii8+PHBhdGggZmlsbD0iIzJiYiIgZD0iTTExNiAxNDlsMTgtMTggMTggMTgtMTggMTh6bTU0LTU0bDE4LTE4IDE4IDE4LTE4IDE4em0tODkgOTBsMTgtMTggMTggMTgtMTggMTh6bTEzOS04NWwyMyAyM2M0IDQgNCAxMSAwIDE2TDE0MiAyNDBjLTQgNC0xMSA0LTE1IDBsLTI0LTI0Yy00LTQtNC0xMSAwLTE1bDEwMS0xMDFjNS01IDEyLTUgMTYgMHoiLz48cGF0aCBmaWxsPSIjM2VlIiBkPSJNMTM0IDk1bDE4LTE4IDE4IDE4LTE4IDE4em0tNTQgMThsMTgtMTcgMTggMTctMTggMTh6bTU1LTUzbDE4LTE4IDE4IDE4LTE4IDE4em05MyA0OGwtOC04Yy00LTUtMTEtNS0xNiAwTDEwMyAyMDFjLTQgNC00IDExIDAgMTVsOCA4Yy00LTQtNC0xMSAwLTE1bDEwMS0xMDFjNS00IDEyLTQgMTYgMHoiLz48cGF0aCBmaWxsPSIjOWVlIiBkPSJNMjcgMTMxbDE4LTE4IDE4IDE4LTE4IDE4em01NC01M2wxOC0xOCAxOCAxOC0xOCAxOHoiLz48cGF0aCBmaWxsPSIjMGFhIiBkPSJNMjMwIDExMGwxMyAxM2M0IDQgNCAxMSAwIDE2TDE0MiAyNDBjLTQgNC0xMSA0LTE1IDBsLTEzLTEzYzQgNCAxMSA0IDE1IDBsMTAxLTEwMWM1LTUgNS0xMSAwLTE2eiIvPjxwYXRoIGZpbGw9IiMxYWIiIGQ9Ik0xMzQgMjQ4Yy00IDAtOC0yLTExLTVsLTIzLTIzYTE2IDE2IDAgMDEwLTIzTDIwMSA5NmExNiAxNiAwIDAxMjIgMGwyNCAyNGM2IDYgNiAxNiAwIDIyTDE0NiAyNDNjLTMgMy03IDUtMTIgNXptNzgtMTQ3bC00IDItMTAxIDEwMWE2IDYgMCAwMDAgOWwyMyAyM2E2IDYgMCAwMDkgMGwxMDEtMTAxYTYgNiAwIDAwMC05bC0yNC0yMy00LTJ6Ii8+PC9zdmc+)](https://github.com/renovatebot/renovate)
[![task](https://img.shields.io/badge/Task-Enabled-brightgreen?style=for-the-badge&logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAAEeElEQVR4Xu2bzU8TQRjGZ7atRQKaGAVRhBakNbYkGEPVE5IoJh403rxIgpgYwOBHPBgPxoTwDyiCelIx8SwqxhilEj9ihBCDhK8g0IIiEAqlgLi1YxZdU2DpzszOfhy2174z7/P+5nlntrtbCHT83BzqQRyAH6sc7v16yYB6JO6aCXX4Q+MFy3InR1Or0jwRrfVoCgAhZKkf7osmKrLK4dZUk2bJ7gT6UTQWw1pgCGCg0uHKxgpWGKQ6gM6Z0IPW0PgpGp1auEFVALeGehFN4SvHqAlCFQB3RwYQH03Y6sRcOABeVTjch4gHygxgCiD4c+5o09jIM9Yi4+fbPfjNVlxczIwuMwCs7I4Lj1VbKAbQOPqVD/O8FVc4yzgIwcPKbDfVBivqoAaAEDpYP9zXwrIg2rmUuIEKgNZ2xwEDOQ5UZuUR10M04PnUD/Q1PI2jR7eYJA6WlWe57uEKwAIwiFBS83DfAu6kRojDbQtZAEa0OwlgORBrAngyFmwL/JzfS5LMqLGpVq60NDOvUUqfJIDL3e3IuT7FqPVQ6ZqN8uDKTu+qeiUB7GxpWrqGv+h0UyUz2qAvs3837ob8fWQAhEEchOC8w2W0mrD0dM1Og/hfY1QAxEynM3PARpsNK7HeQYuxGOifC6+SoQiAOJvR20K0u9QiMAEgTJzEcaAiO0/vhV6WvzsyA36jxLcfmAEQM5/NygXJFl1+B/0vPopioCey2u6qOmDl5Hq1RSK7awpASLbBagPlO3I0aYveSBjwCO8Ga7wg5i0gVe0FpxvIXl8rwES66poDEBIKW9ElxhdRSgoXIWjigHjiuckp4Fj6dgXrDUBgYQ6Eo7yiOXQDICa+4HABCMkaQ3CRcCXH8qO5A2hPCxZ21/wUwF0pT0oqKNmyTTJ8ZGEOTDOyu2EBiMIuOXcB9O+nitAcnYztbngAgsAYQqBky1ZVj01djkHcdhDiDm9OJwlXFKv7Jiil3gRgOsBsAUV9TTLY3ANoboqSEKaJNTdBcxM0N0GazqEaY26C5iZI8WiMymsEg8xTwDwFDHgKCA4+0daKtLhJoUULWCBsqvP6jkt1puydSvFdAYK2JgpVFQCEoMHrS1ijLAChmgl+oejA25d+osowg9UCkD45b7uO8UotFgCxFs+bp0h49s7ywxqADXKDN7yF2M/oiACIhbNsC5YApK705BaLCoAw6f1A/9Wage5auQRy37MAcM7rTPXANKr/G1EDEAsrePcCRX4tytW55vdKAFgg/F7n9Uk/ZMBUpBiA0ragBUBjd6pjEBPkUljz+Oij6q72kyRjSAFsAjCrNt8XJMmRKJaZA+KTOF4/RlbMh6G4ACx2O6hzFTDXy3zCeBA4pwUOAFZ2V70FpBKc+fzB75+aKFrLhokAbLavK6tx7cF+9Z2mLVR1AI4bpABACGP1Xp+FpiDSMZoBEIS9R8H1pf6O+XiRKwGoaXddWkAqaXXnJ7558vvSC4YigAy7veKaq+A26QoqjdfUASvF5rY0oSNpGaDeU6ibjj9v/5xQDsUWRgAAAABJRU5ErkJggg==)](https://taskfile.dev/#/)
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
    <td align="center"><a href="https://github.com/Diaoul"><img src="https://avatars.githubusercontent.com/u/319220?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Antoine Bertin</b></sub></a><br /><a href="https://github.com/k8s-at-home/charts/commits?author=Diaoul" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/onedr0p"><img src="https://avatars.githubusercontent.com/u/213795?v=4?s=100" width="100px;" alt=""/><br /><sub><b>ᗪєνιη ᗷυнʟ</b></sub></a><br /><a href="https://github.com/k8s-at-home/charts/commits?author=onedr0p" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/Ardetus"><img src="https://avatars.githubusercontent.com/u/2253935?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Ardetus</b></sub></a><br /><a href="https://github.com/k8s-at-home/charts/commits?author=Ardetus" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/dynamicat"><img src="https://avatars.githubusercontent.com/u/12977282?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Chris Golden</b></sub></a><br /><a href="https://github.com/k8s-at-home/charts/commits?author=dynamicat" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/psychopenguin"><img src="https://avatars.githubusercontent.com/u/1420115?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Fabio Brito d'Araujo e Oliveira</b></sub></a><br /><a href="https://github.com/k8s-at-home/charts/commits?author=psychopenguin" title="Code">💻</a></td>
  </tr>
  <tr>
    <td align="center"><a href="https://github.com/allenporter"><img src="https://avatars.githubusercontent.com/u/6026418?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Allen Porter</b></sub></a><br /><a href="https://github.com/k8s-at-home/charts/commits?author=allenporter" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/rasmustwh"><img src="https://avatars.githubusercontent.com/u/2485005?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Rasmus Hermansen</b></sub></a><br /><a href="https://github.com/k8s-at-home/charts/commits?author=rasmustwh" title="Code">💻</a></td>
    <td align="center"><a href="http://pleasenoddos.com"><img src="https://avatars.githubusercontent.com/u/7714381?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Dennis Zhang</b></sub></a><br /><a href="https://github.com/k8s-at-home/charts/commits?author=FlipEnergy" title="Code">💻</a></td>
    <td align="center"><a href="https://cbergmann.net"><img src="https://avatars.githubusercontent.com/u/112864?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Clemens Bergmann</b></sub></a><br /><a href="https://github.com/k8s-at-home/charts/commits?author=cbergmann" title="Code">💻</a></td>
    <td align="center"><a href="http://norad.fr"><img src="https://avatars.githubusercontent.com/u/541709?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Arnaud Lemaire</b></sub></a><br /><a href="https://github.com/k8s-at-home/charts/commits?author=n0rad" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/dixneuf19"><img src="https://avatars.githubusercontent.com/u/1516762?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Julen Dixneuf</b></sub></a><br /><a href="https://github.com/k8s-at-home/charts/commits?author=dixneuf19" title="Code">💻</a></td>
    <td align="center"><a href="https://cajun.pro"><img src="https://avatars.githubusercontent.com/u/15788890?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Nicholas St. Germain</b></sub></a><br /><a href="https://github.com/k8s-at-home/charts/commits?author=DirtyCajunRice" title="Code">💻</a></td>
  </tr>
  <tr>
    <td align="center"><a href="https://blog.waltr.tech"><img src="https://avatars.githubusercontent.com/u/11428125?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Ryan Walter</b></sub></a><br /><a href="https://github.com/k8s-at-home/charts/commits?author=rwaltr" title="Code">💻</a></td>
    <td align="center"><a href="https://chipwolf.uk"><img src="https://avatars.githubusercontent.com/u/3164166?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Chip Wolf ‮</b></sub></a><br /><a href="https://github.com/k8s-at-home/charts/commits?author=ChipWolf" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/jr0dd"><img src="https://avatars.githubusercontent.com/u/285797?v=4?s=100" width="100px;" alt=""/><br /><sub><b>jr0dd</b></sub></a><br /><a href="https://github.com/k8s-at-home/charts/commits?author=jr0dd" title="Code">💻</a></td>
    <td align="center"><a href="https://4xxi.com"><img src="https://avatars.githubusercontent.com/u/167288?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Aleksandr Beshkenadze</b></sub></a><br /><a href="https://github.com/k8s-at-home/charts/commits?author=beshkenadze" title="Code">💻</a></td>
    <td align="center"><a href="https://unasuke.com"><img src="https://avatars.githubusercontent.com/u/4487291?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Yusuke Nakamura</b></sub></a><br /><a href="https://github.com/k8s-at-home/charts/commits?author=unasuke" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/brandon099"><img src="https://avatars.githubusercontent.com/u/1628223?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Brandon Clifford</b></sub></a><br /><a href="https://github.com/k8s-at-home/charts/commits?author=brandon099" title="Code">💻</a></td>
    <td align="center"><a href="http://www.voltaicforge.com"><img src="https://avatars.githubusercontent.com/u/19149206?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Nat Allan</b></sub></a><br /><a href="https://github.com/k8s-at-home/charts/commits?author=Truxnell" title="Code">💻</a></td>
  </tr>
  <tr>
    <td align="center"><a href="https://github.com/jmmaloney4"><img src="https://avatars.githubusercontent.com/u/5781547?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Jack Maloney</b></sub></a><br /><a href="https://github.com/k8s-at-home/charts/commits?author=jmmaloney4" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/zamnuts"><img src="https://avatars.githubusercontent.com/u/4969305?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Andrew Zammit</b></sub></a><br /><a href="https://github.com/k8s-at-home/charts/commits?author=zamnuts" title="Code">💻</a></td>
    <td align="center"><a href="https://boxingoctop.us"><img src="https://avatars.githubusercontent.com/u/3494484?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Ryan Draga</b></sub></a><br /><a href="https://github.com/k8s-at-home/charts/commits?author=TuxOtaku" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/jkroepke"><img src="https://avatars.githubusercontent.com/u/1560587?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Jan-Otto Kröpke</b></sub></a><br /><a href="https://github.com/k8s-at-home/charts/commits?author=jkroepke" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/chris-sanders"><img src="https://avatars.githubusercontent.com/u/813115?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Chris Sanders</b></sub></a><br /><a href="https://github.com/k8s-at-home/charts/commits?author=chris-sanders" title="Code">💻</a></td>
    <td align="center"><a href="https://waibel.us"><img src="https://avatars.githubusercontent.com/u/7026879?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Alex Waibel</b></sub></a><br /><a href="https://github.com/k8s-at-home/charts/commits?author=alexwaibel" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/simoncaron"><img src="https://avatars.githubusercontent.com/u/8635747?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Simon Caron</b></sub></a><br /><a href="https://github.com/k8s-at-home/charts/commits?author=simoncaron" title="Code">💻</a></td>
  </tr>
  <tr>
    <td align="center"><a href="https://github.com/Kimi450"><img src="https://avatars.githubusercontent.com/u/24758074?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Karan Samani</b></sub></a><br /><a href="https://github.com/k8s-at-home/charts/commits?author=Kimi450" title="Code">💻</a></td>
    <td align="center"><a href="http://reitermark.us"><img src="https://avatars.githubusercontent.com/u/1309829?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Markus Reiter</b></sub></a><br /><a href="https://github.com/k8s-at-home/charts/commits?author=reitermarkus" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/brenix"><img src="https://avatars.githubusercontent.com/u/1131159?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Paul N</b></sub></a><br /><a href="https://github.com/k8s-at-home/charts/commits?author=brenix" title="Code">💻</a></td>
    <td align="center"><a href="https://www.varac.net"><img src="https://avatars.githubusercontent.com/u/488213?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Varac</b></sub></a><br /><a href="https://github.com/k8s-at-home/charts/commits?author=varac" title="Code">💻</a></td>
    <td align="center"><a href="https://github.com/CoolMintChocolate"><img src="https://avatars.githubusercontent.com/u/70276626?v=4?s=100" width="100px;" alt=""/><br /><sub><b>CoolMintChocolate</b></sub></a><br /><a href="https://github.com/k8s-at-home/charts/commits?author=CoolMintChocolate" title="Code">💻</a></td>
  </tr>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!
