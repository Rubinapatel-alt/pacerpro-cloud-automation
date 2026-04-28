resource "aws_iam_role" "lambda_role" {
  name = "lambda_ec2_sns_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_policy" "lambda_policy" {
  name = "lambda_ec2_sns_policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = "ec2:RebootInstances"
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action   = "sns:Publish"
        Effect   = "Allow"
        Resource = var.sns_topic_arn
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_attach" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.lambda_policy.arn
}

resource "aws_lambda_function" "my_lambda" {
  function_name    = "RebootEC2Function"
  role             = aws_iam_role.lambda_role.arn
  handler          = "lambda_function.lambda_handler"
  runtime          = "python3.x"

  filename         = var.lambda_package
  source_code_hash = filebase64sha256(var.lambda_package)
}
