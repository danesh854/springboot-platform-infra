resource "aws_ecr_repository" "app" {

  name = var.repository_name


  image_scanning_configuration {

    scan_on_push = true

  }


  image_tag_mutability = "IMMUTABLE"


  encryption_configuration {

    encryption_type = "AES256"

  }


  tags = {

    Name = var.repository_name

    Environment = var.environment

  }

}