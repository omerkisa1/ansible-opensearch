variable "portvmind_application_credential_id" { type = string}
variable "portvmind_application_credential_secret" { type = string}
variable "tenant_id" {type = string}
variable "ubuntu_image_id" {type = string}
variable "external_network_id" {type = string}
variable "medium_flavor_id" {type = string}
variable "opensearch_network_cidr" {
  type    = string
  default = "10.5.0.0/24"
}
