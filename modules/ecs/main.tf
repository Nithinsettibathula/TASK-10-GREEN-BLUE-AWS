resource "aws_ecs_cluster" "main" {
  name = "${var.project_prefix}-cluster"
}

resource "aws_ecs_task_definition" "strapi" {
  family                   = "${var.project_prefix}-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  
  execution_role_arn       = var.ecs_task_role_arn
  task_role_arn            = var.ecs_task_role_arn

  container_definitions = jsonencode([{
    name  = "strapi"
    image = "strapi/strapi:latest"
    portMappings = [{
      containerPort = 1337
      hostPort      = 1337
    }]
    # Log configuration removed to bypass AccessDenied errors
  }])
}

resource "aws_ecs_service" "strapi" {
  name            = "${var.project_prefix}-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.strapi.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  deployment_controller {
    type = "CODE_DEPLOY"
  }

  load_balancer {
    target_group_arn = var.blue_tg_arn
    container_name   = "strapi"
    container_port   = 1337
  }

  network_configuration {
    subnets         = var.private_subnets
    security_groups = [var.ecs_sg_id]
  }

  lifecycle {
    ignore_changes = [load_balancer, task_definition]
  }
}