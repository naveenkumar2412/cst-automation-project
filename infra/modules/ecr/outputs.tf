output "repository_url" {
  description = "The URL of the created ECR repository"
  value       = aws_ecr_repository.foo.repository_url
}

output "repository_arn" {
  description = "The ARN of the created ECR repository"
  value       = aws_ecr_repository.foo.arn
}

output "repository_name" {
  description = "The name of the created ECR repository"
  value       = aws_ecr_repository.foo.name
}
