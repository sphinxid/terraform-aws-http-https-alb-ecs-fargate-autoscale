provider "aws" {
  region = "us-west-1"
}

data "aws_vpc" "myvpc" {
  filter {
    name   = "tag:Name"
    values = ["vpc-us-west-1-dev-main01"]
  }
}

## security group for ALB
resource "aws_security_group" "lb_security_group" {
  name        = "alb-security-group"
  description = "Allow inbound traffic to the load balancer"
  vpc_id      = data.aws_vpc.myvpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "alb-security-group"
  }
}
