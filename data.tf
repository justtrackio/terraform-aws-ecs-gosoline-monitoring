locals {
  alarm_enabled = var.alarm_enabled && lookup(module.this.tags, "Type", null) != "scheduled" ? 1 : 0
}

data "gosoline_application_metadata_definition" "main" {
  count       = local.alarm_enabled
  project     = module.this.namespace
  environment = module.this.environment
  family      = module.this.namespace
  application = module.this.name
  group       = module.this.stage
}

data "aws_sns_topic" "default" {
  name = "${var.environment}-alarms"
}

data "aws_ssm_parameter" "grafana_token" {
  name = "/grafana/token"
}
