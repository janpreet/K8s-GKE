variable "credentials" {}
variable "project" {}
variable "region" {}
variable "cluster_name" {}
variable "machine_type" {}
variable "initial_node_count" {}
variable "kubeconfig" {}
variable "oauth_scopes" {
  type = list(string)
}
variable "min_node_count" {}
variable "max_node_count" {}