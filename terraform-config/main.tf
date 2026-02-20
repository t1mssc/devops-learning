terraform {
  required_providers {
    minikube = {
      source = "scott-the-programmer/minikube"
      version = "0.6.0"
    }
  }
}

provider "minikube" {
  kubernetes_version = "v1.35.0"
}

resource "minikube_cluster" "minikube_docker" {
  driver = "docker"
  cluster_name = "devops"
  addons = [
    "default-storageclass",
    "storage-provisioner"
  ]
}