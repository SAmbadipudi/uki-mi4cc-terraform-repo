module "glue-db" {
  source = "../../modules/uki-mi4cc-terraform-modules/glue-db"

  providers = {
    "aws" = "aws.mi4cc"
  }
  
 jdbc-url = "jdbc:${var.db-provider}://${var.db-ip}:${var.db-port}/${var.dbname}"
 db-password = "${var.db-password}"
 db-username = "${var.db-username}"
 require-ssl = "${var.require-ssl}"
 glue-conn-name = "${var.source_market_name}-${lower("${lookup(var.environment, terraform.workspace)}")}-glue-con-${var.project_name}-avaya"
 avail-zone = "${var.avail-zone}"
 seg-id = "${var.seg-id}"
 sub-id = "${var.sub-id}"
  
}
