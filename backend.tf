terraform {

  backend "s3" {

    bucket = "danesh854-springboot-platform-tfstate"

    key = "global/terraform.tfstate"

    region = "ap-south-1"

    dynamodb_table = "terraform-state-lock"

  }

}