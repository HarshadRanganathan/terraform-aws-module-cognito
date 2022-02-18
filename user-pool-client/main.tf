
module "label" {
  source     = "git::https://github.com/HarshadRanganathan/terraform-aws-module-null-label//module-v2?ref=1.0.0"
  namespace  = var.namespace
  stage      = var.stage
  name       = var.name
  delimiter  = var.delimiter
  attributes = var.attributes
  tags       = var.tags
  enabled    = var.enabled
}

module "label_user_pool_client" {
  source     = "git::https://github.com/HarshadRanganathan/terraform-aws-module-null-label//module-v2?ref=1.0.0"
  enabled    = var.enabled
  context    = module.label.context
  attributes = compact(concat(module.label.attributes, list("user-pool-client")))
}

resource "aws_cognito_user_pool_client" "main" {
  count = var.enabled ? 1 : 0
  name                                 = module.label_user_pool_client.id
  user_pool_id                         = var.user_pool_id
  generate_secret                      = var.generate_secret
  explicit_auth_flows                   = var.explicit_auth_flows
  read_attributes                      = var.read_attributes
  write_attributes                     = var.write_attributes
  supported_identity_providers         = var.supported_identity_providers
  callback_urls                        = var.callback_urls
  logout_urls                          = var.logout_urls
  allowed_oauth_flows                   = var.allowed_oauth_flows
  refresh_token_validity               = var.refresh_token_validity
  allowed_oauth_flows_user_pool_client  = var.allowed_oauth_flows_user_pool_client
  allowed_oauth_scopes                 = var.allowed_oauth_scopes
  prevent_user_existence_errors        = var.prevent_user_existence_errors
}

