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
}

module "ecr" {
  source           = "./modules/ecr"
  repository_name  = "naveen-ecr"
}

module "ecs" {
  source = "./modules/ecs"

  log_group_name               = "example"
  cluster_name                 = "naveenk"
  kms_key_description          = "example"
  container_image              = "service-first"
  container_name               = "nave-first"
  target_group_arn             = module.alb.target_group_arn
  iam_role_arn                 = module.iam.ecs_task_execution_role_arn
  iam_role_policy_dependency   = null
  availability_zones           = ["ap-south-1a", "ap-south-1b"]
}
