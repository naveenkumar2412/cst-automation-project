output "alb_sg_id" {
  value = aws_security_group.alb_sg.id
}

output "ecs_security_group_id" {
  description = "Security Group ID for ECS tasks"
  value       = aws_security_group.alb_sg.id
}

