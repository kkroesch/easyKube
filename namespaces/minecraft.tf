resource "kubernetes_namespace" "minecraft" {
  metadata {
    name = "minecraft"
  }
}

output "ns_minecraft_name" {
  value = kubernetes_namespace.minecraft.metadata[0].name
}


