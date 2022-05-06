output "public_subnet" {
  value = aws_subnet.main[0].id
}

output "private_subnet1" {
  value = aws_subnet.main[1].id
}

output "private_subnet2" {
  value = aws_subnet.main[2].id
}

output "vpc" {
  value = aws_vpc.main.id
}
