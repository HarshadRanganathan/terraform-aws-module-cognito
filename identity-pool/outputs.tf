output "id" {
  description = "An identity pool ID in the format"
  value       = aws_cognito_identity_pool.main.*.id
}

output "arn" {
  description = "The ARN of the identity pool"
  value = aws_cognito_identity_pool.main.*.arn
}