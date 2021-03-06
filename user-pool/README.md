# tf-aws-cognito-user-pool

Terraform module that creates Cognito User Pool resources in AWS
  
  A user pool is a user directory in Amazon Cognito. With a user pool, your users can sign in to your web or mobile app through Amazon Cognito. Your users can also sign in through social identity providers like Facebook or Amazon, and through SAML identity providers. Whether your users sign in directly or through a third party, all members of the user pool have a directory profile that you can access through an SDK.

User pools provide:

 * Sign-up and sign-in services.

 * A built-in, customizable web UI to sign in users.

 * Social sign-in with Facebook, Google, and Login with Amazon, as well as sign-in with SAML identity providers from your user pool.

 * User directory management and user profiles.

 * Security features such as multi-factor authentication (MFA), checks for compromised credentials, account takeover protection, and phone and email verification.

 * Customized workflows and user migration through AWS Lambda triggers.

 * After successfully authenticating a user, Amazon Cognito issues JSON web tokens (JWT) that you can use to secure and authorize access to your own APIs, or exchange for AWS credentials.
## Usage

```hcl

module "CognitoUserPool" {
  source                         = "./modules/tf-aws-cognito-user-pool-mod"
  name                           = "CognitoUserPool"
  username_attributes            = ["{var.username_attributes}"]
  schema                         = "${var.schema}"
  sms_verification_message       = "example-1234{####}"
  email_verification_message     = "cognito-example1234{####}"
  email_verification_subject     = "cognito-example1234{####}"
  message_template_sms_message   = "example-1234{####}"
  message_template_email_message = "example-1234{####}"
  default_email_option           = "CONFIRM_WITH_CODE" 
  mfa_configuration              = "OPTIONAL"
  sms_authentication_message     = "example-1234{####}"
  external_id                    = "arn:aws:iam::123456789:role/service-role/Example-SMS-Rolea"
  sns_caller_arn                 = "bfbf9a9c-99a9-9999-bae9-f9f99fda9f9b"
  minimum_length                 = "${var.minimum_length}"
  require_lowercase              = "${var.require_lowercase}"
  require_numbers                = "${var.require_numbers}"
  require_symbols                = "${var.require_symbols}"
  require_uppercase              = "${var.require_uppercase}"
  allow_admin_create_user_only   = "${var.allow_admin_create_user_only}"
  unused_account_validity_days   = "${var.unused_account_validity_days}"
}
```
## README.md
This README file was created runnnign generate-readme.sh placed insinde hooks directory.
If you want to update README.md file, run that script while being in 'hooks' folder.
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| admin\_create\_user\_config | The configuration for AdminCreaterUser requests | list | `<list>` | no |
| advance\_security\_mode | The mode for advanced security, must be one of OFF, AUDIT or ENFORCED | string | `""` | no |
| alias\_attributes | Attributes supported as an alias for this user pool. Possible values: phone_number, email, or preferred_username. Cconflicts with username_attributes. | list | `<list>` | no |
| allow\_admin\_create\_user\_only | Set to true if only the administrator is allowed to create user profiles. Set false if users can sign themselves up via an app. | string | `""` | no |
| attribute\_data\_type | The attribute data type. Must be one of Boolean, Number, String, DateTime. | string | `""` | no |
| attribute\_name | The name of the attribute | string | `""` | no |
| auto\_verified\_attributes | The attribute to be auto-verified. Possible values: email, phone_number | list | `<list>` | no |
| challenge\_required\_on\_new\_device | Indicate whether a challenge is required on a new device. Only application to a new device | string | `""` | no |
| create\_auth\_challenge | The ARN of the lambda creating an authentication challenge | string | `""` | no |
| custom\_message | A custom Message AWS Lambda trigger | string | `""` | no |
| default\_email\_option | The default email option. Must be either CONFIRM_WITH_CODE or CONFIRM_WITH_LINK. Default to CONFIRM_WITH_CODE | string | `"CONFIRM_WITH_CODE"` | no |
| define\_auth\_challenge | Defines the authentication challenge | string | `""` | no |
| developer\_only\_attribute | Specifies whether the attribute type is developer only | string | `""` | no |
| device\_configuration | The configuration for the user pool's device tracking | list | `<list>` | no |
| device\_only\_remembered\_one\_user\_prompt | If a true, a device is only remembered on user prompt (true or false) | string | `""` | no |
| email\_configuration | The email configuration | list | `<list>` | no |
| email\_message | The message template for email messages. Must contain {username} and {####} placeholder, for username and temporary password, respectively | string | `""` | no |
| email\_message\_by\_link | The email message template for sending a confirmation link to the user, it must contain the {##Click Here##} placeholder. | string | `""` | no |
| email\_subject | The subject line for email messages | string | `""` | no |
| email\_subject\_by\_link | The subject line for the email message template for sending a confirmation link to the user. | string | `""` | no |
| email\_verification\_message | A string representing the email verification message. Conflicts with verification_message_template configuration block email_message argument | string | `""` | no |
| email\_verification\_subject | A string representing the email verification subject. Conflicts with verification_message_template configuration block email_subject argument | string | `""` | no |
| external\_id | he external ID used in IAM role trust relationships. For more information about using external IDs, see How to Use an External ID When Granting Access to Your AWS Resources to a Third Party | string | `""` | no |
| invite\_message\_template | The invite message template structure | list | `<list>` | no |
| lambda\_config | A container for the aws Lamda triggers associated with the user pool | list | `<list>` | no |
| max\_length | The maximum length of an attribute value of the string type | string | `""` | no |
| max\_value | The maximum value of an attribute that is of the number data type | string | `""` | no |
| message\_template\_email\_message | The email message template. Must contain the {####} placeholder. Conflicts with email_verification_message argument | string | `""` | no |
| message\_template\_email\_subject | The subject line for the email message template. Conflicts with email_verification_subject argument | string | `""` | no |
| message\_template\_sms\_message | The SMS message template. Must contain the {####} placeholder. Conflicts with sms_verification_message argument. | string | `""` | no |
| mfa\_configuration | (Default: OFF) Set to enable multifactor authentication. Must be one of the following values (ON, OFF, OPTIONAL) | string | `"OFF"` | no |
| min\_length | The minimum length of an attribute value of the string type | string | `""` | no |
| min\_value | The minimum value of an attribute that is of the number data type | string | `""` | no |
| minimum\_length | The minimum length of the password policy that you have set | string | `""` | no |
| mutable | Specifies whether the attribute can be changed once it has been created | string | `""` | no |
| name | The name of the user pool | string | n/a | yes |
| number\_attribute\_constraints | Specifies the constraints for an attribute of the number type. | string | `""` | no |
| password\_policy | A container for information about the user pool password policy | list | `<list>` | no |
| post\_authentication | A post-authentication AWS Lambda trigger | string | `""` | no |
| post\_confimation | A post-confirmation AWS Lambda trigger | string | `""` | no |
| pre\_authentication | A pre-authentication AWS Lambda trigger | string | `""` | no |
| pre\_sign\_up | A pre-registration AWS Lambda trigger | string | `""` | no |
| pre\_token\_generation | Allow to customize identity token claims before token generation | string | `""` | no |
| reply\_to\_email\_address | The REPLY-TO email address | string | `""` | no |
| require\_lowercase | Whether you have required users to use at least one lowercase letter in their password | string | `""` | no |
| require\_numbers | Whether you have required users to use at least one number in their password | string | `""` | no |
| require\_symbols | Whether you have required users to use at least on symbol in their password | string | `""` | no |
| require\_uppercase | Whether you have required users to use at least one uppercase letter in their password | string | n/a | yes |
| required | Specifies whether a user pool attribute is required. If the attribute is required ad the user does not provide a value, registration or sign-in will fail | string | `""` | no |
| schema | A container with the schema attributes of a user pool. Maximum of 50 attributes | list | `<list>` | no |
| sms\_authentication\_message | A string representing the SMS verification message. Conflicts with verification_message_template configuration block sms_message argument | string | `""` | no |
| sms\_configuration | The SMS configuration | list | `<list>` | no |
| sms\_message | The messagetemplate for SMS messages. Must contain {username} and {####} placeholder, for username and temporary password, respectively | string | `""` | no |
| sms\_verification\_message | A string representing the SMS verification message. Conficts with verification_message_template configuration block sms_message argument | string | `""` | no |
| sns\_caller\_arn | The ARN of the Amazon SNS caller. This is usually the IAM role that you've given Cognito permission to assume | string | `""` | no |
| source\_arn | The ARN of the email source | string | `""` | no |
| string\_attribute\_constraints | Specifies the constraints for an attribute of the string type | list | `<list>` | no |
| tags | A mapping of tags to assign to User Pool | map | `<map>` | no |
| temporary\_password\_validity\_days | The user account expiration limit, in days, after which the account is no longer usable | string | `""` | no |
| unused\_account\_validity\_days | The user account expiration limit, in days, after which the account is no longer usable | string | `""` | no |
| user\_migration | The user migration Lambda config type | string | `""` | no |
| user\_pool\_add\_ons | Configuration block for user pool add-ons to enable user pool advanced security mode features | list | `<list>` | no |
| username\_attributes | Specifies whether email addresses of phone numbers can be specified as usernames when a user signs up. Conflicts with alias_attributes | list | `<list>` | no |
| verifi\_auth\_challenge\_response | Verifies the authentication challenge response | string | `""` | no |
| verification\_message\_template | The verification messagetemplates configuration | list | `<list>` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The id of the user pool |

# tf-aws-cognito-user-pool-client

Terraform module that creates Cognito User Pool Client resources in AWS.

Important
  The following module is necessary for the Cognito User Pool Client operation

* [Cognito User Pool](https://registry.terraform.io/modules/corpit-consulting-public/cognito-user-pool/aws/0.1.0)

## Usage

```hcl

module "cognito-user-pool-client" {
  source                               = "./modules/tf-aws-cognito-user-pool-client"
  name                                 = "${var.cognito_client_params["name"]}"
  user_pool_id                         = "${module.CorpitUserPool.id}"
  read_attributes                      = "${var.read_attributes}"
  supported_identity_providers         = "${var.supported_identity_providers}"
  callback_urls                        = "${var.callback_urls}"
  logout_urls                          = "${var.logout_urls}"
  allowed_oauth_flows                  = ["${var.allowed_oauth_flows}"]
  refresh_token_validity               = "${var.cognito_client_params["refresh_token_validity"]}"
  allowed_oauth_flows_user_pool_client = "${var.cognito_client_params["allowed_oauth_flows_user_pool_client"]}"
  allowed_oauth_scopes                 = "${var.allowed_oauth_scopes}"
}

```

## README.md
This README file was created runnnign generate-readme.sh placed insinde hooks directory.
If you want to update README.md file, run that script while being in 'hooks' folder.
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| allowed\_oauth\_flows | List of allowed OAuth flows (code, implicit, client_credential) | list | `<list>` | no |
| allowed\_oauth\_flows\_user\_pool\_client | Whether the client is allowed to follow the OAuth protocol whe interacting with Cognito User Pool (true or false) | string | `"true"` | no |
| allowed\_oauth\_scopes | List of allowed OAuth scopes (phone, email, openid, profile, and aws.cognito,signin.user.admin) | list | `<list>` | no |
| callback\_urls | List of allowed callback URLs for the identity prpviders | list | `<list>` | no |
| default\_redirect\_uri | The default redirect URI. Must be in the list of callback URLs | string | `""` | no |
| explicit\_auth\_flows | List of authentication flows (ADMIN_NO_SRP_AUTH, CUSTOM_AUTH_FLOW_ONLY, USER_PASSWORD_AUTH) | list | `<list>` | no |
| generate\_secret | Should be an application secret be generated (true or false) | string | `""` | no |
| logout\_urls | List of allowed logout URLs for the identity providers | list | `<list>` | no |
| name | The name of the application client | string | n/a | yes |
| read\_attributes | List of user pool attributes the application client can read from | list | `<list>` | no |
| refresh\_token\_validity | The time limit in days refresh tokens are valid for | string | `""` | no |
| supported\_identity\_providers | List of provider names for the identity providers that are supported on this client | list | `<list>` | no |
| user\_pool\_id | The user pool the client belongs to | string | n/a | yes |
| write\_attributes | List of user pool attributes the application client ca write to | list | `<list>` | no |


# tf-aws-cognito-user-pool-domain

Terraform module that creates Cognito User Pool Domain in AWS.

## Usage

**IMPORTANT:** The `master` branch is used in `source` just as an example. In your code, do not pin to `master` because there may be breaking changes between releases.
Instead pin to the release tag (e.g. `?ref=tags/x.y.z`).



```hcl

module "cognito-user-pool-domain" {
  source                               = "git:://module?ref=master"
  domain                                 = var.cognito_client_params["name"]
  user_pool_id                         = module.CorpitUserPool.id
  certificate_arn                      = var.read_attributes
}

```



## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| domain | Domain name for the user pool domain | string | `string` | yes |
| user\_pool\_id |  The user pool to assign the domain to | string | `""` | yes |
| certificate\_arn | The ARN of an ISSUED ACM certificate in us-east-1 for a custom domain | string | `string` | no |


## Outputs
| Name | Description |
|------|-------------|
| aws\_account\_id | The AWS Account ID for the user pool owner |
| cloudfront\_distribution\_arn | The ARN of the CloudFront distribution |
| s3\_bucket | The s3 bucket where the static file for this domain are stored |
| version | The app version



