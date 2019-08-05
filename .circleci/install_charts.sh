#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

readonly CT_VERSION=v2.3.3
readonly KIND_VERSION=0.2.1
readonly CLUSTER_NAME=chart-testing
readonly K8S_VERSION=v1.14.0

run_ct_container() {
    echo 'Running ct container...'
    docker run --rm --interactive --detach --network host --name ct \
        --volume "$(pwd)/.circleci/ct.yaml:/etc/ct/ct.yaml" \
        --volume "$(pwd):/workdir" \
        --workdir /workdir \
        "quay.io/helmpack/chart-testing:$CT_VERSION" \
        cat
    echo
}

cleanup() {
    echo 'Removing ct container...'
    docker kill ct > /dev/null 2>&1

    echo 'Done!'
}

docker_exec() {
    docker exec --interactive ct "$@"
}

create_kind_cluster() {
    echo 'Installing kind...'

    curl -sSLo kind "https://github.com/kubernetes-sigs/kind/releases/download/$KIND_VERSION/kind-linux-amd64"
    chmod +x kind
    sudo mv kind /usr/local/bin/kind

    kind create cluster --name "$CLUSTER_NAME" --config .circleci/kind-config.yaml --image "kindest/node:$K8S_VERSION" --wait 60s

    docker_exec mkdir -p /root/.kube

    echo 'Copying kubeconfig to container...'
    local kubeconfig
    kubeconfig="$(kind get kubeconfig-path --name "$CLUSTER_NAME")"
    docker cp "$kubeconfig" ct:/root/.kube/config

    docker_exec kubectl cluster-info
    echo

    docker_exec kubectl get nodes
    echo
}

install_local_path_provisioner() {
    docker_exec kubectl delete storageclass standard
    docker_exec kubectl apply -f https://raw.githubusercontent.com/rancher/local-path-provisioner/master/deploy/local-path-storage.yaml
}

install_tiller() {
    echo 'Installing Tiller...'
    docker_exec kubectl --namespace kube-system create sa tiller
    docker_exec kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
    docker_exec helm init --service-account tiller --upgrade --wait
    echo
}

install_charts() {
    docker_exec ct install
    echo
}

main() {
    run_ct_container
    trap cleanup EXIT

    changed=$(docker_exec ct list-changed)
    if [[ -z "$changed" ]]; then
        echo 'No chart changes detected.'
        return
    fi

    echo 'Chart changes detected.'
    create_kind_cluster
    install_local_path_provisioner
    install_tiller
    install_charts
}

main
