variable "region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-west-1"
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "alb_name" {
  description = "The name of the Application Load Balancer"
  type        = string
}

variable "subnet_names" {
  description = "List of subnet names for the ECS service"
  type        = list(string)
}

variable "ecs_cluster_name" {
  description = "The name of the ECS cluster"
  type        = string
}

variable "cloudwatch_log_group_name" {
  description = "The name of the CloudWatch log group"
  type        = string
}

variable "service_name" {
  description = "The name of the ECS service"
  type        = string
}

variable "container_name" {
  description = "The name of the container"
  type        = string
}

variable "container_image" {
  description = "The Docker image for the container"
  type        = string
}

variable "container_cpu" {
  description = "The number of CPU units for the container"
  type        = number
  default     = 256
}

variable "container_memory" {
  description = "The amount of memory for the container in MiB"
  type        = number
  default     = 256
}

variable "container_port" {
  description = "The port number on the container"
  type        = number
  default     = 80
}

variable "desired_count" {
  description = "The desired number of tasks in the ECS service"
  type        = number
  default     = 1
}

variable "health_check_path" {
  description = "The path for the ALB health check"
  type        = string
  default     = "/"
}

variable "health_check_matcher" {
  description = "The HTTP status code for the health check"
  type        = string
  default     = "200"
}

variable "alb_listener_port" {
  description = "The port for the HTTP ALB listener"
  type        = number
  default     = 80
}

variable "alb_listener_port_443" {
  description = "The port for the HTTPS ALB listener"
  type        = number
  default     = 443
}

variable "alb_listener_rule_priority" {
  description = "The priority for the ALB listener rule"
  type        = number
}

variable "alb_listener_rule_priority_443" {
  description = "The priority for the ALB listener rule"
  type        = number
}

variable "service_path_pattern" {
  description = "The path pattern for routing to this service"
  type        = string
}

variable "enable_autoscaling" {
  description = "Enable autoscaling for the ECS service"
  type        = bool
  default     = false
}

variable "autoscaling_min_capacity" {
  description = "Minimum number of tasks for autoscaling"
  type        = number
  default     = 1
}

variable "autoscaling_max_capacity" {
  description = "Maximum number of tasks for autoscaling"
  type        = number
  default     = 3
}

variable "autoscaling_cpu_target" {
  description = "Target CPU utilization for autoscaling"
  type        = number
  default     = 70
}

variable "ecs_task_execution_role_name" {
  description = "The name of the ECS task execution IAM role"
  type        = string
  default     = "ecs-task-execution-role"
}

variable "alb_sg_name" {
  description = "The name of the ALB security group"
  type        = string
  default     = "alb-sg"
}