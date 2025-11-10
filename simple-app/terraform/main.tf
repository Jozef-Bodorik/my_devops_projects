terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.20"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_deployment" "simple_app" {
  metadata {
    name = "simple-app"
    labels = {
      app = "simple-app"
    }
  }
  spec {
    replicas = 2
    selector {
      match_labels = {
        app = "simple-app"
      }
    }
    template {
      metadata {
        labels = {
          app = "simple-app"
        }
      }
      spec {
        container {
          image = "jbodorik/simple-app:0.1"
          name  = "simple-app"
          port {
            container_port = 8080
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "simple_app" {
  metadata {
    name = "simple-app"
  }
  spec {
    selector = {
      app = kubernetes_deployment.simple_app.metadata[0].labels.app
    }
    port {
      port        = 80
      target_port = 8080
    }
    type = "NodePort"
  }
}
