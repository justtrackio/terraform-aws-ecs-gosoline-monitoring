locals {
  kinsumers = { for kinsumer in length(data.gosoline_application_metadata_definition.main) > 0 ? element(data.gosoline_application_metadata_definition.main, 0).metadata.cloud.aws.kinesis.kinsumers : [] : kinsumer.name => {
    metadata = kinsumer
  }... }
  kinsumer_keys = keys(local.kinsumers)
  # There can be more than one kinsumer with the same name if the application is not configured correctly. The terraform module should not fail due to the app not being configured correctly though.
  kinsumer_metadatas = { for kinsumer_key in local.kinsumer_keys : kinsumer_key => local.kinsumers[kinsumer_key][0] }
}

module "alarm_kinsumer" {
  for_each = local.kinsumer_metadatas

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
