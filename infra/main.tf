module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = "10.0.0.0/16"
  public_subnet_a_cidr = "10.0.1.0/24"
  public_subnet_b_cidr = "10.0.2.0/24"
  az_a = "ap-south-1a"
  az_b = "ap-south-1b"
}


module "iam" {
  source = "./modules/iam"
}

module "sg" {
  source    = "./modules/sg"
  vpc_id    = module.vpc.vpc_id
  container_port = 80
}

module "alb" {
  source            = "./modules/alb"
  public_subnet_ids = module.vpc.public_subnet_ids
  container_port    = 80
  vpc_id            = module.vpc.vpc_id
  alb_sg_id         = module.sg.alb_sg_id
  acm_certificate_arn = var.acm_certificate_arn
}

module "ecr" {
  source           = "./modules/ecr"
  repository_name  = "naveen-ecr"
}

data "aws_caller_identity" "current" {}

module "ecs" {
  source = "./modules/ecs"

  log_group_name               = "example"
  ecs_cluster_id               = module.ecs.cluster_id
  kms_key_description          = "example"
  aws_account_id               = var.aws_account_id
  ecr_repository_name          = module.ecr.repository_name
  container_image              = "${var.aws_account_id}.dkr.ecr.${var.aws_region}.amazonaws.com/${module.ecr.repository_name}:latest"
  container_name               = "nave-first"
  target_group_arn             = module.alb.target_group_arn
  iam_role_arn                 = module.iam.ecs_task_execution_role_arn
  iam_role_policy_dependency   = null
  availability_zones           = ["ap-south-1a", "ap-south-1b"]

  execution_role_arn           = module.iam.ecs_task_execution_role_arn
  task_role_arn                = module.iam.ecs_task_execution_role_arn
  subnet_ids                   = module.vpc.public_subnet_ids
  security_group_id            = module.sg.ecs_security_group_id
}

module "s3_backend" {
  source              = "./modules/s3-backend"
  bucket_name         = "naveen-terraform-state-bucket"
  dynamodb_table_name = "naveen-terraform-locks"
}

