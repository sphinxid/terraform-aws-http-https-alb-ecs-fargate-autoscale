module "ecs_service" {
  source = "../../modules/ecs_service"

  region                    = "us-west-1"
  vpc_name                  = "vpc-us-west-1-dev-main01"
  alb_name                  = "alb-us-west-1-dev-ecs-app01"
  subnet_names              = ["subnet-us-west-1-dev-main01-public-b", "subnet-us-west-1-dev-main01-public-c"]
  ecs_cluster_name          = "ecs-cluster01"
  cloudwatch_log_group_name = "/ecs/ecs-cluster01"

  ecs_task_execution_role_name = "ecs-task-execution-role"
  alb_sg_name               = "alb-security-group"

  service_name              = "lighttpd-service"
  container_name            = "lighttpd"
  container_image           = "rtsp/lighttpd"
  container_cpu             = 256
  container_memory          = 512
  container_port            = 80
  desired_count             = 1
  health_check_path         = "/"
  health_check_matcher      = "200,400-410"
  alb_listener_port         = 80
  alb_listener_port_443     = 443
  alb_listener_rule_priority = 130
  alb_listener_rule_priority_443 = 131
  service_path_pattern      = "/service-lighttpd/*"

  # Autoscaling configuration
  enable_autoscaling        = true
  autoscaling_min_capacity  = 1
  autoscaling_max_capacity  = 3
  autoscaling_cpu_target    = 70
}
