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

module "label_identity_pool" {
  source     = "git::https://github.com/HarshadRanganathan/terraform-aws-module-null-label//module-v2?ref=1.0.0"
  enabled    = var.enabled
  context    = module.label.context
  attributes = compact(concat(module.label.attributes, list("user-pool")))
}

resource "aws_cognito_identity_pool" "main" {
  count = var.enabled ? 1 : 0
  identity_pool_name               = module.label_identity_pool.id
  allow_unauthenticated_identities = var.allow_unauthenticated_identities

  dynamic "cognito_identity_providers" {
    for_each = var.cognito_identity_providers
    content {
      cognito_identity_providers {
        client_id               = cognito_identity_providers.value["client_id"]
        provider_name           = cognito_identity_providers.value["provider_name"]
        server_side_token_check = cognito_identity_providers.value["server_side_token_check"]
      }
    }
  }

  supported_login_providers    = var.supported_login_providers
  saml_provider_arns           = var.saml_provider_arns
}
