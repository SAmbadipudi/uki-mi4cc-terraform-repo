module "secrets-manager" {
  source = "../../modules/uki-mi4cc-terraform-modules/secrets-manager"

  providers = {
    "aws" = "aws.mi4cc"
  }

  values-stored = "${var.values-stored}"
  secret-mangr-name = "${var.source_market_name}-${lower(var.environment)}-sm-${var.project_name}-avaya-connection-info"
}

