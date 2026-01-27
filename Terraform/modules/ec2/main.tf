resource "aws_instance" "this" {
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name = var.name
  }
}

output "instance_id" {
  value = aws_instance.this.id
}
