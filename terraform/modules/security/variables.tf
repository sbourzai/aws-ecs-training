variable "name_prefix" {
  description = "Prefix to use for resource names"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "container_port" {
  description = "The port on which the container will be running"
  type        = number
  default     = 3000
}

variable "management_cidrs" {
  description = "CIDR blocks allowed to access instances via SSH"
  type        = list(string)
  default     = ["0.0.0.0/0"] # Restrict this in production!
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}