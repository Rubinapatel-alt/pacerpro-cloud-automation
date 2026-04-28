variable "ami" {
  description = "The AMI to use for the EC2 instance"
}

variable "instance_type" {
  description = "The type of EC2 instance"
  default     = "t2.micro"
}
