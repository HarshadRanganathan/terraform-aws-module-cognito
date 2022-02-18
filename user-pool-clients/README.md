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


