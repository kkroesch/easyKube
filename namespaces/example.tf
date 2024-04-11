resource "kubernetes_namespace" "example" {
  metadata {
    annotations = {
      name = "example-annotation"
    }

    labels = {
      mylabel = "label-value"
    }

    name = "terraform-example-namespace"
  }
}

output "ns_name" {
  value = kubernetes_namespace.example.metadata[0].name
}

resource "kubernetes_limit_range" "example" {
  metadata {
    name = "terraform-example"
    namespace = "terraform-example-namespace"
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

resource "kubernetes_ingress_v1" "example" {
  metadata {
    name      = "example-ingress"
    namespace = "terraform-example-namespace"
    annotations = {
      "kubernetes.io/ingress.class" = "nginx"
    }
  }
  spec {
    rule {
      host = "www.example.com"
      http {
        path {
          backend {
            service {
              name = "example-service"
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

