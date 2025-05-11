# Core Settings
aws_region    = "eu-west-1"
project_name  = "ecs-demo"
environment   = "dev"

# VPC Settings
vpc_cidr = "10.0.0.0/16"
availability_zones = ["eu-west-1a", "eu-west-1b"]
private_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
public_subnet_cidrs  = ["10.0.101.0/24", "10.0.102.0/24"]

# ECS Settings
instance_type = "t2.micro"
min_instance_count = 1
max_instance_count = 2
desired_instance_count = 1
container_port = 3000
