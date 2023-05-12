module "alarm_scheduled" {
  count = var.alarm_enabled && lookup(module.this.tags, "Type", null) == "scheduled" ? 1 : 0

  source  = "justtrackio/ecs-alarm-scheduled/aws"
  version = "1.0.0"

  alarm_description = jsonencode(merge({
    Severity    = "warning"
    Description = var.alarm_scheduled.alarm_description
  }, module.this.tags, module.this.additional_tag_map))
  alarm_topic_arn     = data.aws_sns_topic.default.arn
  datapoints_to_alarm = var.alarm_scheduled.datapoints_to_alarm
  evaluation_periods  = var.alarm_scheduled.evaluation_periods
  period              = var.alarm_scheduled.period
  threshold           = var.alarm_scheduled.threshold

  label_orders = var.label_orders
  context      = module.this.context
}
