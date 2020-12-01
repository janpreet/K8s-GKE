terraform {
  required_version = "~>0.12"
  backend "remote" {
    organization = "Singhventures"
    workspaces {
      name = "K8s-GKE-Deploy"
    }
  }
}