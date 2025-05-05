resource "aws_ecr_repository" "foo" {
  name                 = var.repository_name
  image_tag_mutability = "MUTABLE"
  force_delete         = true

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = var.repository_name
  }

  lifecycle {
    prevent_destroy = false
  }
}
