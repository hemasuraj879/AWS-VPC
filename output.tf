output "vpc_id" {
  description = "Getting vpc id value"
  value = aws_vpc.vpc.id
}

output "vpc_arn" {
  description = "Getting vpc id arn"
  value = aws_vpc.vpc.arn
}

output "public_subnet_ids" {
  description = "Getting public subnet ids"
  value = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "Getting private subnet ids"
  value = aws_subnet.private[*].id
}