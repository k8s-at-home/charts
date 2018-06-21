# personal helm charts

See [instructions](https://andrewlock.net/how-to-create-a-helm-chart-repository-using-amazon-s3/) and [helm s3 plugin repo](https://github.com/hypnoglow/helm-s3)

## Installation

```bash
helm plugin install https://github.com/hypnoglow/helm-s3.git
source .env
helm s3 init s3://public/charts
```


