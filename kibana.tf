module "kibana_label" {
  source  = "justtrackio/label/null"
  version = "0.26.0"

  label_order      = var.label_orders.kibana
  label_value_case = "title"

  enabled   = var.kibana_data_view_enabled
  delimiter = " "

  context = module.this.context
}

resource "elasticstack_kibana_data_view" "default" {
  count = module.elasticsearch_label.enabled && module.kibana_label.enabled ? 1 : 0
  data_view = {
    allow_no_index  = true
    name            = module.kibana_label.id
    title           = "logs-${module.elasticsearch_label.id}"
    time_field_name = "@timestamp"
  }
  override = var.kibana_data_view_override
  space_id = var.kibana_space_id
}
