output "cluster_name" {
  description = "Name of the ECS Cluster"
  value       = aws_ecs_cluster.this.name
}

output "service_name" {
  description = "Name of the ECS Service"
  value       = aws_ecs_service.this.name
}
