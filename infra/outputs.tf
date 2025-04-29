output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_subnets" {
  description = "Public subnet IDs"
  value       = module.vpc.public_subnet_ids
}

output "load_balancer_dns_name" {
  value = module.alb.load_balancer_dns_name
}

output "load_balancer_arn" {
  value = module.alb.load_balancer_arn
}

output "target_group_arn" {
  value = module.alb.target_group_arn
}

output "ecs_cluster_id" {
  value       = module.ecs.ecs_cluster_id
  description = "ID of the ECS Cluster"
}

output "ecs_cluster_name" {
  value       = module.ecs.ecs_cluster_name
  description = "Name of the ECS Cluster"
}

output "task_definition_arn" {
  value       = module.ecs.task_definition_arn
  description = "ARN of the ECS Task Definition"
}

output "kms_key_arn" {
  value       = module.ecs.kms_key_arn
  description = "ARN of the KMS Key used for ECS Exec"
}

output "log_group_name" {
  value       = module.ecs.log_group_name
  description = "Name of the CloudWatch Log Group"
}

output "ecs_service_name" {
  value       = module.ecs.ecs_service_name
  description = "Name of the ECS Service"
}


