module "alarm_kinsumer" {
  for_each = { for kinsumer in length(data.gosoline_application_metadata_definition.main) > 0 ? element(data.gosoline_application_metadata_definition.main, 0).metadata.cloud.aws.kinesis.kinsumers : [] : kinsumer.name => {
    metadata = kinsumer
  } }

  source  = "justtrackio/ecs-alarm-kinsumer/aws"
  version = "1.0.1"

  alarm_description = jsonencode(merge({
    Severity    = "warning"
    Description = var.alarm_kinsumer.alarm_description
  }, module.this.tags, module.this.additional_tag_map))
  alarm_topic_arn      = data.aws_sns_topic.default.arn
  datapoints_to_alarm  = var.alarm_kinsumer.datapoints_to_alarm
  evaluation_periods   = var.alarm_kinsumer.evaluation_periods
  kinsumer_name        = each.value.metadata.name
  kinsumer_stream_name = each.value.metadata.stream_name_full
  period               = var.alarm_kinsumer.period
  threshold            = var.alarm_kinsumer.threshold_seconds_behind

  label_orders = var.label_orders
  context      = module.this.context
}
