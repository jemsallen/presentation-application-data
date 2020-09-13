variable "region" {
  default = "us-east-1"
}

variable "access_key" {
  default = "XXXXXXXXXXXXXXXX"
}

variable "secret_key" {
  default = "XXXXXXXXXXXXXXX"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
variable "environment" {
  default = "development"
}
variable "private_subnets_cidr" {}
variable "public_subnets_cidr" {}
variable "availability_zones" {
  default = ""
}
