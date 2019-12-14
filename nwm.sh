function jump {

    gpset $1

    if [[ "$1" == "dev" ]]; then
        export vpc=vpc-cpay-dev
        export REGION=europe-west2
    elif [[ "$1" == "sandbox" ]]; then
        export vpc=k8s
        export REGION=europe-west1
    else
        export vpc=vpc-"$1"
        export REGION=europe-west2
    fi

    export JUMPBOX_K8S_IP=$(gcloud container clusters describe kubernetes --region $REGION --format json | jq -r '.privateClusterConfig.privateEndpoint')

    gcloud container clusters get-credentials --region $REGION kubernetes
    kubectl config set-cluster "gke_$(gcloud config get-value project)_${REGION}_kubernetes" --server=https://kubernetes:9090

    gcloud compute ssh $vpc-jumpbox -- -o ServerAliveInterval=5 -o ServerAliveCountMax=1 -o StrictHostKeyChecking=no \
        -L 9090:$JUMPBOX_K8S_IP:443
}

function jump-shared {

    gpset shared

    export RUNNER_IP="$(gcloud compute instances list --filter 'name:gitlab' --format json | jq -r '.[0].networkInterfaces[0].networkIP')"

    gcloud compute ssh vpc-shared-services-jumpbox -- -o ServerAliveInterval=5 -o ServerAliveCountMax=1 -o StrictHostKeyChecking=no \
        -L 2222:$RUNNER_IP:22
}
