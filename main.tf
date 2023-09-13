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

