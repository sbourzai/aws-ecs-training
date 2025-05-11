output "repository_url" {
  description = "The URL of the repository"
  value       = aws_ecr_repository.repo.repository_url
}

output "repository_name" {
  description = "The name of the repository"
  value       = aws_ecr_repository.repo.name
}