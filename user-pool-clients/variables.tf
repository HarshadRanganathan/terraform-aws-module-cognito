variable "user_pool_id" {
  type        = string
  description = "The user pool the client belongs to"
  default     = ""
}

variable "api_clients" {
  type = map(object({
    name                                 = string
    generate_secret                      = bool
    supported_identity_providers         = list(string)
    callback_urls                        = list(string)
    logout_urls                          = list(string)
    allowed_oauth_flows                  = list(string)
    refresh_token_validity               = string
    access_token_validity                = string
    id_token_validity                    = string
    token_validity_units                 = map(string)
    allowed_oauth_flows_user_pool_client = bool
    allowed_oauth_scopes                 = list(string)
  }))
  description = "List of api clients to be added to the user pool"
  default = {}
}
