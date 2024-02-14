locals {
  servers = length(data.gosoline_application_metadata_definition.main) > 0 ? element(data.gosoline_application_metadata_definition.main, 0).metadata.httpservers : []
  handlers = flatten([
    for server in local.servers : [
      for handler in server.handlers : {
        method      = handler.method
        path        = handler.path
        server_name = server.name
      }
    ]
  ])
}

module "alarm_gateway" {
  for_each = {
    for handler in local.handlers : "${handler.server_name}:${handler.method}:${handler.path}" => handler
  }

  source  = "justtrackio/ecs-alarm-gateway/aws"
  version = "1.2.0"

  alarm_description = jsonencode(merge({
    Severity    = "warning"
    Description = var.alarm_gateway.alarm_description
  }, module.this.tags, module.this.additional_tag_map))
  alarm_topic_arn     = data.aws_sns_topic.default.arn
  datapoints_to_alarm = var.alarm_gateway.datapoints_to_alarm
  evaluation_periods  = var.alarm_gateway.evaluation_periods
  method              = each.value.method
  path                = each.value.path
  period              = var.alarm_gateway.period
  server_name         = each.value.server_name
  threshold           = var.alarm_gateway.success_rate_threshold

  label_orders = var.label_orders
  context      = module.this.context
}
