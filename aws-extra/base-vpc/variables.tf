variable "region" {}

variable "vpc_name" {
  type = "string"
}

variable "cidr_block" {
  type    = "string"
  default = "172.23.0.0/16"
}

variable "peer_cidr_block" {
  type    = "string"
}

variable "peer_vpc_id" {
  type   = "string"
}
