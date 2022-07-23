resource "aws_cognito_user_pool_client" "main" {
  for_each                             = var.api_clients
  name                                 = each.value.name
  user_pool_id                         = var.user_pool_id
  generate_secret                      = each.value.generate_secret
  supported_identity_providers         = each.value.supported_identity_providers
  callback_urls                        = each.value.callback_urls
  logout_urls                          = each.value.logout_urls
  allowed_oauth_flows                  = each.value.allowed_oauth_flows
  refresh_token_validity               = each.value.refresh_token_validity
  access_token_validity                = each.value.access_token_validity
  id_token_validity                    = each.value.id_token_validity
  allowed_oauth_flows_user_pool_client = each.value.allowed_oauth_flows_user_pool_client
  allowed_oauth_scopes                 = each.value.allowed_oauth_scopes
  prevent_user_existence_errors        = "ENABLED"

  token_validity_units {
    access_token  = lookup(each.value.token_validity_units, "access_token", null)
    id_token      = lookup(each.value.token_validity_units, "id_token", null)
    refresh_token = lookup(each.value.token_validity_units, "refresh_token", null)
  }
}

resource "aws_cognito_user" "default" {
  for_each     = var.aws_cognito_users

  user_pool_id = var.user_pool_id
  username     = each.key
  attributes   = {
    email = each.value
    email_verified  = true
   }
  message_action = "RESEND"   
}
