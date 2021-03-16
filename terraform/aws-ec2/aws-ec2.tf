terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-042e8287309f5df03"
  instance_type = "t2.micro"

  tags = {
    Name = "alzhe-test-temporary-instance. Will be removed soon."
  }
}
