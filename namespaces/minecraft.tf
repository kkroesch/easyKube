resource "kubernetes_namespace" "minecraft" {
  metadata {
    name = "minecraft"
  }
}

resource "kubernetes_service_account" "minecraft-admin" {
  metadata {
    name = "minecraft-admin"
  }
}

resource "kubernetes_secret" "minecraft-admin" {
  metadata {
    annotations = {
      "kubernetes.io/service-account.name" = kubernetes_service_account.minecraft-admin.metadata.0.name
    }

    generate_name = "minecraft-admin-"
  }

  type                           = "kubernetes.io/service-account-token"
  wait_for_service_account_token = true
}
