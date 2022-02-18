output "app_clients" {
  description = "App clients for the user pool"
  value       = [for client in aws_cognito_user_pool_client.main: {
    name: client.name
    id: client.id
    secret: client.client_secret
  }]
}
