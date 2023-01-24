locals {
  alarm_create = var.alarm_create && lookup(module.this.tags, "Type", null) != "scheduled" ? 1 : 0
}

data "gosoline_application_metadata_definition" "main" {
  count       = local.alarm_create
  project     = module.this.namespace
  environment = module.this.environment
  family      = module.this.stage
  application = module.this.name
}

data "gosoline_application_dashboard_definition" "main" {
  count       = var.grafana_dashboard_create ? 1 : 0
  project     = module.this.namespace
  environment = module.this.environment
  family      = module.this.stage
  application = module.this.name
  containers  = [module.this.name, "log_router"]
}
