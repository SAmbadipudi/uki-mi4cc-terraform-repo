variable "event_rules" {
  description = "Event rules"
  type = "list"
  default = ["ActivityCodeStat","AgentByApplicationStat","AgentPerformanceStat","ApplicationStat","SkillsetStat","AgentLoginStat"]
}

variable "bucket-name" {
  description = "S3 bucke name"
  default = "uki-sand-s3-mi4cc"
}
variable "glue-job-name" {
  description = "Username for DB connectivity"
  default = "uki-sand-glue-mi4cc-avaya"
}

variable "schedule_expression" {
   type        = "map"
   default = {
    "ActivityCodeStat" = "cron(30 * * * ? *)"
    "AgentByApplicationStat" = "cron(0 20 * * ? *)"
    "AgentPerformanceStat" = "cron(0 15 * * ? *)"
    "ApplicationStat" = "cron(0 10 * * ? *)"
    "SkillsetStat" = "cron(0 13 * * ? *)"
    "AgentLoginStat" = "cron(0 12 * * ? *)"
  }
}
variable "cloudwatch_event_rule_name" {
  description = "Username for DB connectivity"
  default = "uki-dev-cloudwatch-mi4cc-avaya"
}

variable "cloudwatch_event_rule_description" {
  description = "AWS Glue DB connection Name"
  default = "Trigger Glue job for the Avaya view"
}
