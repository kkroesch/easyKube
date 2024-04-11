
resource "kubernetes_persistent_volume" "nfs_pv" {
  metadata {
    name = "mein-nfs-pv"
  }
  spec {
    capacity = {
      storage = "5Gi"
    }
    access_modes = ["ReadWriteMany"]
    persistent_volume_source {
      nfs {
        server = "dein.nfs.server"
        path   = "/der/pfad/zur/freigabe"
      }
    }
  }
}

