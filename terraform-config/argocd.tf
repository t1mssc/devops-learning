resource "helm_release" "argocd" {
  depends_on = [minikube_cluster.minikube_docker]
  name = "argocd"
  chart = "argo-cd"
  repository = "https://argoproj.github.io/argo-helm/"
  version = "9.4.3"
  namespace = "argocd"
  create_namespace = "true"
  values = [
    <<EOF
    server:
        service:
            type: ClusterIP
    EOF        
  ]
}

output "argocd_url" {
  value       = "Run: minikube service argocd-server -n argocd --url"
  description = "Command to get ArgoCD UI URL"
}

output "argocd_admin_password_command" {
  value       = "kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath='{.data.password}' | base64 -d"
  description = "Command to retrieve the initial ArgoCD admin password"
}
