kubectl create namespace app --dry-run=client -o yaml | kubectl apply -f -

helm upgrade --install -n app python-ap ./chart -f values/$1.yaml

kubectl rollout restart deployment python-app -n app