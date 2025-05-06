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

variable "vpc_name" {
  description = "Tag name for the VPC"
  type        = string
}

variable "public_subnet_a_name" {
  description = "Tag name for Public Subnet A"
  type        = string
}

variable "public_subnet_b_name" {
  description = "Tag name for Public Subnet B"
  type        = string
}

variable "igw_name" {
  description = "Tag name for Internet Gateway"
  type        = string
}

variable "route_table_name" {
  description = "Tag name for Route Table"
  type        = string
}
