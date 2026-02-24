variable "project_prefix" { 
  default = "nithin-strapi-v6" 
}

variable "vpc_id" { 
  default = "vpc-0e3c4ba63f48bf817" 
}

variable "public_subnets" {
  type    = list(string)
  default = ["subnet-09f5a8fbf473fe037", "subnet-065a13e8fac29a3d2"]
}

variable "private_subnets" {
  type    = list(string)
  default = ["subnet-0f528ccbb5eb596f6", "subnet-01db8f99b462527b6"]
}

variable "codedeploy_role_arn" { 
  default = "arn:aws:iam::811738710312:role/codedeploy_role" 
}

variable "ecs_task_role_arn" { 
  default = "arn:aws:iam::811738710312:role/ecs_fargate_taskRole" 
}