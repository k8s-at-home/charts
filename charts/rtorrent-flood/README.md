# rTorrent/flood BitTorrent client

## Setup

NB: This chart will start 2 containers in a single pod, when both containers are started, you will be able to configure flood.

1. Install the chart `helm install rtorrent k8s-at-home/rtorrent-flood`

2. Port-forward to the container `kubectl port-forward $(kubectl get pods -A -o json | jq '.items[] | select(.metadata.labels."app.kubernetes.io/name"=="rtorrent-flood")' | jq .metadata.name -r) 3000:3000`

3. To connect flood to rtorrent, provide the socket path : `/tmp/rtorrent.sock`

4. When connected with flood to rtorrent, go to the settings and change the download path to `/data` which is set by default by the chart

5. You should be able to start downloading torrents now :)


## Custom parameters

Like any other chart, you can provide a file with your own values (check `./values.yaml` for reference) :

`helm install rtorrent k8s-at-home/rtorrent-flood -f my-values.yaml`


## Pitfalls

You may need to change the StorageClass depending on your kubernetes setup or the containers won't start, use a custom `values.yaml` file to do so.