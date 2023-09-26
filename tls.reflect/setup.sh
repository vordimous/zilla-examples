#!/bin/bash
set -ex

# Install Zilla to the Kubernetes cluster with helm and wait for the pod to start up
ZILLA_CHART=oci://ghcr.io/aklivity/charts/zilla
VERSION=0.9.46
helm install zilla-tls-reflect $ZILLA_CHART --version $VERSION --namespace zilla-tls-reflect --create-namespace --wait \
    --values values.yaml \
    --set-file zilla\\.yaml=zilla.yaml \
    --set-file secrets.tls.data.localhost\\.p12=tls/localhost.p12

# Start port forwarding
kubectl port-forward --namespace zilla-tls-reflect service/zilla-tls-reflect 23456 > /tmp/kubectl-zilla.log 2>&1 &
until nc -z localhost 23456; do sleep 1; done