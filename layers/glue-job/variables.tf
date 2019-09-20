variable "connections" {
  description = "AZ for the ASG to stick to"
  type        = list(string)
  default     = ["uki-con-mi4cc-avaya"]
}

variable "jobnames" {
  description = "glue job name"
  type  = list(string)
  default  = ["uki-mi4cc-dev-one","uki-mi4cc-dev-two","uki-mi4cc-dev-three"]
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

