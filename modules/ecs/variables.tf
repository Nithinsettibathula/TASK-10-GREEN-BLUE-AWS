variable "project_prefix" {}
variable "vpc_id" {}
variable "private_subnets" { type = list(string) }
variable "ecs_sg_id" {}
variable "blue_tg_arn" {}
variable "ecs_task_role_arn" {}