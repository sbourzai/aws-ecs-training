# Core Settings
aws_region    = "eu-west-1"
project_name  = "ecs-demo" # to be changed
environment   = "dev" # to be changed

# VPC Settings
vpc_cidr = "10.0.0.0/16" # to be changed  11.0.0.0/16 for example
availability_zones = ["eu-west-1a", "eu-west-1b"]
private_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"] # to be changed 
public_subnet_cidrs  = ["10.0.101.0/24", "10.0.102.0/24"] # to be changed

# ECS Settings
instance_type = "t2.micro"
min_instance_count = 1
max_instance_count = 2
desired_instance_count = 1
container_port = 3000
