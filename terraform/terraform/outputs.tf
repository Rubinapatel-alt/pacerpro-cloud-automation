output "ec2_instance_id" {
  value = module.ec2.instance_id
}

output "sns_topic_arn" {
  value = module.sns.sns_topic_arn
}

output "lambda_function_arn" {
  value = module.lambda.lambda_function_arn
}
