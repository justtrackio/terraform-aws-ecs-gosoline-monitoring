locals {
  routes = distinct(sort([for path in length(data.gosoline_application_metadata_definition.main) > 0 ? element(data.gosoline_application_metadata_definition.main, 0).metadata.apiserver.routes : [] : path.path]))
}

module "alarm_gateway" {
  for_each = { for path in local.routes : path => {
    path = path
  } }

  source  = "justtrackio/ecs-alarm-gateway/aws"
  version = "1.0.0"

  alarm_description = jsonencode(merge({
    Severity    = "warning"
    Description = var.alarm_gateway.alarm_description
  }, module.this.tags, module.this.additional_tag_map))
  alarm_topic_arn     = data.aws_sns_topic.default.arn
  datapoints_to_alarm = var.alarm_gateway.datapoints_to_alarm
  evaluation_periods  = var.alarm_gateway.evaluation_periods
  path                = each.value.path
  period              = var.alarm_gateway.period
  threshold           = var.alarm_gateway.success_rate_threshold

  label_orders = var.label_orders
  context      = module.this.context
}
