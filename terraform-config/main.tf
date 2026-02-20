terraform {
  required_providers {
    minikube = {
      source = "scott-the-programmer/minikube"
      version = "0.6.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.12"
    }
  }
}

provider "minikube" {
  kubernetes_version = "v1.35.0"
}

resource "minikube_cluster" "minikube_docker" {
  driver = "docker"
  cluster_name = "devops"

  memory = 4096
  cpus   = 2

  addons = [
    "default-storageclass",
    "storage-provisioner"
  ]
}