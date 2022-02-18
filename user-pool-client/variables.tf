variable "namespace" {
  type        = string
  description = "Namespace, which could be your organization name, e.g. 'eg' or 'cp'"
  default     = ""
}

variable "stage" {
  type        = string
  description = "Stage, e.g. 'prod', 'staging', 'dev', or 'test'"
  default     = ""
}

variable "name" {
  type        = string
  default     = "app"
  description = "Solution name, e.g. 'app' or 'cluster'"
}

variable "delimiter" {
  type        = string
  default     = "-"
  description = "Delimiter to be used between `namespace`, `stage`, `name` and `attributes`"
}

variable "attributes" {
  type        = list(string)
  default     = []
  description = "Additional attributes (e.g. `1`)"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. `{ BusinessUnit = \"XYZ\" }`"
}

variable "cognito_tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. `{ BusinessUnit = \"XYZ\" }`"
}

variable "enabled" {
  type        = bool
  description = "Whether to create the resources. Set to `false` to prevent the module from creating any resources"
  default     = true
}

variable "allowed_oauth_flows" {
  type        = list(string)
  description = "List of allowed OAuth flows (code, implicit, client_credential)"
  default     = []
}

variable "allowed_oauth_flows_user_pool_client" {
  type        = string
  description = "Whether the client is allowed to follow the OAuth protocol whe interacting with Cognito User Pool (true or false)"
  default     = "true"
}

variable "allowed_oauth_scopes" {
  type        = list(string)
  description = "List of allowed OAuth scopes (phone, email, openid, profile, and aws.cognito,signin.user.admin)"
  default     = []
}

variable "callback_urls" {
  type        = list(string)
  description = "List of allowed callback URLs for the identity prpviders"
  default     = []
}

variable "default_redirect_uri" {
  type        = string
  description = "The default redirect URI. Must be in the list of callback URLs"
  default     = ""
}

variable "explicit_auth_flows" {
  type        = list(string)
  description = "List of authentication flows (ADMIN_NO_SRP_AUTH, CUSTOM_AUTH_FLOW_ONLY, USER_PASSWORD_AUTH, ALLOW_ADMIN_USER_PASSWORD_AUTH, ALLOW_CUSTOM_AUTH, ALLOW_USER_PASSWORD_AUTH, ALLOW_USER_SRP_AUTH, ALLOW_REFRESH_TOKEN_AUTH)"
  default     = []
}

variable "generate_secret" {
  type        = string
  description = "Should be an application secret be generated (true or false)"
  default     = ""
}

variable "logout_urls" {
  type        = list(string)
  description = "List of allowed logout URLs for the identity providers"
  default     = []
}

variable "read_attributes" {
  type        = list(string)
  description = "List of user pool attributes the application client can read from"
  default     = []
}

variable "refresh_token_validity" {
  type        = string
  description = "The time limit in days refresh tokens are valid for"
  default     = ""
}

variable "supported_identity_providers" {
  type        = list(string)
  description = "List of provider names for the identity providers that are supported on this client"
  default     = []
}

variable "user_pool_id" {
  type        = string
  description = "The user pool the client belongs to"
  default     = ""
}

variable "write_attributes" {
  type        = list(string)
  description = "List of user pool attributes the application client can write to"
  default     = []
}

variable "prevent_user_existence_errors" {
  type        = string
  description = "Choose which errors and responses are returned by Cognito APIs during authentication, account confirmation, and password recovery when the user does not exist in the user pool ('ENABLED', 'LEGACY')"
  default     = "ENABLED"
}

