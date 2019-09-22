variable "region" {
  description = "AWS region that will be used to create resources in."
  default     = "us-west-2"
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
    "DEV"       = "320132909094"
    "TEST"      = "124742628640"
    "PROD"      = "195211983652"
  }
}

variable "environment" {
  description = "Specifies which environment the resources belongs to."
  default = {
    "default" = ""
    "DEV"     = "DEV"
    "TEST"    = "TEST"
    "PROD"    = "PROD"
  }
}

variable "Owner-CreatedBy" {
  description = "Owner for this environment"
  default     = "Sikinder Kodavath / sikinder.kodavath@tui.co.uk"
}

variable "Owner-Data" {
  description = "Owner data for this environment"
  default     = "David Wheatley / david.wheatley@tui.co.uk"
}

variable "Owner-Infra" {
  description = "Owner infra for this environment"
  default     = "Richard Kerr / richard.kerr@tui.co.uk"
}

variable "Project-Name" {
  description = "Project Name"
  default     = "Operation MI For Contact Centre"
}

variable "Project-SubProjectName" {
  description = "Sub project name"
  default     = "Avaya"
}

variable "Project-WBSCode" {
  description = "WBS code for this project"
  default     = "O6.0041.003816"
}

variable "technical_owner" {
  description = "Technical Owner for this environment"
  default     = "Richard Kerr / richard.kerr@tui.co.uk"
}

variable "billing_code" {
  description = "Billing code for this environment"
  default     = "O6.0041.003816"
}

variable "compliance" {
  description = "Compliance for this environment"
  default     = "Normal"
}


