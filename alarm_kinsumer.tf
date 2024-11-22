locals {
  kinsumers = { for kinsumer in length(data.gosoline_application_metadata_definition.main) > 0 ? element(data.gosoline_application_metadata_definition.main, 0).metadata.cloud.aws.kinesis.kinsumers : [] : kinsumer.name => {
    metadata = kinsumer
  }... }
  kinsumer_keys = keys(local.kinsumers)
  # There can be more than one kinsumer with the same name if the application is not configured correctly. The terraform module should not fail due to the app not being configured correctly though.
  kinsumer_metadatas = { for kinsumer_key in local.kinsumer_keys : kinsumer_key => local.kinsumers[kinsumer_key][0] }
  default_alarm_kinsumer = {
    for kinsumer in local.kinsumer_metadatas : kinsumer.metadata.name => {
      # defaults should be the same as in the justtrackio/ecs-alarm-kinsumer/aws
      alarm_description        = null
      datapoints_to_alarm      = 1
      evaluation_periods       = 1
      period                   = 60
      threshold_seconds_behind = 3600
      alarm_priority_high      = "high"
      alarm_priority_warning   = "warning"
    }
  }
  alarm_kinsumer = merge(local.default_alarm_kinsumer, var.alarm_kinsumer)
}

module "alarm_kinsumer" {
  for_each = local.kinsumer_metadatas

  source  = "justtrackio/ecs-alarm-kinsumer/aws"
  version = "1.1.1"

  alarm_description = jsonencode(merge({
    Severity    = "warning"
    Description = local.alarm_kinsumer[each.key].alarm_description
  }, module.this.tags, module.this.additional_tag_map))
  alarm_topic_arn        = data.aws_sns_topic.default.arn
  alarm_priority_high    = local.alarm_kinsumer[each.key].alarm_priority_high
  alarm_priority_warning = local.alarm_kinsumer[each.key].alarm_priority_warning
  datapoints_to_alarm    = local.alarm_kinsumer[each.key].datapoints_to_alarm
  evaluation_periods     = local.alarm_kinsumer[each.key].evaluation_periods
  kinsumer_name          = each.value.metadata.name
  kinsumer_stream_name   = each.value.metadata.stream_name_full
  period                 = local.alarm_kinsumer[each.key].period
  threshold              = local.alarm_kinsumer[each.key].threshold_seconds_behind

  label_orders = var.label_orders
  context      = module.this.context
}
