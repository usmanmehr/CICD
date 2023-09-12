provider "aws" {
  region = "us-east-1"  # Specify your desired AWS region
}

resource "aws_instance" "example" {
  ami           = "ami-01c647eace872fc02"  # Specify the desired Amazon Machine Image (AMI)
  instance_type = "t2.micro"               # Specify the instance type

  tags = {
    Name = "CI/CD-Instance"  # Replace with your desired instance name
  }
}

# Define a security group to allow SSH access
resource "aws_security_group" "example" {
  name        = "example-ssh"
  description = "Allow SSH traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH access from anywhere (for demonstration purposes)
  }
}

# Associate the security group with the EC2 instance
resource "aws_instance" "example" {
  security_groups = [aws_security_group.example.name]
}

