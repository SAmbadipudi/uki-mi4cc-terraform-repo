module "glue-job" {
  source = "../../modules/uki-mi4cc-terraform-modules/glue-job"

  providers = {
    "aws" = "aws.mi4cc"
  }


  jobnames = "${var.jobnames}"
  script_location = "s3://${var.source_market_name}-${lower(var.environment)}-s3-${var.project_name}/uki/contactcentre/avaya/scripts/${var.source_market_name}-${lower(var.environment)}-s3-${var.project_name}-avaya-test/avaya_extracts_automation.py"
  connections     = "${var.connections}"
  TempDir         = "${var.TempDir}"
  extra-jars      = "${var.extra-jars}"
}

