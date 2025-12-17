# Load Balancing module

resource "aws_lb" "main" {
  name               = "holiday-shopping-app-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = aws_subnet.main[*].id

  enable_deletion_protection = false

  tags = {
    Name = "holiday-shopping-app-lb"
  }
}

resource "aws_security_group" "lb_sg" {
  name_prefix = "holiday-shopping-app-lb-sg"

  ingress {
    from_port   = 80
    to_port     = 80
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
    Name = "holiday-shopping-app-lb-sg"
  }
}
