# 1. Security Groups Module
module "security" {
  source = "./modules/security"
  vpc_id = var.vpc_id
}

# 2. Application Load Balancer Module
module "alb" {
  source         = "./modules/alb"
  vpc_id         = var.vpc_id
  public_subnets = var.public_subnets
  alb_sg_id      = module.security.alb_sg_id
}

# 3. ECS Cluster & Service Module
module "ecs" {
  source            = "./modules/ecs"
  vpc_id            = var.vpc_id
  private_subnets   = var.private_subnets
  ecs_sg_id         = module.security.ecs_sg_id
  blue_tg_arn       = module.alb.blue_tg_arn
  task_role_arn     = var.ecs_task_role_arn
}

# 4. CodeDeploy Module (Blue/Green Logic)
module "codedeploy" {
  source           = "./modules/codedeploy"
  cluster_name     = module.ecs.cluster_name
  service_name     = module.ecs.service_name
  alb_listener_arn = module.alb.listener_arn
  blue_tg_name     = module.alb.blue_tg_name
  green_tg_name    = module.alb.green_tg_name
  task_role_arn    = var.ecs_task_role_arn
}