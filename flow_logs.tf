resource "aws_flow_log" "vpc_flow_logs" {
  count = var.is_flow_log_req ? 1 : 0
  iam_role_arn    = aws_iam_role.vpc_flow[count.index].arn
  log_destination = aws_cloudwatch_log_group.vpx_flow_logs[count.index].arn
  traffic_type    = var.traffic_type
  vpc_id          = var.vpc_id
}

resource "aws_cloudwatch_log_group" "vpx_flow_logs" {
  count = var.is_flow_log_req ? 1 : 0
  name = "${var.project_name}-vpc_flow"
  skip_destroy = var.skip_destroy
  retention_in_days = var.retention_in_days

  tags = merge(
    var.common_tags,
    {
        Name = "${var.project_name}-vpc_flow_logs-${var.env}"
    }
  )
}

resource "aws_iam_role" "vpc_flow" {
  count = var.is_flow_log_req ? 1 : 0
  name               = "${var.project_name}-vpc_flow"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy" "vpc_flow" {
  count = var.is_flow_log_req ? 1 : 0
  name   = "${var.project_name}-vpc_flow"
  role   = aws_iam_role.vpc_flow[count.index].id
  policy = data.aws_iam_policy_document.example.json
}