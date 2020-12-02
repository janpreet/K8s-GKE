# Remote State
terraform {
  required_version = "~>0.12"
  backend "remote" {
    organization = "Singhventures"
    workspaces {
      name = "K8s-GKE"
    }
  }
}

# Random unique username and password
resource "random_id" "username" {
  byte_length = 14
}

resource "random_id" "password" {
  byte_length = 18
}

# Variables
variable "username" {}
variable "password" {}

# GKE
module "gke-cluster" {
    source = "./gke-cluster"
    username = random_id.username.hex
    password = random_id.password.hex
    project = var.project
    region = var.region
    credentials = var.credentials
    kubeconfig = var.kubeconfig 
}
