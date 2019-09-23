provider "aws" {
  alias  = "mi4cc"
  region = "${var.region}"
  assume_role {
    role_arn = "arn:aws:iam::${lookup(var.mi4cc_account_id, terraform.workspace)}:role/test_Lambda"
  }
}
