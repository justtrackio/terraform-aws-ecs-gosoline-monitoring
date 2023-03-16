locals {
  alarm_create = var.alarm_create && lookup(module.this.tags, "Type", null) != "scheduled" ? 1 : 0
}

data "gosoline_application_metadata_definition" "main" {
  count       = local.alarm_create
  project     = module.this.namespace
  environment = module.this.environment
  family      = module.this.namespace
  application = module.this.name
  group       = module.this.stage
}
