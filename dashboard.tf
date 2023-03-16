locals {
  grafana_dashboard_create            = var.grafana_dashboard_create && lookup(module.this.tags, "Type", null) != "scheduled" ? 1 : 0
  grafana_elasticsearch_index_pattern = var.grafana_elasticsearch_index_pattern != "" ? var.grafana_elasticsearch_index_pattern : "logs-${module.this.namespace}-${module.this.stage}-${module.this.name}"
}

data "gosoline_application_dashboard_definition" "main" {
  count       = local.grafana_dashboard_create
  project     = module.this.namespace
  environment = module.this.environment
  family      = module.this.namespace
  application = module.this.name
  containers  = var.containers
  group       = module.this.stage
}

resource "grafana_dashboard" "main" {
  count       = local.grafana_dashboard_create
  folder      = var.grafana_folder_id
  overwrite   = true
  config_json = join("", data.gosoline_application_dashboard_definition.main[*].body)
}

resource "grafana_data_source" "elasticsearch" {
  count         = local.grafana_dashboard_create
  type          = "elasticsearch"
  name          = "elasticsearch-${module.this.environment}-${local.grafana_elasticsearch_index_pattern}"
  url           = var.elasticsearch_host
  access_mode   = "proxy"
  database_name = local.grafana_elasticsearch_index_pattern

  json_data {
    es_version        = "8.0+"
    time_field        = "@timestamp"
    log_message_field = "message"
    log_level_field   = "level"
  }
}
