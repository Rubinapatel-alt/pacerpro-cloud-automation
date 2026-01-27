provider "aws" {
  region = "us-west-2"
}

module "pacer_ec2" {
  source        = "./modules/ec2"
  ami           = "ami-0abcdef1234567890"  # Replace with valid Amazon Linux 2 AMI
  instance_type = "t2.micro"
  name          = "PacerPro-Test-EC2"
}

module "pacer_sns" {
  source = "./modules/sns"
  name   = "pacerpro-alerts"
}

module "pacer_lambda" {
  source          = "./modules/lambda"
  lambda_zip      = "../lambda_function/lambda_function.zip"
  function_name   = "PacerProLambda"
  ec2_instance_id = module.pacer_ec2.instance_id
}
