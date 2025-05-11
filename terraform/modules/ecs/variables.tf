variable "name_prefix" {
  description = "Prefix to use for resource names"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "instance_type" {
  description = "EC2 instance type for the ECS cluster"
  type        = string
  default     = "t2.micro"
}

variable "min_size" {
  description = "Minimum size of the ECS cluster"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum size of the ECS cluster"
  type        = number
  default     = 3
}

variable "desired_capacity" {
  description = "Desired capacity of the ECS cluster"
  type        = number
  default     = 1
}

variable "ecs_instance_security_groups" {
  description = "Security groups for the ECS instances"
  type        = list(string)
}

variable "container_image" {
  description = "Docker image for the container"
  type        = string
}

variable "container_port" {
  description = "Port on which the container is listening"
  type        = number
  default     = 3000
}

variable "lb_security_group_id" {
  description = "Security group ID for the load balancer"
  type        = string
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}