resource "aws_route53_zone" "private" {
  name = "temp.theroos.co.za"

  vpc {
    vpc_id = var.vpc
  }
}

resource "aws_acm_certificate" "test" {
  domain_name       = "temp.theroos.co.za"
  validation_method = "DNS"
}

resource "aws_route53_record" "validate" {
  for_each = {
    for dvo in aws_acm_certificate.test.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = aws_route53_zone.private.zone_id
}

resource "aws_acm_certificate_validation" "test" {
  certificate_arn         = aws_acm_certificate.test.arn
  validation_record_fqdns = [for record in aws_route53_record.validate : record.fqdn]
  timeouts { create = "1m" }
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_elb" "main" {
  name               = "test"
  availability_zones = data.aws_availability_zones.available.names

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  listener {
    instance_port      = 443
    instance_protocol  = "https"
    lb_port            = 443
    lb_protocol        = "https"
    ssl_certificate_id = aws_acm_certificate.test.arn
  }
}