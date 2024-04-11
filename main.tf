terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.28.1"
    }
  }
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "kind-kind"
}

provider "helm" {
  kubernetes {
    # Inherit from the kubernetes provider
    config_path = "~/.kube/config"
  }
}


resource "kubernetes_ingress_class" "nginx-ingress" {
  metadata {
    name = "nginx"
  }
  spec {
    controller = "k8s.io/ingress-nginx"
  }
}


/*
 * Namespaces Management
 */

module "namespaces" {
  source = "./namespaces"
}


data "kubernetes_all_namespaces" "allns" {}

output "all-ns" {
  value = data.kubernetes_all_namespaces.allns.namespaces
}

output "ns-present" {
  value = contains(data.kubernetes_all_namespaces.allns.namespaces, "kube-system")
}

/*
 * Storage Management
 */

module "storage" {
  source = "./storage"
}

