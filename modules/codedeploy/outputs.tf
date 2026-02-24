output "codedeploy_app_name" {
  value = aws_codedeploy_app.strapi.name
}

output "deployment_group_name" {
  value = aws_codedeploy_deployment_group.strapi_dg.deployment_group_name
}