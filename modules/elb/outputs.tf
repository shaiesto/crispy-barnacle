output "elb_dns" {
  value = aws_elb.main.dns_name
}

output "elb_id" {
  value = aws_elb.main.id
}

output "elb_arn" {
  value = aws_elb.main.arn
}
