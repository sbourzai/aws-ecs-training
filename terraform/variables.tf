# Core Variables
variable "aws_region" {
  description = "The AWS region to deploy into"
  type        = string
  default     = "eu-west-1"
}

variable "project_name" {
  description = "The name of the project"
  type        = string
  default     = "ecs-demo"
}

variable "environment" {
  description = "The environment (e.g. dev, staging, prod)"
  type        = string
  default     = "dev"
}

# VPC Variables
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "The availability zones to use"
  type        = list(string)
  default     = ["eu-west-1a", "eu-west-1b"]
}

variable "private_subnet_cidrs" {
  description = "The CIDR blocks for the private subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "public_subnet_cidrs" {
  description = "The CIDR blocks for the public subnets"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

# ECS Variables
variable "instance_type" {
  description = "The instance type to use for the ECS cluster"
  type        = string
  default     = "t2.micro" # Free tier eligible
}

variable "min_instance_count" {
  description = "The minimum number of instances in the ECS cluster"
  type        = number
  default     = 1
}

variable "max_instance_count" {
  description = "The maximum number of instances in the ECS cluster"
  type        = number
  default     = 2
}

variable "desired_instance_count" {
  description = "The desired number of instances in the ECS cluster"
  type        = number
  default     = 1
}

variable "container_port" {
  description = "The port on which the container will be running"
  type        = number
  default     = 3000
}