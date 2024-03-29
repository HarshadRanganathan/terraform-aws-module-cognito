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

###Variables for Cognito User Pool

variable "admin_create_user_config" {
  type        = list(string)
  description = "The configuration for AdminCreaterUser requests"
  default     = []
}

variable "alias_attributes" {
  type        = list(string)
  description = "Attributes supported as an alias for this user pool. Possible values: phone_number, email, or preferred_username. Cconflicts with username_attributes."
  default     = []
}

variable "auto_verified_attributes" {
  type        = list(string)
  description = "The attribute to be auto-verified. Possible values: email, phone_number"
  default     = []
}

variable "device_configuration" {
  type        = list(string)
  description = "The configuration for the user pool's device tracking"
  default     = []
}

variable "email_configuration" {
  type        = list(string)
  description = "The email configuration"
  default     = []
}

variable "email_verification_subject" {
  type        = string
  description = "A string representing the email verification subject. Conflicts with verification_message_template configuration block email_subject argument"
  default     = "Your verification code"
}

variable "email_verification_message" {
  type        = string
  description = "A string representing the email verification message. Conflicts with verification_message_template configuration block email_message argument"
  default     = "Your verification code is {####}"
}

variable "lambda_config" {
  type        = list(string)
  description = "A container for the aws Lamda triggers associated with the user pool"
  default     = []
}

variable "mfa_configuration" {
  type        = string
  description = "(Default: OFF) Set to enable multifactor authentication. Must be one of the following values (ON, OFF, OPTIONAL)"
  default     = "OFF"
}

variable "password_policy" {
  type        = list(string)
  description = "A container for information about the user pool password policy"
  default     = []
}

variable "schema" {
  type        = list(string)
  description = "A container with the schema attributes of a user pool. Maximum of 50 attributes"
  default     = []
}

variable "sms_configuration" {
  type        = list(string)
  description = "The SMS configuration"
  default     = []
}

variable "sms_verification_message" {
  type        = string
  description = "A string representing the SMS verification message. Conficts with verification_message_template configuration block sms_message argument"
  default     = "Your verification code is {####}"
}

variable "sms_authentication_message" {
  type        = string
  description = "A string representing the SMS verification message. Conflicts with verification_message_template configuration block sms_message argument"
  default     = "Your authentication code is {####}."
}


variable "username_attributes" {
  type        = list(string)
  description = "Specifies whether email addresses of phone numbers can be specified as usernames when a user signs up. Conflicts with alias_attributes "
  default     = []
}

variable "user_pool_add_ons" {
  type        = list(string)
  description = "Configuration block for user pool add-ons to enable user pool advanced security mode features"
  default     = []
}

variable "verification_message_template" {
  type        = list(string)
  description = "The verification messagetemplates configuration"
  default     = []
}

####################################################
#######Variables for Admin Create User Config#######

variable "allow_admin_create_user_only" {
  type        = string
  description = "Set to true if only the administrator is allowed to create user profiles. Set false if users can sign themselves up via an app."
  default     = ""
}

variable "invite_message_template" {
  type        = list(map(string))
  description = "The invite message template structure"
  default     = []
}

variable "unused_account_validity_days" {
  type        = string
  description = "The user account expiration limit, in days, after which the account is no longer usable"
  default     = "30"
}

##Variable for Invite Message template (inside of Admin Create User Config)
variable "email_message" {
  type        = string
  description = "The message template for email messages. Must contain {username} and {####} placeholder, for username and temporary password, respectively"
  default     = "<p>Your username is {username} and temporary password is {####}</p>\n<p>Login here: <a href=\"https://login.mvp.quickpivot.app\">https://login.mvp.quickpivot.app</a></p>\n\n<p>Thanks,<p>\n<p>QuickPivot Team<p>"
}

variable "email_subject" {
  type        = string
  description = "The subject line for email messages"
  default     = "Your temporary password for {####}"
}

variable "sms_message" {
  type        = string
  description = "The messagetemplate for SMS messages. Must contain {username} and {####} placeholder, for username and temporary password, respectively"
  default     = "Your username is {username} and temporary password is {####}. If you do not log in within 7 days you'll need a new invite."
}

################################################
#######Variables for Device Configuration#######

