module "cloudwatch_event_rules_configuration" {
  source = "../../modules/uki-mi4cc-terraform-modules/cloudwatch"

  providers = {
    "aws" = "aws.mi4cc"
  }
  event_rules = "${var.event_rules}"
  cloudwatch_event_rule_name = "${var.source_market_name}-${lower(terraform.workspace)}-cloudwatch-mi4cc-avaya"
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
    event_target_id           = "${var.source_market_name}-${lower(terraform.workspace)}-cloudwatch-event-target"
    bucket-name = "${var.source_market_name}-${lower(terraform.workspace)}-s3-mi4cc"
    glue-job-name = "${var.source_market_name}-${lower(terraform.workspace)}-glue-mi4cc-avaya"
    event_taget_rule_name     = "${module.cloudwatch_event_rules_configuration.market_cloudwatch_event_rule_name}"
    event_target_resource_arn = "arn:aws:lambda:us-west-2:320132909094:function:eventwatch"
}
