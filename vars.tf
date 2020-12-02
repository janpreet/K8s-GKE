variable "project" {
  type = string
}
variable "region" {
  type = string
}
variable "credentials" {
  type = string
}
variable "cluster_name" {
  type = string
}
variable "machine_type" {
  type = string
}
variable "initial_node_count" {
  type = string
}
variable "kubeconfig" {
  type = string
}
variable "oauth_scopes" {
  type = list(string)
}
variable "min_node_count" {
  type = string
}
variable "max_node_count" {
  type = string
}