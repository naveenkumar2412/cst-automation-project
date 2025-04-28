variable "region" {
  description = "AWS Region"
  type        = string
  default     = "ap-south-1"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "List of public subnet CIDRs"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "container_port" {
  description = "Port on which the app container listens"
  type        = number
  default     = 80
}

variable "ecr_repo_url" {
  description = "ECR Repository URL for container image"
  type        = string
}

variable "desired_count" {
  description = "Number of ECS tasks desired"
  type        = number
  default     = 1
}
