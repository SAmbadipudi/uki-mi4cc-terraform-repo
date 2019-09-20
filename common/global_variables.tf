variable "region" {
  description = "AWS region that will be used to create resources in."
  default     = "eu-central-1"
}

variable "source_market_name" {
  description = "Name of the source market"
  default     = "uki"
}

variable "project_name" {
  description = "Name of the project"
  default     = "mi4cc"
}

variable "mi4cc_account_id" {
  type        = "map"
  description = "AWS accounts ids where webstack infrastructure will be deployed"

  default = {
    "default"   = ""
    "DEV"       = "195211983652"
    "TEST"      = "124742628640"
    "PROD"      = "195211983652"
  }
}

