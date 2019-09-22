module "glue-job" {
  source = "../../modules/uki-mi4cc-terraform-modules/glue-job"

  providers = {
    "aws" = "aws.mi4cc"
  }


  jobnames = "${var.jobnames}"
  script_location = "s3://${var.source_market_name}-${lower(terraform.workspace)}-s3-${var.project_name}/uki/contactcentre/avaya/scripts/${var.source_market_name}-${lower(terraform.workspace)}-s3-${var.project_name}-avaya-test/avaya_extracts_automation.py"
  connections     = "${var.connections}"
  TempDir         = "${var.TempDir}"
  extra-jars      = "${var.extra-jars}"

  owner-createdby  = "${var.owner-createdby}"
  owner-createdby  = "${var.owner-createdby}"
  owner-data  = "${var.owner-data}"
  owner-infra = "${var.owner-infra}"
  project-name = "${var.project-name}"
  project-subprojectname = "${var.project-subprojectname}"
  project-wbscode = "${var.project-wbscode}"
  technical_owner = "${var.technical_owner}"
  billing_code = "${var.billing_code}"
  compliance = "${var.compliance}"
}

