data "template_file" "s3_config_files_bucket_policy" {
template = "${file("${path.module}/files/ukiSearchServiceFailObjectRulesBucketPolicy.json")}"

  vars = {
#        S3_bucket_arn        = "${var.S3_bucket_arn}"
        S3_bucket_arn         = "${module.config_files_s3_bucket.s3_arn}"
	webstack_account_id  = "${lookup(var.mi4cc_account_id, terraform.workspace)}"
	#iam_role_arn        = "${lookup(var.iam_role_arn, terraform.workspace)}"
	iam_role_arn         = "${var.iam_role_arn}"
  }
}
