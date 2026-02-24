resource "aws_ecr_repository" "strapi_repo" {
  name                 = "nithin-strapi-repo"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}