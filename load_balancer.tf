resource "aws_lb" "test" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.nomad-sg.id]
  # subnets            = flatten(["${aws_subnet.nomad-lab-pub.*.id}"])
  subnets = flatten([values(local.subnet_ids)])

  enable_deletion_protection = false

  tags = {
    Environment = "production"
  }
}


resource "aws_lb_listener" "front_end_https" {
  load_balancer_arn = "${aws_lb.test.arn}"
  port              = "443"
  protocol          = "HTTPS"

  ssl_policy = "ELBSecurityPolicy-TLS13-1-2-2021-06"
  certificate_arn = "arn:aws:acm:us-east-2:011880685863:certificate/208f637e-ba55-4313-8c3f-837df4687fb4"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.test.arn}"
  }
}

resource "aws_lb_target_group" "test" {
  name     = "tf-example-lb-tg"
  port     = 8080
  protocol = "HTTP"
  # vpc_id   = "${aws_vpc.nomad-lab-vpc.id}"
  vpc_id   = "${data.aws_vpc.nomad-lab-vpc.id}"
  health_check {
    healthy_threshold = var.health_check["healthy_threshold"]
    interval = var.health_check["interval"]
    unhealthy_threshold = var.health_check["unhealthy_threshold"]
    timeout = var.health_check["timeout"]
    path = var.health_check["path"]
    port = var.health_check["port"]
  }
}
