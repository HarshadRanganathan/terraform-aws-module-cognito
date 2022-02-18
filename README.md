# terraform-aws-module-cognito

# Terraform AWS Cognito Resources

Terraform module that creates:
  - identity-pool
  - user-pool
  - user-pool-client
  - user-pool-domain
  - user-pool-server-resource
  

Important
Terraform version 0.12
## Usage

**IMPORTANT:** The `master` branch is used in `source` just as an example. In your code, do not pin to `master` because there may be breaking changes between releases.
Instead pin to the release tag (e.g. `?ref=tags/x.y.z`).

**IMPORTNAT:** Make sure to add the terraform.tf.  This allows the terraform state file to be stored in a remote location on AWS s3. see an example below.

