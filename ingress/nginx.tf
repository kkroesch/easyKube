resource "helm_release" "nginx_ingress" {
  name       = "nginx-ingress"
  namespace  = kubernetes_namespace.example.metadata[0].name
  repository = "https://helm.nginx.com/stable"
  chart      = "nginx-ingress"
  version    = "0.9.1" 

  set {
    name  = "controller.kind"
    value = "DaemonSet"
  }

  set {
    name  = "controller.hostNetwork"
    value = "true"
  }
}


