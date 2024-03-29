variable "connections" {
  description = "AZ for the ASG to stick to"
  type        = "list"
  default     = ["uki-con-mi4cc-avaya"]
}

variable "jobnames" {
  description = "glue job name"
  type  = "list"
  default  = ["uki-test-job"]
}

variable "database_name" {
  description = "Database name"
  default     = "avaya"
}

variable "TempDir" {
  description = "Temperory Directory which Glue process is using for ETL process"
  default     = "s3://uki-dev-sri-s3-mi4cc-temp"
}

variable "extra-jars" {
  description = "JDBC jar file location to establish connection with Informix DB"
  default     = "s3://uki-dev-sri-s3-mi4cc/uki/contactcentre/avaya/cache-jdbc/cache-jdbc-2.0.0.jar"
}
