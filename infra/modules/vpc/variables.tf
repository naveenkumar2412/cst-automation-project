variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_a_cidr" {
  description = "CIDR block for Public Subnet A"
  type        = string
}

variable "public_subnet_b_cidr" {
  description = "CIDR block for Public Subnet B"
  type        = string
}

variable "az_a" {
  description = "Availability Zone for Subnet A"
  type        = string
}

variable "az_b" {
  description = "Availability Zone for Subnet B"
  type        = string
}

