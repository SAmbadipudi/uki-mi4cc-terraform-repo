module "sns_topic_mi4cc" {
  source = "../../modules/uki-mi4cc-terraform-modules/sns"

  providers = {
    "aws" = "aws.mi4cc"
  }

  sns-topic-name       = "${var.source_market_name}-${var.sns-topic-name}"
  sns-display-name      = "${var.sns-display-name}"
  policy-file          =  "${data.template_file.sns_role_policy.rendered}"
  delivery-policy-file = "${data.template_file.sns_delivery_policy.rendered}"
}
