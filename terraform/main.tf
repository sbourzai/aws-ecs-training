# AWS ECS Deployment with Terraform

locals {
  name_prefix = "${var.project_name}-${var.environment}"
  container_image_uri = "376129874106.dkr.ecr.eu-west-1.amazonaws.com/ecs-demo-repo:latest"
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}

# VPC and Network Resources
module "vpc" {
  source = "./modules/vpc"
  
  name_prefix      = local.name_prefix
  cidr_block       = var.vpc_cidr
  azs              = var.availability_zones
  private_subnets  = var.private_subnet_cidrs
  public_subnets   = var.public_subnet_cidrs
  tags             = local.common_tags
}

# Security Groups
module "security_groups" {
  source = "./modules/security"
  
  name_prefix = local.name_prefix
  vpc_id      = module.vpc.vpc_id
  tags        = local.common_tags
}

# ECR Repository
module "ecr" {
  source = "./modules/ecr"
  
  repository_name = "${local.name_prefix}-repo"
  tags            = local.common_tags
}

# ECS Cluster
module "ecs" {
  source = "./modules/ecs"
  
  name_prefix                  = local.name_prefix
  vpc_id                       = module.vpc.vpc_id
  public_subnet_ids            = module.vpc.public_subnet_ids
  private_subnet_ids           = module.vpc.private_subnet_ids
  instance_type                = var.instance_type
  max_size                     = var.max_instance_count
  min_size                     = var.min_instance_count
  desired_capacity             = var.desired_instance_count
  ecs_instance_security_groups = [module.security_groups.ecs_instance_sg_id]
  container_image              = local.container_image_uri
  container_port               = var.container_port
  lb_security_group_id         = module.security_groups.alb_sg_id
  tags                         = local.common_tags
}

# Outputs
output "ecr_repository_url" {
  description = "The URL of the ECR Repository"
  value       = module.ecr.repository_url
}

output "alb_dns_name" {
  description = "DNS name of the load balancer"
  value       = module.ecs.alb_dns_name
}

output "ecs_cluster_name" {
  description = "Name of the ECS Cluster"
  value       = module.ecs.cluster_name
}
