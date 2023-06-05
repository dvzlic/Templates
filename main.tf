# Configure the AWS provider
provider "aws" {
  access_key = "YOUR_AWS_ACCESS_KEY"
  secret_access_key = "YOUR_AWS_SECRET_ACCESS_KEY"
  region = "us-west-2"
}

# Create a security group
resource "aws_security_group" "example_sg" {
  name        = "example-sg"
  description = "Example Security Group"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create an EC2 instance
resource "aws_instance" "example_instance" {
  ami           = "ami-0c94855ba95c71c99"  # Amazon Linux 2 AMI ID
  instance_type = "t2.micro"
  key_name      = "your_key_pair_name"
  security_group_ids = [aws_security_group.example_sg.id]

  tags = {
    Name = "Example Instance"
  }
}
