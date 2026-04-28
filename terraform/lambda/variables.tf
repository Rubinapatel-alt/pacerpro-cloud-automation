variable "lambda_package" {
  description = "Path to the zipped Lambda function package"
}

variable "sns_topic_arn" {
  description = "The SNS topic ARN to which the Lambda function can publish"
}
