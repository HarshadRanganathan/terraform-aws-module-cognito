locals {
  cognito_tags = merge(
  module.label.tags, var.cognito_tags,
  {
    Name = module.label.id
  }
  )
}