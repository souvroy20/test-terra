terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "terraform_instance" {
  key_name   = var.terraform_key
  public_key = "${tls_private_key.example.public_key_openssh}"
}

resource "local_file" "terra_key" {
  content  = tls_private_key.example.private_key_pem
  filename = var.terraform_key
}