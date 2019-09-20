module "cloudwatch" {
  source = "../../modules/uki-mi4cc-terraform-modules/cloudwatch"

  providers = {
    "aws" = "aws.mi4cc"
  }
  event_rules = "${var.event_rules}"
  lambda_arn = "${var.lambda_arn}"
  cloudwatch_event_rule_name = "${var.cloudwatch_event_rule_name}"
  cloudwatch_event_rule_description = "${var.cloudwatch_event_rule_description}"
  schedule_expression =  "${var.schedule_expression}"
  input1 = "${var.input1}"
  bucket-name = "${var.bucket-name}"
  input2 = "${var.input2}"
  file-path = "${var.file-path}"
  input3 = "${var.input3}"
  glue-job-name = "${var.glue-job-name}"  
  cloudwatch_lambda_st_id = "${var.cloudwatch_lambda_st_id}"
  action_lambda = "lambda:InvokeFunction"

}
