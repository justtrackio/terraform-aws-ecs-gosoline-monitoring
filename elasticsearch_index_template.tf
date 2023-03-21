module "elaticsearch_label" {
  source  = "cloudposse/label/null"
  version = "0.25.0"

  label_order = var.label_orders.elasticsearch
  enabled     = var.elasticsearch_data_stream_create

  context = module.this.context
}

locals {
  elasticsearch_index_template_name = var.elasticsearch_index_template.name != "" ? var.elasticsearch_index_template.name : "logs-${module.elaticsearch_label.id}"
}

resource "elasticstack_elasticsearch_index_template" "default" {
  count = module.elaticsearch_label.enabled ? 1 : 0
  name  = local.elasticsearch_index_template_name

  priority       = var.elasticsearch_index_template.priority
  index_patterns = ["${local.elasticsearch_index_template_name}*"]
  data_stream {}

  template {
    settings = jsonencode({
      "lifecycle.name"                   = elasticstack_elasticsearch_index_lifecycle.default[0].name
      codec                              = "default"
      "query.default_field"              = ["message"]
      "routing.allocation.include._name" = var.elasticsearch_index_template.node_name
      number_of_shards                   = var.elasticsearch_index_template.number_of_shards
      number_of_replicas                 = var.elasticsearch_index_template.number_of_replicas
    })
    mappings = jsonencode({
      dynamic = true
      dynamic_date_formats = [
        "strict_date_optional_time",
        "yyyy/MM/dd HH:mm:ss Z||yyyy/MM/dd Z"
      ]
      date_detection    = true
      numeric_detection = false
      dynamic_templates = []
      properties = {
        "@timestamp" = { type = "date" }
        data_stream = {
          properties = {
            dataset   = { type = "constant_keyword" }
            namespace = { type = "constant_keyword" }
            type      = { type = "constant_keyword", value = "logs" }
          }
        }
        channel             = { type = "keyword" }
        container_id        = { type = "keyword" }
        container_name      = { type = "keyword" }
        ec2_instance_id     = { type = "keyword" }
        ecs_cluster         = { type = "keyword" }
        ecs_task_arn        = { type = "keyword" }
        ecs_task_definition = { type = "keyword" }
        fluentd_hostname    = { type = "keyword" }
        level               = { type = "long" }
        level_name          = { type = "keyword" }
        message             = { type = "match_only_text" }
        source              = { type = "keyword" }
        tag                 = { type = "keyword" }
      }
    })
  }
}
