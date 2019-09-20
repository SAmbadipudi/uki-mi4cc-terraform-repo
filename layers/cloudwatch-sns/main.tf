module "cloudwatch-sns" {
  source = "../../modules/uki-mi4cc-terraform-modules/cloudwatch-sns"

  providers = {
    "aws" = "aws.mi4cc"
  }

  cloudwatch_event_rule_name_for_sns = "${var.source_market_name}-${lower(var.environment)}-cloudwatch-${var.project_name}-avaya-alerts"
  cloudwatch_event_rule_description_for_sns = "${var.cloudwatch_event_rule_description_for_sns}"
  event_pattern = "${file("${path.module}/file.json")}"
  target-id = "${var.target-id}"
  sns_arn = "${var.sns_arn}"

}
