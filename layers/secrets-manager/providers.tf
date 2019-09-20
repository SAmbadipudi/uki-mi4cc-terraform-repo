provider "aws" {
  alias  = "mi4cc"
  region = "${var.region}"
  assume_role {
    role_arn = "arn:aws:iam::${lookup(var.mi4cc_account_id, terraform.workspace)}:role/uki_iam_role_jenkins_user"
  }
}
