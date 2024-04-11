resource "kubernetes_persistent_volume_claim" "shared-claim" {
  metadata {
    name = "shared-claim"
  }
  spec {
    access_modes = ["ReadWriteMany"]
    resources {
      requests = {
        storage = "2Gi"
      }
    }
    volume_name = "${kubernetes_persistent_volume.shared-public.metadata.0.name}"
  }
}


resource "kubernetes_persistent_volume" "shared-public" {
  metadata {
    name = "shared-public"
  }
  spec {
    capacity = {
      storage = "2Gi"
    }
    access_modes = ["ReadWriteMany"]
    persistent_volume_source {
      vsphere_volume {
        volume_path = "/mnt/share"
      }
    }
  }
}
