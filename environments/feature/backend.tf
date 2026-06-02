terraform {

 backend "s3" {

 bucket = "danesh854-springboot-platform-tfstate"

 key = "feature/terraform.tfstate"

 region = "ap-south-1"

 use_lockfile = true

 dynamodb_table = "terraform-state-lock"

 encrypt = true

 }

}