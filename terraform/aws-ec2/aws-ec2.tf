terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
//  backend "s3" {
//    bucket         = "alzhe-terraform-state"
//    key            = "alzhe-test/terraform.tfstate"
//    region         = "us-east-1"
////    dynamodb_table = "terraform-up-and-running-locks"
//    encrypt        = true
//  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  for_each = toset(var.instance_name)
  ami           = "ami-013f17f36f8b1fefb"
  instance_type = "t2.micro"

  tags = {
    Name = each.value
  }
}
