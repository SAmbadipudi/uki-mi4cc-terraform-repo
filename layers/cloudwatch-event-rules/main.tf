module "cloudwatch_event_rules_configuration" {
  source = "../../modules/uki-mi4cc-terraform-modules/cloudwatch"

  providers = {
    "aws" = "aws.mi4cc"
  }
  event_rules = "${var.event_rules}"
  event_target_id = "${var.source_market_name}-${lower("${lookup(var.environment, terraform.workspace)}")}-cloudwatch-event-target"
  cloudwatch_event_rule_name = "${var.cloudwatch_event_rule_name}"
  cloudwatch_event_rule_description = "${var.cloudwatch_event_rule_description}"
  schedule_expression =  "${var.schedule_expression}"
}

module "cloudwatch_event_targets_configuration" {
    source = "../../modules/uki-mi4cc-terraform-modules/cloudwatch-event"

    providers = {
        "aws" = "aws.mi4cc"
    }

    # Cloudwatch event targets module variables
    event_rules = "${var.event_rules}"
    event_target_id           = "${var.source_market_name}-${lower("${lookup(var.environment, terraform.workspace)}")}-cloudwatch-event-target"
    bucket-name = "${var.bucket-name}"
    glue-job-name = "${var.glue-job-name}"
    event_taget_rule_name     = "${module.cloudwatch_event_rules_configuration.market_cloudwatch_event_rule_name}"
    event_target_resource_arn = "${var.lambda_function_arn}"
}
