resource "aws_kms_key" "example" {
  description = var.kms_key_description
}

resource "aws_cloudwatch_log_group" "example" {
  name = var.log_group_name
}

resource "aws_ecs_cluster" "test" {
  name = var.cluster_name

  configuration {
    execute_command_configuration {
      kms_key_id = aws_kms_key.example.arn
      logging    = "OVERRIDE"

      log_configuration {
        cloud_watch_encryption_enabled = true
        cloud_watch_log_group_name     = aws_cloudwatch_log_group.example.name
      }
    }
  }
}

resource "aws_ecs_task_definition" "service" {
  family = "service"
  container_definitions = jsonencode([{
    name      = "first"
    image     = "service-first"
    cpu       = 10
    memory    = 512
    essential = true
    portMappings = [
      {
        containerPort = 80
        hostPort      = 80
      }
    ]
  }])

  volume {
    name      = "service-storage"
    host_path = "/ecs/service-storage"
  }

  placement_constraints {
    type       = "memberOf"
    expression = "attribute:ecs.availability-zone in [\"ap-south-1a\", \"ap-south-1b\"]"
  }
}

resource "aws_ecs_service" "mongo" {
  name            = "mongodb"
  cluster         = aws_ecs_cluster.test.id
  task_definition = aws_ecs_task_definition.service.arn
  desired_count   = 3
  iam_role        = var.iam_role_arn
  depends_on      = [var.iam_role_policy_dependency]

  ordered_placement_strategy {
    type  = "binpack"
    field = "cpu"
  }

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = var.container_name
    container_port   = 80
  }

  placement_constraints {
    type       = "memberOf"
    expression = "attribute:ecs.availability-zone in ${join(", ", var.availability_zones)}"
  }
}
