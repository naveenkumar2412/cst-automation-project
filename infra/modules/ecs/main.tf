resource "aws_kms_key" "example" {
  description = var.kms_key_description
}

resource "aws_cloudwatch_log_group" "example" {
  name              = var.log_group_name
  retention_in_days = 14
}

resource "aws_ecs_cluster" "naveenk" {
  name = "naveenk"
}

data "aws_caller_identity" "current" {}

locals {
  container_image_uri = "${data.aws_caller_identity.current.account_id}.dkr.ecr.${var.aws_region}.amazonaws.com/${var.ecr_repository_name}:latest"
}

resource "aws_ecs_task_definition" "service" {
  family                   = "service"
  requires_compatibilities = ["FARGATE"]
  network_mode            = "awsvpc"
  cpu                     = "256"
  memory                  = "512"
  execution_role_arn      = var.execution_role_arn
  task_role_arn           = var.task_role_arn

  container_definitions = jsonencode([{
    name      = var.container_name
    image     = var.container_image
    cpu       = 10
    memory    = 512
    essential = true
    portMappings = [{
      containerPort = 80
      protocol      = "tcp"
    }]
  }])
}

resource "aws_ecs_service" "nave" {
  name            = "nave-first"
  cluster         = var.ecs_cluster_id  
  task_definition = aws_ecs_task_definition.service.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = var.container_name
    container_port   = 80
  }

  network_configuration {
    subnets          = var.subnet_ids
    security_groups  = [var.security_group_id]
    assign_public_ip = true
  }

  depends_on = [aws_ecs_cluster.naveenk]  
}

