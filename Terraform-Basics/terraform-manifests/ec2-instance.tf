#Terraform Settings Block
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      #version = "~> 3.21" #Optional bu recommended in production
    }
  }
}

#Provider Block
provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

#Resource Block
resource "aws_instance" "ec2demo" {
  ami           = "ami-0cff7528ff583bf9a"
  instance_type = "t2.micro"
}
