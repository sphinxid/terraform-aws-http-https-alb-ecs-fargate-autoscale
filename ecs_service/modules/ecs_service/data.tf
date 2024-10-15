data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

data "aws_lb" "alb" {
  name = var.alb_name
}

data "aws_subnet" "subnets" {
  count = length(var.subnet_names)
  filter {
    name   = "tag:Name"
    values = [var.subnet_names[count.index]]
  }
}

data "aws_ecs_cluster" "ecs_cluster" {
  cluster_name = var.ecs_cluster_name
}

data "aws_lb_listener" "listener" {
  load_balancer_arn = data.aws_lb.alb.arn
  port              = var.alb_listener_port
}

data "aws_lb_listener" "listener-443" {
  load_balancer_arn = data.aws_lb.alb.arn
  port              = var.alb_listener_port_443
}

data "aws_cloudwatch_log_group" "log_group" {
  name = var.cloudwatch_log_group_name
}

data "aws_iam_role" "ecs_task_execution_role" {
  name = var.ecs_task_execution_role_name
}

data "aws_security_group" "alb_sg" {
  filter {
    name   = "tag:Name"
    values = [var.alb_sg_name]
  }
}