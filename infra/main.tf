module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = "10.0.0.0/16"
  public_subnet_a_cidr = "10.0.1.0/24"
  public_subnet_b_cidr = "10.0.2.0/24"
  az_a = "ap-south-1a"
  az_b = "ap-south-1b"
  vpc_name              = var.vpc_name
  public_subnet_a_name  = var.public_subnet_a_name
  public_subnet_b_name  = var.public_subnet_b_name
  igw_name              = var.igw_name
  route_table_name      = var.route_table_name
}


module "iam" {
  source = "./modules/iam"
  ecs_task_execution_role_name = var.ecs_task_execution_role_name
}

module "sg" {
  source    = "./modules/sg"
  vpc_id    = module.vpc.vpc_id
  sg_name   = var.sg_name
  container_port = 80
}

module "alb" {
  source            = "./modules/alb"
  public_subnet_ids = module.vpc.public_subnet_ids
  container_port    = 80
  vpc_id            = module.vpc.vpc_id
  alb_sg_id         = module.sg.alb_sg_id
  acm_certificate_arn = var.acm_certificate_arn
  aws_lb_name          = var.aws_lb_name
  lb_target_group_name = var.lb_target_group_name
}

module "ecr" {
  source           = "./modules/ecr"
  repository_name  = "naveencst"
}

data "aws_caller_identity" "current" {}

module "ecs" {
  source = "./modules/ecs"

  log_group_name               = var.log_group_name
  ecs_cluster_id               = module.ecs.cluster_id
  kms_key_description          = "example"
  cluster_name                 = var.cluster_name
  service_name                 = var.service_name
  ecs_task_definition          = var.ecs_task_definition
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


