# cst-automation-project
# terraform project

Description:
Designed and implemented a fully automated CI/CD pipeline to deploy a containerized CRUD application on Amazon ECS using infrastructure as code with Terraform and GitHub Actions.

Key Responsibilities:

Developed Terraform scripts to provision AWS resources including VPC, subnets, ECS Cluster, ECS Task Definition, Load Balancer, IAM roles, and related infrastructure.

Containerized the CRUD application using Docker and stored images in Amazon ECR.

Set up a GitHub Actions workflow to automate the build, test, image push to ECR, and deployment to ECS on every code commit.

Ensured secure credential handling using GitHub Secrets and IAM roles.

Implemented proper logging and monitoring for ECS services using AWS CloudWatch.

Achieved a zero-downtime deployment pipeline with rollback capability in case of failure.

Technologies Used:
Terraform, GitHub Actions, AWS ECS (Fargate), ECR, CloudWatch, IAM, Docker, Git, CI/CD
