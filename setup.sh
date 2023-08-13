helm uninstall argocd -n argocd

kubectl delete  CustomResourceDefinition applications.argoproj.io applicationsets.argoproj.io appprojects.argoproj.io

helm install argocd argo/argo-cd -n argocd

kubectl get all -n argocd

sleep 50
kubectl -n argocd get secret argocd-initial-admin-secret -n argocd -o jsonpath="{.data.password}" | base64 -d

kubectl port-forward svc/argocd-server -n argocd 8080:443
