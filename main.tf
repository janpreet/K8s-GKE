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

# Cluster resource
resource "google_container_cluster" "primary" {
  name               = var.cluster_name
  location           = var.region
  master_auth {
    username = random_id.username.hex
    password = random_id.password.hex

    client_certificate_config {
      issue_client_certificate = true
    }
  }
  node_pool {
    name = "default-pool"
    initial_node_count = var.initial_node_count
    node_config {
      machine_type = var.machine_type
      oauth_scopes = var.oauth_scopes
      metadata = {
        disable-legacy-endpoints = "true"
      }
    }
    management {
      auto_repair = true
    }    
    autoscaling {
      min_node_count = var.min_node_count
      max_node_count = var.max_node_count
    }
  }    
  timeouts {
    create = "30m"
    update = "40m"
  }
}

# Kubeconfig
data "template_file" "kubeconfig" {
  template = file("./template/kubeconfig.tpl")
  vars = {
    cluster_name    = google_container_cluster.primary.name
    endpoint        = google_container_cluster.primary.endpoint
    user_name       = google_container_cluster.primary.master_auth.0.username
    user_password   = google_container_cluster.primary.master_auth.0.password
    cluster_ca      = google_container_cluster.primary.master_auth.0.cluster_ca_certificate
    client_cert     = google_container_cluster.primary.master_auth.0.client_certificate
    client_cert_key = google_container_cluster.primary.master_auth.0.client_key
  }

}

resource "local_file" "kubeconfiggke" {
  content  = data.template_file.kubeconfig.rendered
  filename = var.kubeconfig
}