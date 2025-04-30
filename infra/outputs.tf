output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_subnets" {
  description = "Public subnet IDs"
  value       = module.vpc.public_subnet_ids
}

output "load_balancer_dns_name" {
  description = "DNS name of the Load Balancer"
  value       = module.alb.load_balancer_dns_name
}

output "load_balancer_arn" {
  description = "ARN of the Load Balancer"
  value       = module.alb.load_balancer_arn
}

output "target_group_arn" {
  description = "ARN of the target group for the ECS service"
  value       = module.alb.target_group_arn
}

output "ecs_cluster_id" {
  description = "ID of the ECS Cluster"
  value       = module.ecs.ecs_cluster_arn  # Corrected to ecs_cluster_arn for ARN
}

output "ecs_cluster_name" {
  description = "Name of the ECS Cluster"
  value       = module.ecs.ecs_cluster_name
}

output "task_definition_arn" {
  description = "ARN of the ECS Task Definition"
  value       = module.ecs.ecs_task_definition_arn
}

output "kms_key_arn" {
  description = "ARN of the KMS Key used for ECS Exec"
  value       = module.ecs.kms_key_arn
}

output "log_group_name" {
  description = "Name of the CloudWatch Log Group"
  value       = module.ecs.cloudwatch_log_group_name  # Corrected to match the actual output name
}

output "ecs_service_name" {
  description = "Name of the ECS Service"
  value       = module.ecs.ecs_service_name
}