variable "challenge_required_on_new_device" {
  type        = string
  description = "Indicate whether a challenge is required on a new device. Only application to a new device"
  default     = ""
}

variable "device_only_remembered_one_user_prompt" {
  type        = string
  description = "If a true, a device is only remembered on user prompt (true or false)"
  default     = ""
}

##############################################
#######Variable for Email Configuration#######

variable "reply_to_email_address" {
  type        = string
  description = "The REPLY-TO email address"
  default     = ""
}

variable "source_arn" {
  type        = string
  description = "The ARN of the email source"
  default     = ""
}

###############################################
#######Variables for Lambda Configuration#######

variable "create_auth_challenge" {
  type        = string
  description = "The ARN of the lambda creating an authentication challenge"
  default     = ""
}

variable "custom_message" {
  type        = string
  description = "A custom Message AWS Lambda trigger"
  default     = ""
}

variable "define_auth_challenge" {
  type        = string
  description = "Defines the authentication challenge"
  default     = ""
}

variable "post_authentication" {
  type        = string
  description = "A post-authentication AWS Lambda trigger"
  default     = ""
}

variable "post_confirmation" {
  type        = string
  description = "A post-confirmation AWS Lambda trigger"
  default     = ""
}

variable "pre_authentication" {
  type        = string
  description = "A pre-authentication AWS Lambda trigger"
  default     = ""
}

variable "pre_sign_up" {
  type        = string
  description = "A pre-registration AWS Lambda trigger"
  default     = ""
}

variable "pre_token_generation" {
  type        = string
  description = "Allow to customize identity token claims before token generation"
  default     = ""
}

variable "user_migration" {
  type        = string
  description = "The user migration Lambda config type"
  default     = ""
}

variable "verify_auth_challenge_response" {
  type        = string
  description = "Verifies the authentication challenge response"
  default     = ""
}

##########################################
#######Variable for Password Policy#######

variable "minimum_length" {
  type        = string
  description = "The minimum length of the password policy that you have set"
  default     = "8"
}

variable "require_lowercase" {
  type        = string
  description = "Whether you have required users to use at least one lowercase letter in their password"
  default     = "false"
}

variable "require_numbers" {
  type        = string
  description = "Whether you have required users to use at least one number in their password"
  default     = "false"
}

variable "require_symbols" {
  type        = string
  description = "Whether you have required users to use at least on symbol in their password"
  default     = "false"
}

variable "require_uppercase" {
  type        = string
  description = "Whether you have required users to use at least one uppercase letter in their password"
  default     = "false"
}

############################################
#######Variable for Schema Attributes#######

###NOTE When defining an attribute_data_type of String or Number, the respective attribute constraints configuration block (e.g string_attribute_constraints or number_attribute_contraints) is required to prevent recreation of the Terraform resource. This requirement is true for both standard (e.g. name, email) and custom schema attributes.

variable "attribute_data_type" {
  type        = string
  description = "The attribute data type. Must be one of Boolean, Number, String, DateTime."
  default     = ""
}

variable "developer_only_attribute" {
  type        = string
  description = "Specifies whether the attribute type is developer only"
  default     = ""
}

variable "mutable" {
  type        = string
  description = "Specifies whether the attribute can be changed once it has been created"
  default     = ""
}

variable "attribute_name" {
  type        = string
  description = "The name of the attribute"
  default     = ""
}

variable "number_attribute_constraints" {
  type        = string
  description = "Specifies the constraints for an attribute of the number type."
  default     = ""
}

variable "required" {
  type        = string
  description = "Specifies whether a user pool attribute is required. If the attribute is required ad the user does not provide a value, registration or sign-in will fail"
  default     = ""
}

variable "string_attribute_constraints" {
  type        = list(string)
  description = "Specifies the constraints for an attribute of the string type"
  default     = []
}

#Variable Number Attribute Constraints (inside of schema)

variable "max_value" {
  type        = string
  description = "The maximum value of an attribute that is of the number data type"
  default     = ""
}

variable "min_value" {
  type        = string
  description = "The minimum value of an attribute that is of the number data type"
  default     = ""
}

#Variable String Attribute Constraints (inside of schema)

variable "max_length" {
  type        = string
  description = "The maximum length of an attribute value of the string type"
  default     = ""
}

