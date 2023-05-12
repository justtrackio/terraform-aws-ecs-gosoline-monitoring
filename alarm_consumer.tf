module "alarm_consumer" {
  for_each = { for consumer in length(data.gosoline_application_metadata_definition.main) > 0 ? element(data.gosoline_application_metadata_definition.main, 0).metadata.stream.consumers : [] : consumer.name => {
    metadata = consumer
  } }

  source  = "justtrackio/ecs-alarm-consumer/aws"
  version = "1.0.1"

  alarm_description = jsonencode(merge({
    Severity    = "warning"
    Description = var.alarm_consumer.alarm_description
  }, module.this.tags, module.this.additional_tag_map))
  alarm_topic_arn     = data.aws_sns_topic.default.arn
  consumer_name       = each.value.metadata.name
  datapoints_to_alarm = var.alarm_consumer.datapoints_to_alarm
  evaluation_periods  = var.alarm_consumer.evaluation_periods
  period              = var.alarm_consumer.period
  threshold           = var.alarm_consumer.success_rate_threshold

  label_orders = var.label_orders
  context      = module.this.context
}
