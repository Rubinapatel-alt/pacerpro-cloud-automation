data "aws_iam_role" "lab_role" {
  name = "LabRole"
}

resource "aws_lambda_function" "this" {
  filename      = var.lambda_zip
  function_name = var.function_name
  role          = data.aws_iam_role.lab_role.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.11"

  environment {
    variables = {
      EC2_INSTANCE_ID = var.ec2_instance_id
      SNS_TOPIC_ARN   = "arn:aws:sns:us-west-2:702986236790:pacerpro-alerts"
    }
  }
}

output "lambda_name" {
  value = aws_lambda_function.this.function_name
}
