variable "aws_region" {
  description = "AWS Region"
  default     = "us-east-1" 
}

variable "vpc_id" {
  default = "vpc-0b4d6262d67525f8b"
}

variable "public_subnets" {
  type    = list(string)
  default = ["subnet-07720f09127d19cc7", "subnet-022704c446337b2ce"]
}

variable "private_subnets" {
  type    = list(string)
  default = ["subnet-07720f09127d19cc7", "subnet-022704c446337b2ce"]
}

variable "ecs_task_role_arn" {
  default = "arn:aws:iam::811738710312:role/ecs_fargate_taskRole"
}