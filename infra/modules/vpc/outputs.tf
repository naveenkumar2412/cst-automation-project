output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "public_subnets" {
  description = "The list of public subnet IDs"
  value       = [aws_subnet.public_a.id, aws_subnet.public_b.id]
}

