module "alarm_kinsumer" {
  for_each = { for kinsumer in length(data.gosoline_application_metadata_definition.main) > 0 ? element(data.gosoline_application_metadata_definition.main, 0).metadata.cloud.aws.kinesis.kinsumers : [] : kinsumer.name => {
    metadata = kinsumer
  } }

  source = "./terraform-aws-ecs-alarm-kinsumer"
  #version = "2.0.0"
  context = module.this.context

  datapoints_to_alarm      = var.alarm_kinsumer.datapoints_to_alarm
  evaluation_periods       = var.alarm_kinsumer.evaluation_periods
  kinsumer_name            = each.value.metadata.name
  kinsumer_stream_name     = each.value.metadata.stream_name_full
  period                   = var.alarm_kinsumer.period
  threshold_seconds_behind = var.alarm_kinsumer.threshold_seconds_behind
}
