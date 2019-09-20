variable "core_acl" {
  description = "set acl for S3 bucket"
  default     = "private"
}

variable "acl_type" {
  description = "Server side encryption configuration"
  default     = "private"
}

variable "S3_Bucket_Name" {
  description = "name of Private S3 bucket"
  default     = "uki-avaya-config-files"
}

variable "block_bucket_public_acls" {
  description = "Whether Block Public ACL need to enable or not., Default is False"
  default     = "true"
}

variable "block_bucket_public_policy" {
  description = "Whether Block Public access bucket policy., Default is False"
  default     = "true"
}

variable "ignore_public_acls" {
  description = "Ignore Public access ACL for Bucket., Default is False"
  default     = "true"
}

variable "restrict_public_buckets" {
  description = "Restrict public access to S3 bucket which is mentioned in Policy., Default is False"
  default     = "true"
}

variable "iam_role_arn" {
  description = "Restrict public access to S3 bucket which is mentioned in Policy., Default is False"
  default     = "arn:aws:iam::320132909094:role/test_Lambda"
}

