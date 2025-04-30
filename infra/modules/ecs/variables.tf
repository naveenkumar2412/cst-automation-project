#variable "container_image {
 # description = "Image URI for the ECS container"
  #type        = string
#}

variable "container_name" {
  description = "Name of the ECS container"
  type        = string
}

variable "target_group_arn" {
  description = "ARN of the target group for the ECS service"
  type        = string
}

variable "execution_role_arn" {
  description = "IAM role ARN for ECS task execution"
  type        = string
}

variable "task_role_arn" {
  description = "IAM role ARN for ECS task"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for ECS service"
  type        = list(string)
}

variable "security_group_id" {
  description = "Security Group ID for ECS tasks"
  type        = string
}

variable "iam_role_policy_dependency" {
  description = "IAM role policy resource this service depends on"
  type        = any
  default     = null
}

variable "availability_zones" {
  description = "List of availability zones for ECS placement constraints"
  type        = list(string)
}

variable "ecr_repository_name" {
  description = "Name of the ECR repository"
  type        = string
}

variable "log_group_name" {
  description = "Name for the CloudWatch Log Group"
  type        = string
}

variable "cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
}

variable "kms_key_description" {
  description = "Description for the KMS key"
  type        = string
}

variable "iam_role_arn" {
  description = "IAM role ARN for ECS service"
  type        = string
}

variable "aws_account_id" {
  description = "AWS Account ID"
  type        = string
}

variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "ap-south-1"
}

variable "container_image" {
  description = "Image URI for the ECS container"
  type        = string
}
