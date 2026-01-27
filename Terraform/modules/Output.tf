ec2/outputs.tf

output "instance_id" {
  value = aws_instance.this.id
}

sns/outputs.tf

output "sns_arn" {
  value = aws_sns_topic.this.arn
}

lambda/outputs.tf

output "lambda_name" {
  value = aws_lambda_function.this.function_name
}
