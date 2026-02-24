variable "cluster_name" {
  type = string
}

variable "service_name" {
  type = string
}

variable "alb_listener_arn" {
  type = string
}

variable "blue_tg_name" {
  type = string
}

variable "green_tg_name" {
  type = string
}

variable "task_role_arn" {
  type = string
}