module "elaticsearch_label" {
  source  = "cloudposse/label/null"
  version = "0.25.0"

  label_order = var.label_orders.elasticsearch

  context = module.this.context
}

locals {
  elasticsearch_create_objects              = var.elasticsearch_data_stream_create ? 1 : 0
  elasticsearch_index_lifecycle_policy_name = "${local.elasticsearch_index_template_name}-policy" # name is predefined by fluentd's elasticsearch datastreams plugin
  elasticsearch_index_template_name         = var.elasticsearch_index_template.name != "" ? var.elasticsearch_index_template.name : "logs-${module.elaticsearch_label.id}"
  elasticsearch_index_lifecycle_policy = var.elasticsearch_data_stream_create ? templatefile("${path.module}/elasticsearch_index_lifecycle_policy_tpl.json", {
    hot_phase_max_primary_shard_size = var.elasticsearch_lifecycle_policy.hot_phase_max_primary_shard_size
    hot_phase_max_age                = var.elasticsearch_lifecycle_policy.hot_phase_max_age
    warm_phase_number_of_replicas    = var.elasticsearch_lifecycle_policy.warm_phase_number_of_replicas
    delete_phase_min_age             = var.elasticsearch_lifecycle_policy.delete_phase_min_age
  }) : null
  elasticsearch_index_template = var.elasticsearch_data_stream_create ? templatefile("${path.module}/elasticsearch_index_template_tpl.json", {
    index_template_name         = local.elasticsearch_index_template_name
    index_template_priority     = var.elasticsearch_index_template.priority
    index_lifecycle_policy_name = local.elasticsearch_index_lifecycle_policy_name
    node_name                   = var.elasticsearch_index_template.node_name
    number_of_shards            = var.elasticsearch_index_template.number_of_shards
    number_of_replicas          = var.elasticsearch_index_template.number_of_replicas
  }) : null
}

module "elasticsearch_composable_index_template" {
  source  = "Invicton-Labs/deepmerge/null"
  version = "0.1.5"
  count   = local.elasticsearch_create_objects
  maps = [
    jsondecode(local.elasticsearch_index_template),
    { template : { mappings : { properties : var.elasticsearch_index_template.additional_fields } } }
  ]
}

resource "elasticsearch_xpack_index_lifecycle_policy" "policy" {
  count = local.elasticsearch_create_objects
  name  = local.elasticsearch_index_lifecycle_policy_name
  body  = local.elasticsearch_index_lifecycle_policy
}

resource "elasticsearch_composable_index_template" "template" {
  count = local.elasticsearch_create_objects
  name  = local.elasticsearch_index_template_name
  body  = jsonencode(module.elasticsearch_composable_index_template[0].merged)
}
