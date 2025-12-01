terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "~> 2.3"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_manifest" "myapp_deploy" {
  manifest = yamldecode(file("${path.module}/../k8s/deployment.yaml"))
}

resource "kubernetes_manifest" "myapp_service" {
  manifest = yamldecode(file("${path.module}/../k8s/service.yaml"))
}
