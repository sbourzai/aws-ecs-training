output "alb_sg_id" {
  description = "The ID of the ALB security group"
  value       = aws_security_group.alb.id
}

output "ecs_instance_sg_id" {
  description = "The ID of the ECS instance security group"
  value       = aws_security_group.ecs_instance.id
}