locals {
  alarm_enabled            = var.alarm_enabled && lookup(module.this.tags, "Type", null) != "scheduled" ? 1 : 0
  grafana_dashboard_create = var.grafana_dashboard_enabled && lookup(module.this.tags, "Type", null) != "scheduled" ? 1 : 0
  containers               = var.containers != null ? var.containers : [module.ecs_label.id, "log_router"]
}

resource "grafana_dashboard" "main" {
  count       = local.grafana_dashboard_create
  folder      = data.grafana_folder.default.id
  overwrite   = true
  config_json = join("", data.gosoline_application_dashboard_definition.main[*].body)
}

resource "grafana_data_source" "elasticsearch" {
  count         = local.grafana_dashboard_create
  type          = "elasticsearch"
  name          = "elasticsearch-${module.elaticsearch_label.id}"
  url           = var.elasticsearch_host
  access_mode   = "proxy"
  database_name = "logs-${module.elaticsearch_label.id}"

  json_data_encoded = jsonencode({
    es_version        = "8.0+"
    time_field        = "@timestamp"
    log_message_field = "message"
    log_level_field   = "level"
  })
}
