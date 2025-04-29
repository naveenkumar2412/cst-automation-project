variable "log_group_name" {
  description = "Name for the CloudWatch Log Group"
  type        = string
  default     = "example"
}

variable "cluster_name" {
  description = "Name for the ECS Cluster"
  type        = string
  default     = "example"
}

variable "kms_key_description" {
  description = "Description for the KMS key"
  type        = string
  default     = "example"
}

variable "container_image" {
  description = "Image URI for the ECS container"
  type        = string
  default     = "service-first"
}

variable "container_name" {
  description = "Name of the ECS container"
  type        = string
  default     = "first"
}

variable "target_group_arn" {
  description = "ARN of the target group for the ECS service"
  type        = string
}

variable "iam_role_arn" {
  description = "IAM role ARN for ECS service"
  type        = string
}

variable "iam_role_policy_dependency" {
  description = "IAM role policy resource this service depends on"
  type        = any
}

variable "availability_zones" {
  description = "List of availability zones for ECS placement constraints"
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b"]
}
