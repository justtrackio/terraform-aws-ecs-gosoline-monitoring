locals {
  grafana_elasticsearch_index_pattern = var.grafana_elasticsearch_index_pattern != "" ? var.grafana_elasticsearch_index_pattern : "logs-${module.this.namespace}-${module.this.stage}-${module.this.name}"
}

resource "grafana_dashboard" "main" {
  count       = var.grafana_dashboard_create ? 1 : 0
  folder      = var.grafana_folder_id
  overwrite   = true
  config_json = join("", data.gosoline_application_dashboard_definition.main[*].body)
}

resource "grafana_data_source" "elasticsearch" {
  count         = var.grafana_dashboard_create ? 1 : 0
  type          = "elasticsearch"
  name          = "elasticsearch-${module.this.environment}-${local.grafana_elasticsearch_index_pattern}"
  url           = var.elasticsearch_host
  access_mode   = "proxy"
  database_name = local.grafana_elasticsearch_index_pattern

  json_data {
    es_version        = "8.5.2"
    time_field        = "@timestamp"
    log_message_field = "message"
    log_level_field   = "level"
  }
}
