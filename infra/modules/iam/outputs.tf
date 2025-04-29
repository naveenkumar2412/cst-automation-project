output "ecs_task_execution_role_name" {
  description = "The name of the ECS Task Execution IAM Role"
  value       = aws_iam_role.ecs_task_execution_role.name
}

output "ecs_task_execution_role_arn" {
  description = "The ARN of the ECS Task Execution IAM Role"
  value       = aws_iam_role.ecs_task_execution_role.arn
}

output "ecs_task_execution_role_unique_id" {
  description = "The unique ID assigned by AWS to the IAM role"
  value       = aws_iam_role.ecs_task_execution_role.unique_id
}
