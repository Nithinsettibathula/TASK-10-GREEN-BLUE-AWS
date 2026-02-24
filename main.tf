module "security" {
  source         = "./modules/security"
  project_prefix = var.project_prefix
  vpc_id         = var.vpc_id
}

module "alb" {
  source         = "./modules/alb"
  project_prefix = var.project_prefix
  vpc_id         = var.vpc_id
  public_subnets = var.public_subnets
  alb_sg_id      = module.security.alb_sg_id
}

module "ecs" {
  source            = "./modules/ecs"
  project_prefix    = var.project_prefix
  vpc_id            = var.vpc_id
  private_subnets   = var.private_subnets
  ecs_sg_id         = module.security.ecs_sg_id
  blue_tg_arn       = module.alb.blue_tg_arn
  ecs_task_role_arn = var.ecs_task_role_arn
}

module "codedeploy" {
  source              = "./modules/codedeploy"
  project_prefix      = var.project_prefix
  codedeploy_role_arn = var.codedeploy_role_arn
  cluster_name        = module.ecs.cluster_name
  service_name        = module.ecs.service_name
  listener_arn        = module.alb.listener_arn
  blue_tg_name        = module.alb.blue_tg_name
  green_tg_name       = module.alb.green_tg_name
}