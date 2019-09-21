variable "db-provider" {
  description = "Name of the Database provider"
  default   =  "informix-sqli"
}

variable "db-ip" {
  description = "Hostname of IP of the Database server"
  default   =  "10.32.254.50"
}

variable "db-port" {
  description = "Port which is used to connect to Informix DB"
  default   =  "1972"
}

variable "dbname" {
  description = "Informix Database name"
  default   =  "CCMS_STAT"
}

variable "db-password" {
  description = "Password to connect to the Informix Database schema"
  default   =  "test123"
}

variable "require-ssl" {
 description = "Secure Sockets Layer (SSL) with hostname matching is enforced for the JDBC connection on the client"
 default = "true"
}

variable "db-username" {
  description = "Username to connect to the Informix Database shcema"
  default   =  "avaya"
}

variable "avail-zone" {
  description = "Availability Zone for the JDBC connection"
  default   =  "us-west-2"
}

variable "seg-id" {
  description = "Security group ID"
  type        = "list"
  default   =  ["sg-0c5d03b36b5448eae", "sg-0afe0abc6dda330a7"]
}

variable "sub-id" {
  description = "Subnet information required"
  default   =  "subnet-053beef343cd1ab9b"
}

