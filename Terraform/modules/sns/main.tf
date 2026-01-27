resource "aws_sns_topic" "this" {
  name = var.name
}

output "sns_arn" {
  value = aws_sns_topic.this.arn
}
