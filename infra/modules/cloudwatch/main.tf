terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 1.11.4"
    }
  }
}

resource "aws_cloudwatch_log_group" "app" {
  name = var.log_group_name
  retention_in_days = 7
}
