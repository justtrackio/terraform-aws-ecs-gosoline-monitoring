module "alarm_consumer" {
  for_each = { for consumer in length(data.gosoline_application_metadata_definition.main) > 0 ? element(data.gosoline_application_metadata_definition.main, 0).metadata.stream.consumers : [] : consumer.name => {
    metadata = consumer
  } }

  source = "./terraform-aws-ecs-alarm-consumer"
  #version = "2.2.0"
  context = module.this.context

  consumer_name          = each.value.metadata.name
  datapoints_to_alarm    = var.alarm_consumer.datapoints_to_alarm
  evaluation_periods     = var.alarm_consumer.evaluation_periods
  period                 = var.alarm_consumer.period
  success_rate_threshold = var.alarm_consumer.success_rate_threshold
}
