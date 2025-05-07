# VPC and Subnets
vpc_cidr             = "10.0.0.0/16"
public_subnet_a_cidr = "10.0.1.0/24"
public_subnet_b_cidr = "10.0.2.0/24"
az_a                 = "ap-south-1a"
az_b                 = "ap-south-1b"
vpc_name             = "naveencst-main-vpc"
public_subnet_a_name = "naveencst-public-subnet-a"
public_subnet_b_name = "naveencst-public-subnet-b"
igw_name             = "naveencst-internet-gateway"
route_table_name     = "naveencst-route-table"

#iam
ecs_task_execution_role_name = "naveencst"


# ECS and App
cluster_name         = "naveencst"
container_name       = "naveencst"
container_port       = 80
ecr_repository_name  = "naveencst"
log_group_name       = "naveencst"
service_name         = "naveencst"
ecs_task_definition  = "naveencst"
kms_key_description  = "KMS key for ECS logs"
availability_zones   = ["ap-south-1a", "ap-south-1b"]



# AWS Account and Region
aws_account_id       = "011528270926"         
aws_region           = "ap-south-1"


# ACM (for HTTPS Listener)
acm_certificate_arn  = "arn:aws:acm:ap-south-1:011528270926:certificate/109b00df-b17c-494a-b1c6-94104112274a"


# Security Groups
sg_name              = "naveencst-alb-sg"


#alb
lb_target_group_name = "naveencst"
aws_lb_name          = "naveencst"




