variable "cloudwatch_event_rule_name_for_sns" {
  description = "Username for DB connectivity"
  default = "sns-avaya-alerts"
}

variable "cloudwatch_event_rule_description_for_sns" {
  description = "AWS Glue DB connection Name"
  default = "Publish the CloudWatch error message for Avaya Glue job to an SNS topic"
}

variable "target-id" {
  description = "Lambda arn"
  default = "AllowCloudwatch_for_SNS"
}

variable "sns_arn" {
  description = "SNS arn"
  default = "arn:aws:sns:us-west-2:320132909094:sns-avaya"
}
