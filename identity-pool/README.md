# tf-aws-cognito-identity-pool

Terraform module that creates Cognito User Pool resources in AWS

  Amazon Cognito identity pools provide temporary AWS credentials for users who are guests (unauthenticated) and for users who have been authenticated and received a token. An identity pool is a store of user identity data specific to your account.
## Usage

```hcl

module "cognito-identity-pool" {
  source                           = "./modules/tf-aws-cognito-identity-pool
  identity_pool_name               = var.identity_pool_name
  allow_unauthenticated_identities = var.allow_unauthenticated_identities
  client_id                        = module.cognito-user-pool.id
  provider_name                    = var.provider_name
  server_side_token_check          = var.server_side_token_check
}

```


## README.md
This README file was created runnnign generate-readme.sh placed insinde hooks directory.
If you want to update README.md file, run that script while being in 'hooks' folder.
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| allow\_unauthenticated\_identities | Whether the identity pool supports unauthenticated logins or not.(true or false) | string | n/a | yes |
| client\_id | The client ID for the Amazon Cognito Identity User Pool. | string | `""` | no |
| cognito\_identity\_providers | An array of Amazon Cognito Identity user pools and their client IDs. | map | `<map>` | no |
| developer\_provider\_name | The domain by which Cognito will refer to your users. This name acts as a placeholder that allows your backend and the Cognito service to communicate about the developer provider. | string | `""` | no |
| identity\_pool\_name | The cognito identity pool name | string | n/a | yes |
| openid\_connect\_provider\_arns | A list of OpendID Connect provider ARNs. | list | `<list>` | no |
| provider\_name | The provider name for an Amazon Cognito Identity User Pool. | string | `""` | no |
| saml\_provider\_arns | An array of Amazon Resource Names (ARNs) of the SAML provider for your identity. | list | `<list>` | no |
| server\_side\_token\_check | Whether server-side token validation is enabled for the identity provider’s token or not.(true or false) | string | `""` | no |
| supported\_login\_providers | Key-Value pairs mapping provider names to provider app IDs. | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | An identity pool ID in the format |