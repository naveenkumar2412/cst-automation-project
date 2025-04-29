variable "ecs_task_execution_role_name" {
  description = "Name of the ECS Task Execution IAM Role"
  type        = string
  default     = "ecsTaskExecutionRole"
}

variable "ecs_task_execution_policy_arn" {
  description = "IAM policy ARN to attach to the ECS Task Execution Role"
  type        = string
  default     = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}
