data "template_file" "sns_role_policy" {
template = "${file("${path.module}/files/ukiSNSPolicy.json")}"

  vars = {
        sns_top_arn         =  "${module.sns_topic_mi4cc.sns_arn}"
        webstack_account_id  = "${lookup(var.webstack_account_id, terraform.workspace)}"
        environment    = "dev"
        source_market_name = "uki"
  }
}

data "template_file" "sns_delivery_policy" {
template = "${file("${path.module}/files/ukiSNSDeliveryPolicy.json")}"
}
