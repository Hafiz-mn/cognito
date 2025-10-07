variable "region" {
  default = "eu-north-1"
}

variable "slack_webhook" {
  description = "Slack webhook URL"
}

variable "table_name" {
  default = "UsersTable"
}

variable "lambda_runtime" {
  default = "python3.11"
}

