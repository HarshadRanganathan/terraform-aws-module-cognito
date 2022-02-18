output "client_id" {
  description = "The id of the user pool client"
  value       = join("", aws_cognito_user_pool_client.main.*.id)
}

output "client_secret" {
  description = "The secret of the user pool client"
  value       = join("", aws_cognito_user_pool_client.main.*.client_secret)
}
