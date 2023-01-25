locals {
  routes = distinct(sort([for path in length(data.gosoline_application_metadata_definition.main) > 0 ? element(data.gosoline_application_metadata_definition.main, 0).metadata.apiserver.routes : [] : path.path]))
}

module "alarm_gateway" {
  for_each = { for path in local.routes : path => {
    path = path
  } }

  source = "./terraform-aws-ecs-alarm-gateway"
  #version = "2.2.0"

  alarm_description      = var.alarm_gateway.alarm_description
  alarm_topic_arn        = var.alarm_topic_arn
  datapoints_to_alarm    = var.alarm_gateway.datapoints_to_alarm
  evaluation_periods     = var.alarm_gateway.evaluation_periods
  path                   = each.value.path
  period                 = var.alarm_gateway.period
  success_rate_threshold = var.alarm_gateway.success_rate_threshold

  label_orders = var.label_orders
  context      = module.this.context
}
