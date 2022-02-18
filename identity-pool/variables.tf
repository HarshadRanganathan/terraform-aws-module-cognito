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


variable "allow_unauthenticated_identities" {
  type        = string
  description = "Whether the identity pool supports unauthenticated logins or not.(true or false)"
}

variable "developer_provider_name" {
  type        = string
  description = "The domain by which Cognito will refer to your users. This name acts as a placeholder that allows your backend and the Cognito service to communicate about the developer provider."
  default     = ""
}

variable "cognito_identity_providers" {
  type        = map
  description = "An array of Amazon Cognito Identity user pools and their client IDs."
  default     = {}
}

variable "openid_connect_provider_arns" {
  type        = list
  description = "A list of OpendID Connect provider ARNs."
  default     = []
}

variable "saml_provider_arns" {
  type        = list
  description = "An array of Amazon Resource Names (ARNs) of the SAML provider for your identity."
  default     = []
}

variable "supported_login_providers" {
  type        = map
  description = "Key-Value pairs mapping provider names to provider app IDs."
  default     = {}
}

###Cognito Identity Providers

variable "client_id" {
  type        = string
  description = "The client ID for the Amazon Cognito Identity User Pool."
  default     = ""
}

variable "provider_name" {
  type        = string
  description = "The provider name for an Amazon Cognito Identity User Pool."
  default     = ""
}

variable "server_side_token_check" {
  type        = string
  description = "Whether server-side token validation is enabled for the identity provider’s token or not.(true or false)" 
  default     = ""
}
