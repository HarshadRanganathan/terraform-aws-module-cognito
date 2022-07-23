output "app_clients" {
  description = "App clients for the user pool"
  value       = [for client in aws_cognito_user_pool_client.main: {
    name: client.name
    id: client.id
    secret: client.client_secret
  }]
}

output "aws_cognito_users" {
  description = "aws cognito users for user pool"
  value       = [for user in aws_cognito_user.default: {
    username: user.username
    attributes: user.attributes
  }]
}
