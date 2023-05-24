variable "alarm_consumer" {
  type = object({
    alarm_description      = optional(string)
    datapoints_to_alarm    = optional(number, 1)
    evaluation_periods     = optional(number, 1)
    period                 = optional(number, 60)
    success_rate_threshold = optional(number, 99)
  })
  default     = {}
  description = "This can be used to override alarms for consumers. Keys are names of the consumers."
}

variable "alarm_enabled" {
  type        = bool
  default     = true
  description = "Defines if alarms should be created"
}

variable "alarm_gateway" {
  type = object({
    alarm_description      = optional(string)
    datapoints_to_alarm    = optional(number, 3)
    evaluation_periods     = optional(number, 3)
    period                 = optional(number, 60)
    success_rate_threshold = optional(number, 99)
  })
  default     = {}
  description = "This can be used to override alarms for gateway routes. Keys are names of the gateway route."
}

variable "alarm_kinsumer" {
  type = object({
    alarm_description        = optional(string)
    datapoints_to_alarm      = optional(number, 1)
    evaluation_periods       = optional(number, 1)
    period                   = optional(number, 60)
    threshold_seconds_behind = optional(number, 60)
  })
  default     = {}
  description = "This can be used to override alarms for kinsumers. Keys are names of the kinsumers."
}

variable "alarm_scheduled" {
  type = object({
    alarm_description   = optional(string)
    datapoints_to_alarm = optional(number, 1)
    evaluation_periods  = optional(number, 1)
    period              = optional(number, 60)
    threshold           = optional(number, 0)
  })
  default     = {}
  description = "This can be used to override scheduled alarm"
}

variable "containers" {
  type        = list(string)
  description = "The list of container names from your container_definition"
  default     = null
}

variable "domain" {
  type        = string
  description = "The domain for elasticsearch and grafana"
  default     = null
}

variable "elasticsearch_data_stream_enabled" {
  type        = bool
  default     = true
  description = "Defines whether there will be a elasticsearch data_stream, index template, index lifecycle policy created"
}

variable "elasticsearch_host" {
  type        = string
  default     = null
  description = "Defines the elasticsearch host to query for logs"
}

variable "elasticsearch_index_template" {
  type = object({
    additional_fields  = map(any)
    name               = string
    priority           = number
    node_name          = string
    number_of_shards   = number
    number_of_replicas = number
  })
  default = {
    additional_fields  = {}
    name               = ""
    priority           = 250
    node_name          = "*"
    number_of_shards   = 1
    number_of_replicas = 1
  }
  description = "This defines the properties used within the index template (Only used if create_elasticsearch_data_stream is true)"

  validation {
    condition     = var.elasticsearch_index_template.priority > 200
    error_message = "The priority property should be greater than 200 to override the elasticsearch internal index templates."
  }
}

variable "elasticsearch_lifecycle_policy" {
  type = object({
    delete_phase_min_age             = string
    hot_phase_max_primary_shard_size = string
    hot_phase_max_age                = optional(string)
    warm_phase_min_age               = string
    warm_phase_number_of_replicas    = number
  })
  default = {
    delete_phase_min_age             = "28d"
    hot_phase_max_primary_shard_size = "10gb"
    warm_phase_min_age               = "1d"
    warm_phase_number_of_replicas    = 0
  }
  description = "This defines the properties used within the index lifecycle management policy (Only used if create_elasticsearch_data_stream is true)"

  validation {
    condition     = can(regex("^\\d+(m|g)b", var.elasticsearch_lifecycle_policy.hot_phase_max_primary_shard_size))
    error_message = "The hot_phase_max_primary_shard_size property should be beginning with a number and ending with \"gb\" or \"mb\"."
  }
  validation {
    condition     = can(regex("^\\d+d", var.elasticsearch_lifecycle_policy.delete_phase_min_age))
    error_message = "The delete_phase_min_age property should be beginning with a number and ending with \"d\" for days."
  }
}

variable "gosoline_metadata" {
  type = object({
    domain    = optional(string),
    use_https = optional(string),
    port      = optional(string)
  })
  description = "Define custom metadata for the gosoline provider"
  default     = null
}

variable "gosoline_name_patterns" {
  type = object({
    hostname                         = optional(string),
    cloudwatch_namespace             = optional(string),
    ecs_cluster                      = optional(string),
    ecs_service                      = optional(string),
    grafana_elasticsearch_datasource = optional(string)
  })
  description = "Define custom name patters for the gosoline provider"
  default = {
    hostname                         = "{scheme}://{app}.{group}.{env}.{metadata_domain}:{port}"
    cloudwatch_namespace             = "{env}/{group}/{app}"
    ecs_cluster                      = "{env}"
    ecs_service                      = "{group}-{app}"
    grafana_elasticsearch_datasource = "elasticsearch-{env}-logs-{group}-{app}"
  }
}

variable "grafana_dashboard_enabled" {
  type        = bool
  default     = true
  description = "Defines whether there will be a grafana dashboard (incl. datasource)"
}

variable "grafana_dashboard_url" {
  type        = string
  description = "Url of the grafana dashboard"
  default     = null
}

variable "label_orders" {
  type = object({
    cloudwatch    = optional(list(string), ["environment", "stage", "name"]),
    ecs           = optional(list(string), ["stage", "name"]),
    elasticsearch = optional(list(string), ["environment", "stage", "name"])
  })
  default     = {}
  description = "Overrides the `labels_order` for the different labels to modify ID elements appear in the `id`"
}
