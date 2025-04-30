output "ecs_cluster_name" {
  description = "The name of the ECS Cluster"
  value       = aws_ecs_cluster.naveenk.name
}

output "cluster_id" {
  value = aws_ecs_cluster.naveenk.id
}


output "ecs_cluster_arn" {
  description = "The ARN of the ECS Cluster"
  value       = aws_ecs_cluster.naveenk.arn
}

output "ecs_task_definition_arn" {
  description = "The ARN of the ECS Task Definition"
  value       = aws_ecs_task_definition.service.arn
}

output "ecs_service_name" {
  description = "The name of the ECS Service"
  value       = aws_ecs_service.nave.name
}

output "cloudwatch_log_group_name" {
  description = "The name of the CloudWatch Log Group used for ECS Exec"
  value       = aws_cloudwatch_log_group.example.name
}

output "kms_key_arn" {
  description = "The ARN of the KMS key used for ECS Exec logging"
  value       = aws_kms_key.example.arn
}

