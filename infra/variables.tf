variable "aws_region" {
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


variable "aws_account_id" {
  description = "AWS Account ID"
  type        = string
  default     = "011528270926"
}

variable "acm_certificate_arn" {
  description = "ARN of the ACM SSL certificate"
  type        = string
}

# VPC and Subnets
#variable "vpc_cidr" {
 # description = "VPC CIDR block"
  #type        = string
#}

variable "public_subnet_a_cidr" {
  description = "CIDR block for public subnet A"
  type        = string
}

variable "public_subnet_b_cidr" {
  description = "CIDR block for public subnet B"
  type        = string
}

variable "az_a" {
  description = "Availability Zone A"
  type        = string
}

variable "az_b" {
  description = "Availability Zone B"
  type        = string
}

# ECS and App
variable "cluster_name" {
  description = "ECS Cluster name"
  type        = string
}

variable "container_name" {
  description = "ECS Container name"
  type        = string
}

#variable "container_port" {
 # description = "Port for ECS Container"
 # type        = number
#}

variable "ecr_repository_name" {
  description = "ECR repository name"
  type        = string
}

variable "log_group_name" {
  description = "Log group name for ECS"
  type        = string
}

variable "kms_key_description" {
  description = "KMS Key description"
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}

# ALB and Target Group (TG)
#variable "sg_name" {
#  description = "Name of the security group"
#  type        = string
#}

# ACM SSL Certificate ARN (for ALB listener)
#variable "acm_certificate_arn" {
#  description = "ARN of the ACM SSL certificate"
#  type        = string
#}



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

# Optional: Declare any additional variables you put in terraform.tfvars
variable "aws_lb_name" {
  description = "Name of the Application Load Balancer"
  type        = string
}

variable "lb_target_group_name" {
  description = "Name of the Load Balancer target group"
  type        = string
}

#variable "aws_lb_name" {
#  description = "Name of the Application Load Balancer"
#  type        = string
#}

#variable "lb_target_group_name" {
 # description = "Name of the Target Group for the ALB"
 # type        = string
#}

#variable "ecs_task_definition" {
 # description = "ECS Task Definition name"
 # type        = string
#}

variable "service_name" {
  description = "Name of the ECS service"
  type        = string
}

variable "ecs_task_definition" {
  type = string
}

variable "sg_name" {
  type = string
}

#variable "cluster_name" {
#  description = "The name of the ECS cluster"
#  type        = string
#}
variable "ecs_task_execution_role_name" {
  description = "The name of the ECS task execution IAM role"
  type        = string
}
