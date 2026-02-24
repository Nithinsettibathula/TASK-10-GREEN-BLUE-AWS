variable "vpc_id" {
  type = string
}

variable "private_subnets" {
  type = list(string)
}

variable "ecs_sg_id" {
  type = string
}

variable "blue_tg_arn" {
  type = string
}

variable "task_role_arn" {
  type = string
}