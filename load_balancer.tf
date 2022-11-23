resource "aws_lb_target_group" "alb_target_group" {
  name     = "test-target-group"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = aws_vpc.nomad-lab-vpc.id
  target_type = "instance"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/24"
}

resource "aws_lb" "alb" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.nomad-sg.id]
  subnets            = [for subnet in aws_subnet.nomad-lab-vpc : subnet.id]

  enable_deletion_protection = true

  tags = {
    Environment = "production"
  }
}

resource "aws_alb_listener" "alb_listener" {  
  load_balancer_arn = "${aws_alb.alb.arn}"  
  port              = "${var.alb_listener_port}"  
  protocol          = "${var.alb_listener_protocol}"
  
  default_action {    
    target_group_arn = "${aws_alb_target_group.alb_target_group.arn}"
    type             = "forward"  
  }
}


