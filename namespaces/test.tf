resource "kubernetes_namespace" "test" {
  metadata {
    name = "nginx"
  }
}


output "ns_test_name" {
  value = kubernetes_namespace.test.metadata[0].name
}

