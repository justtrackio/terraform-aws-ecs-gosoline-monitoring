locals {
  consumers = length(data.gosoline_application_metadata_definition.main) > 0 ? element(data.gosoline_application_metadata_definition.main, 0).metadata.stream.consumers : []
  default_alarm_consumer = {
    for consumer in local.consumers : consumer.name => {
      # defaults should be the same as in justtrackio/ecs-alarm-consumer/aws
      alarm_description      = null
      datapoints_to_alarm    = 3
      evaluation_periods     = 3
      period                 = 60
      success_rate_threshold = 99
    }
  }
  alarm_consumer = merge(local.default_alarm_consumer, var.alarm_consumer)
}

module "alarm_consumer" {
  for_each = {
    for consumer in local.consumers : consumer.name => {
      metadata = consumer
    }
  }

  source  = "justtrackio/ecs-alarm-consumer/aws"
  version = "1.1.0"

  alarm_description = jsonencode(merge({
    Severity    = "warning"
    Description = local.alarm_consumer[each.key].alarm_description
  }, module.this.tags, module.this.additional_tag_map))
  alarm_topic_arn     = data.aws_sns_topic.default.arn
  consumer_name       = each.value.metadata.name
  datapoints_to_alarm = local.alarm_consumer[each.key].datapoints_to_alarm
  evaluation_periods  = local.alarm_consumer[each.key].evaluation_periods
  period              = local.alarm_consumer[each.key].period
  threshold           = local.alarm_consumer[each.key].success_rate_threshold

  label_orders = var.label_orders
  context      = module.this.context
}
