terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
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


module "namespaces" {
  source = "./namespaces"
}

module "ingress" {
  source = "./ingress"
}

