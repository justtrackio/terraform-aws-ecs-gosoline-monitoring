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
  default_alarm_gateway = {
    for handler in local.handlers : "${handler.server_name}:${handler.method}:${handler.path}" => {
      # defaults should be the same as in justtrackio/ecs-alarm-gateway/aws
      alarm_description      = null
      datapoints_to_alarm    = 3
      evaluation_periods     = 3
      period                 = 60
      success_rate_threshold = 99
      alarm_levels           = ["warning", "high"]
    }
  }
  alarm_gateway = merge(local.default_alarm_gateway, var.alarm_gateway)
}

module "alarm_gateway" {
  for_each = {
    for handler in local.handlers : "${handler.server_name}:${handler.method}:${handler.path}" => handler
  }

  source  = "justtrackio/ecs-alarm-gateway/aws"
  version = "1.3.1"

  alarm_description = merge({
    Description = local.alarm_gateway[each.key].alarm_description
  }, module.this.tags, module.this.additional_tag_map)
  alarm_topic_arn     = data.aws_sns_topic.default.arn
  alarm_levels        = local.alarm_gateway[each.key].alarm_levels
  datapoints_to_alarm = local.alarm_gateway[each.key].datapoints_to_alarm
  evaluation_periods  = local.alarm_gateway[each.key].evaluation_periods
  method              = each.value.method
  path                = each.value.path
  period              = local.alarm_gateway[each.key].period
  server_name         = each.value.server_name
  threshold           = local.alarm_gateway[each.key].success_rate_threshold

  label_orders = var.label_orders
  context      = module.this.context
}
