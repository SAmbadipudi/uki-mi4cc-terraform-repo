module "config_files_s3_bucket" {
  source = "../../modules/uki-mi4cc-terraform-modules/s3"

  providers = {
    "aws"             			= "aws.mi4cc"
  }

  S3_Bucket_Name             	= "${var.source_market_name}-dev-s3-avaya-config-files"
  core_acl                   	= "${var.acl_type}"
  s3_bucket_policy           	= "${data.template_file.s3_config_files_bucket_policy.rendered}"
  block_bucket_public_acls   	= "${var.block_bucket_public_acls}"
  block_bucket_public_policy 	= "${var.block_bucket_public_policy}"
  ignore_public_acls      		= "${var.ignore_public_acls}"
  restrict_public_buckets 		= "${var.restrict_public_buckets}"
}
