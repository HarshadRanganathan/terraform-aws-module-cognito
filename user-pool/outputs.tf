output "id" {
  description = "The id of the user pool"
  value       = aws_cognito_user_pool.main.*.id
}

output "arn" {
  description = "The ARN of the user pool."
  value       = aws_cognito_user_pool.main.*.arn
}

output "endpoint" {
  description = "The endpoint name of the user pool. Example format: cognito-idp.REGION.amazonaws.com/xxxx_yyyyy"
  value       = aws_cognito_user_pool.main.*.endpoint
}

output "creation_date" {
  description = "The date the user pool was created"
  value = aws_cognito_user_pool.main.*.creation_date
}

output "last_modified_date" {
  description = "The date the user pool was last modified"
  value = aws_cognito_user_pool.main.*.last_modified_date
}

output "scope_identifiers" {
  description = "A list of all scopes configured for this resource server in the format identifier/scope_name"
  value = aws_cognito_resource_server.main.*.scope_identifiers
}
