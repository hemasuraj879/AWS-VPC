resource "aws_ssm_parameter" "vpc_id" {
  name  = "vpc_id"
  type  = "String"
  value = aws_vpc.vpc.id
}