resource "aws_route53_record" "myapp" {
    zone_id = var.zone_id
    name = "myapp.michaelamos.ninja"
    type = "A"

    alias {
      name = aws_lb.test.dns_name
      zone_id = aws_lb.test.zone_id
      evaluate_target_health = true
    }
}

resource "aws_route53_record" "chris" {
    zone_id = var.zone_id
    name = "chris.michaelamos.ninja"
    type = "A"

    alias {
      name = aws_lb.test.dns_name
      zone_id = aws_lb.test.zone_id
      evaluate_target_health = true
    }
}

resource "aws_route53_record" "ryan" {
    zone_id = var.zone_id
    name = "ryan.michaelamos.ninja"
    type = "A"

    alias {
      name = aws_lb.test.dns_name
      zone_id = aws_lb.test.zone_id
      evaluate_target_health = true
    }
}

resource "aws_route53_record" "http-echo" {
    zone_id = var.zone_id
    name = "http-echo.michaelamos.ninja"
    type = "A"

    alias {
      name = aws_lb.test.dns_name
      zone_id = aws_lb.test.zone_id
      evaluate_target_health = true
    }
}