variable "min_length" {
  type        = string
  description = "The minimum length of an attribute value of the string type"
  default     = ""
}

############################################
#######Variable for SMS Configuration#######

variable "external_id" {
  type        = string
  description = "he external ID used in IAM role trust relationships. For more information about using external IDs, see How to Use an External ID When Granting Access to Your AWS Resources to a Third Party"
  default     = ""
}

variable "sns_caller_arn" {
  type        = string
  description = "The ARN of the Amazon SNS caller. This is usually the IAM role that you've given Cognito permission to assume"
  default     = ""
}

############################################
#######Variable for User Pool Add-ons#######

variable "advance_security_mode" {
  type        = string
  description = "The mode for advanced security, must be one of OFF, AUDIT or ENFORCED"
  default     = ""
}

#########################################################
#######Variables for Verification Message Template#######

variable "default_email_option" {
  type        = string
  description = "The default email option. Must be either CONFIRM_WITH_CODE or CONFIRM_WITH_LINK. Default to CONFIRM_WITH_CODE"
  default     = "CONFIRM_WITH_CODE"
}

variable "message_template_email_message" {
  type        = string
  description = "The email message template. Must contain the {####} placeholder. Conflicts with email_verification_message argument"
  default     = ""
}

variable "email_message_by_link" {
  type        = string
  description = "The email message template for sending a confirmation link to the user, it must contain the {##Click Here##} placeholder."
  default     = ""
}

variable "message_template_email_subject" {
  type        = string
  description = "The subject line for the email message template. Conflicts with email_verification_subject argument"
  default     = ""
}

variable "email_subject_by_link" {
  type        = string
  description = "The subject line for the email message template for sending a confirmation link to the user."
  default     = ""
}

variable "message_template_sms_message" {
  type        = string
  description = "The SMS message template. Must contain the {####} placeholder. Conflicts with sms_verification_message argument."
  default     = ""
}

variable "temporary_password_validity_days" {
  type        = string
  description = "The user account expiration limit, in days, after which the account is no longer usable"
  default     = ""
}

variable "provider_details" {
  type        = map(string)
  description = "The map of identity details, such as access token"
  default     = null
}

variable "attribute_mapping" {
  type        = map(string)
  description = "The map of identity details, such as access token"
  default     = null
}

variable "provider_type" {
  type        = string
  description = "The provider type, valid type: SAML | Facebook | Google | LoginWithAmazon | SignWithApple | OIDC"
  default     = ""
}

variable "enable_identity_provider" {
  type        = bool
  description = "Enable the build of identity provider"
  default     = false
}

variable "enable_resource_server" {
  type        = bool
  description = "Enable the build of resource server"
  default     = false
}

variable "scopes" {
  type        = list(map(string))
  description = "The scope name"
  default     = null
}

variable "scope_description" {
  type        = string
  description = "The Description of the scope"
  default     = ""
}

variable "identifier" {
  type        = string
  description = "An identifier for the resoruce server"
  default     = ""
}

variable "resource_server_name" {
  type        = string
  description = "A name for the resource server"
  default     = ""
}

variable "idp_identifiers" {
  type = list
  description = "The list of identity providers"
  default = null
}

variable "allowed_oauth_flows" {
  type        = list(string)
  description = "List of allowed OAuth flows (code, implicit, client_credential)"
  default     = []
}

variable "allowed_oauth_flows_user_pool_client" {
  type        = string
  description = "Whether the client is allowed to follow the OAuth protocol when interacting with Cognito User Pool (true or false)"
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
  default     = "30"
}

variable "supported_identity_providers" {
  type        = list(string)
  description = "List of provider names for the identity providers that are supported on this client"
  default     = []
}

variable "user_pool_id" {
  type        = string
  description = "The user pool the client belongs to"
  default     = null
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

variable "enable_user_pool_domain" {
  type        = bool
  description = "Wether to create a domain for the user pool"
  default     = false
}

variable "user_pool_domain" {
  description = "The name of the doamin in string formt"
  type        = string
  default     = ""
}

variable "domain_certificate_arn" {
  description  = "The ACM certificate ARN to be used for the user pool domain"
  type         = string
  default      = ""
}

variable "user_pool_client" {
  type        = list(map(string))
  description = "for each user pool client created"
  default     = null
}
