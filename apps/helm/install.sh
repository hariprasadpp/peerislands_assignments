#!/bin/bash
set -e

ENV=$1

if [ -z "$ENV" ]; then
  echo "Usage: $0 <environment>"
  echo "Example: $0 prod"
  exit 1
fi

# Create namespace if it doesn’t exist
kubectl create namespace app --dry-run=client -o yaml | kubectl apply -f -

# Deploy Helm chart with the given values file
helm upgrade --install -n app python-app ./chart -f values/${ENV}.yaml

# Restart deployment to ensure pods pick up the new image/config
kubectl rollout restart deployment python-app -n app