variable "public_subnet_ids" {
  type = list(string)
}

variable "container_port" {
  type = number
}

variable "vpc_id" {
  type = string
}

variable "alb_sg_id" {
  type = string
}

