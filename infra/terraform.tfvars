# VPC and Subnets
vpc_cidr             = "10.0.0.0/16"
public_subnet_a_cidr = "10.0.1.0/24"
public_subnet_b_cidr = "10.0.2.0/24"
az_a                 = "ap-south-1a"
az_b                 = "ap-south-1b"


# ECS and App
cluster_name         = "naveenk"
container_name       = "nave-first"
container_port       = 80
ecr_repository_name  = "naveen-ecr"
log_group_name       = "example"
kms_key_description  = "KMS key for ECS logs"
availability_zones   = ["ap-south-1a", "ap-south-1b"]


#alb and tg
#alb_Name       = "nave-app-lb"
#tg_name        = "my-app-tg"


#sg
sg_Name = "nave-alb-sg"

#iam
#ecs_task_execution_role_name    = "ecsTaskExecutionRole"

# AWS managed policy for ECS task execution
#ecs_task_execution_policy_arn   = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"

#alb
acm_certificate_arn = "arn:aws:acm:ap-south-1:011528270926:certificate/109b00df-b17c-494a-b1c6-94104112274a"





