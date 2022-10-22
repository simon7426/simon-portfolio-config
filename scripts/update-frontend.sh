#!/bin/sh

set -e

GITHUB_SHA_SHORT=$(echo $1 | cut -c1-7)
DOCKER_USERNAME=$(echo $2 | base64 -d)

cd portfolio/portfolio-frontend

kustomize edit set image $DOCKER_USERNAME/vue-portfolio-kubernetes:$GITHUB_SHA_SHORT

kustomize build > portfolio-frontend-build/portfolio-frontend-kustomize.yaml
