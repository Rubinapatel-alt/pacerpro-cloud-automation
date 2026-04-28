provider "aws" {
  region = "us-west-2" // Specify your desired AWS region
}

module "sns" {
  source = "./sns"
}

module "ec2" {
  source        = "./ec2"
  ami           = var.ami
  instance_type = var.instance_type
}

module "lambda" {
  source         = "./lambda"
  lambda_package = var.lambda_package
  sns_topic_arn  = module.sns.sns_topic_arn
}
