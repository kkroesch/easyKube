resource "kubernetes_namespace" "office" {
  metadata {
    name = "office"
  }
}


resource "kubernetes_limit_range" "office" {
  metadata {
    name = "office-limit"
    namespace = "office"
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
        storage = "120M"
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
