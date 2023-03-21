resource "elasticstack_elasticsearch_index_lifecycle" "default" {
  count = module.elaticsearch_label.enabled ? 1 : 0
  name  = "${local.elasticsearch_index_template_name}-policy" # name is predefined by fluentd's elasticsearch datastreams plugin

  hot {
    min_age = "0ms"
    set_priority {
      priority = 200
    }
    rollover {
      max_primary_shard_size = var.elasticsearch_lifecycle_policy.hot_phase_max_primary_shard_size
      max_age                = var.elasticsearch_lifecycle_policy.hot_phase_max_age
    }
  }

  warm {
    min_age = var.elasticsearch_lifecycle_policy.hot_phase_max_age
    set_priority {
      priority = 0
    }
    allocate {
      number_of_replicas = var.elasticsearch_lifecycle_policy.warm_phase_number_of_replicas
    }
  }

  delete {
    min_age = var.elasticsearch_lifecycle_policy.delete_phase_min_age
    delete {
      delete_searchable_snapshot = true
    }
  }
}
