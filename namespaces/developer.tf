resource "kubernetes_namespace" "developer" {
  metadata {
    annotations = {
      name = "developer-annotation"
    }

    labels = {
      owner = "Karsten"
    }

    name = "developer"
  }
}

output "ns_name" {
  value = kubernetes_namespace.developer.metadata[0].name
}

resource "kubernetes_limit_range" "developer" {
  metadata {
    name = "developer-limit"
    namespace = "developer"
  }
  spec {
    limit {
      type = "Pod"
      max = {
        cpu    = "200m"
        memory = "1024Mi"
      }
    }
    limit {
      type = "PersistentVolumeClaim"
      min = {
        storage = "24M"
      }
    }
    limit {
      type = "Container"
      default = {
        cpu    = "50m"
        memory = "24Mi"
      }
    }
  }
}

resource "kubernetes_ingress_v1" "developer" {
  metadata {
    name      = "developer-ingress"
    namespace = "developer"
    annotations = {
      "kubernetes.io/ingress.class" = "nginx"
    }
  }
  spec {
    rule {
      host = "dev.kroesch.net"
      http {
        path {
          backend {
            service {
              name = "onedev"
              port {
                number = 80
              }
            }
          }
          path     = "/"
          path_type = "Prefix"
        }
      }
    }
  }
}

