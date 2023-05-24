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

data "gosoline_application_dashboard_definition" "main" {
  count       = local.grafana_dashboard_create
  project     = module.this.namespace
  environment = module.this.environment
  family      = module.this.namespace
  application = module.this.name
  containers  = local.containers
  group       = module.this.stage
}

data "grafana_folder" "default" {
  title = module.this.namespace
}

data "aws_sns_topic" "default" {
  name = "${module.this.environment}-alarms"
}

data "aws_ssm_parameter" "grafana_token" {
  name = "/grafana/token"
}
