terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

}


provider "aws" {
  region = "ap-south-1"
}


# S3 Bucket for Terraform State

resource "aws_s3_bucket" "terraformyesstate" {

  bucket = "danesh854-springboot-platform-tfstate"

  tags = {
    Name = "terraform-state"
    Environment = "global"
  }

}


# Enable Versioning

resource "aws_s3_bucket_versioning" "terraform_state_versioning" {

  bucket = aws_s3_bucket.terraform_state.id


  versioning_configuration {
    status = "Enabled"
  }

}


# DynamoDB Lock Table

resource "aws_dynamodb_table" "terraform_lock" {

  name = "terraform-state-lock"

  billing_mode = "PAY_PER_REQUEST"

  hash_key = "LockID"


  attribute {
    name = "LockID"
    type = "S"
  }

}