module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = "10.0.0.0/16"
  public_subnet_a_cidr = "10.0.1.0/24"
  public_subnet_b_cidr = "10.0.2.0/24"
  az_a = "ap-south-1a"
  az_b = "ap-south-1b"
}

module "sg" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id
  container_port = 80
}

module "iam" {
  source = "./modules/iam"
}

module "cloudwatch" {
  source = "./modules/cloudwatch"
  log_group_name = "/ecs/my-app"
}

module "alb" {
  source = "./modules/alb"
  alb_sg_id = module.sg.alb_sg_id
  subnet_ids = module.vpc.public_subnets
  vpc_id = module.vpc.vpc_id
  target_port = 80
}

module "ecs" {
  source = "./modules/ecs"
  ecr_repo_name = "my-app-repo"
  cluster_name = "my-app-cluster"
  family_name = "my-app-family"
  container_name = "my-app-container"
  container_port = 80
  ecr_repo_url = "1234567890.dkr.ecr.us-east-1.amazonaws.com/my-app-repo"
  execution_role_arn = module.iam.task_execution_role_arn
  subnet_ids = module.vpc.public_subnets
  ecs_sg_id = module.sg.ecs_sg_id
  target_group_arn = module.alb.target_group_arn
  log_group_name = module.cloudwatch.log_group_name
  region = "ap-south-1"
  service_name = "my-app-service"
}
