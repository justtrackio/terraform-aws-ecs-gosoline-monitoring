<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.67 |
| <a name="requirement_elasticsearch"></a> [elasticsearch](#requirement\_elasticsearch) | 2.0.7 |
| <a name="requirement_elasticstack"></a> [elasticstack](#requirement\_elasticstack) | 0.5.0 |
| <a name="requirement_gosoline"></a> [gosoline](#requirement\_gosoline) | 0.0.12 |
| <a name="requirement_grafana"></a> [grafana](#requirement\_grafana) | 1.40.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.67 |
| <a name="provider_elasticstack"></a> [elasticstack](#provider\_elasticstack) | 0.5.0 |
| <a name="provider_gosoline"></a> [gosoline](#provider\_gosoline) | 0.0.12 |
| <a name="provider_grafana"></a> [grafana](#provider\_grafana) | 1.40.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_alarm_consumer"></a> [alarm\_consumer](#module\_alarm\_consumer) | justtrackio/ecs-alarm-consumer/aws | 1.0.1 |
| <a name="module_alarm_gateway"></a> [alarm\_gateway](#module\_alarm\_gateway) | justtrackio/ecs-alarm-gateway/aws | 1.0.1 |
| <a name="module_alarm_kinsumer"></a> [alarm\_kinsumer](#module\_alarm\_kinsumer) | justtrackio/ecs-alarm-kinsumer/aws | 1.0.1 |
| <a name="module_alarm_scheduled"></a> [alarm\_scheduled](#module\_alarm\_scheduled) | justtrackio/ecs-alarm-scheduled/aws | 1.0.1 |
| <a name="module_ecs_label"></a> [ecs\_label](#module\_ecs\_label) | justtrackio/label/null | 0.26.0 |
| <a name="module_elaticsearch_label"></a> [elaticsearch\_label](#module\_elaticsearch\_label) | justtrackio/label/null | 0.26.0 |
| <a name="module_this"></a> [this](#module\_this) | justtrackio/label/null | 0.26.0 |

## Resources

| Name | Type |
|------|------|
| [elasticstack_elasticsearch_index_lifecycle.default](https://registry.terraform.io/providers/elastic/elasticstack/0.5.0/docs/resources/elasticsearch_index_lifecycle) | resource |
| [elasticstack_elasticsearch_index_template.default](https://registry.terraform.io/providers/elastic/elasticstack/0.5.0/docs/resources/elasticsearch_index_template) | resource |
| [grafana_dashboard.main](https://registry.terraform.io/providers/grafana/grafana/1.40.1/docs/resources/dashboard) | resource |
| [grafana_data_source.elasticsearch](https://registry.terraform.io/providers/grafana/grafana/1.40.1/docs/resources/data_source) | resource |
| [aws_sns_topic.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/sns_topic) | data source |
| [aws_ssm_parameter.grafana_token](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [gosoline_application_dashboard_definition.main](https://registry.terraform.io/providers/justtrackio/gosoline/0.0.12/docs/data-sources/application_dashboard_definition) | data source |
| [gosoline_application_metadata_definition.main](https://registry.terraform.io/providers/justtrackio/gosoline/0.0.12/docs/data-sources/application_metadata_definition) | data source |
| [grafana_folder.default](https://registry.terraform.io/providers/grafana/grafana/1.40.1/docs/data-sources/folder) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_tag_map"></a> [additional\_tag\_map](#input\_additional\_tag\_map) | Additional key-value pairs to add to each map in `tags_as_list_of_maps`. Not added to `tags` or `id`.<br>This is for some rare cases where resources want additional configuration of tags<br>and therefore take a list of maps with tag key, value, and additional configuration. | `map(string)` | `{}` | no |
| <a name="input_alarm_consumer"></a> [alarm\_consumer](#input\_alarm\_consumer) | This can be used to override alarms for consumers. Keys are names of the consumers. | <pre>object({<br>    alarm_description      = optional(string)<br>    datapoints_to_alarm    = optional(number, 1)<br>    evaluation_periods     = optional(number, 1)<br>    period                 = optional(number, 60)<br>    success_rate_threshold = optional(number, 99)<br>  })</pre> | `{}` | no |
| <a name="input_alarm_enabled"></a> [alarm\_enabled](#input\_alarm\_enabled) | Defines if alarms should be created | `bool` | `true` | no |
| <a name="input_alarm_gateway"></a> [alarm\_gateway](#input\_alarm\_gateway) | This can be used to override alarms for gateway routes. Keys are names of the gateway route. | <pre>object({<br>    alarm_description      = optional(string)<br>    datapoints_to_alarm    = optional(number, 3)<br>    evaluation_periods     = optional(number, 3)<br>    period                 = optional(number, 60)<br>    success_rate_threshold = optional(number, 99)<br>  })</pre> | `{}` | no |
| <a name="input_alarm_kinsumer"></a> [alarm\_kinsumer](#input\_alarm\_kinsumer) | This can be used to override alarms for kinsumers. Keys are names of the kinsumers. | <pre>object({<br>    alarm_description        = optional(string)<br>    datapoints_to_alarm      = optional(number, 1)<br>    evaluation_periods       = optional(number, 1)<br>    period                   = optional(number, 60)<br>    threshold_seconds_behind = optional(number, 60)<br>  })</pre> | `{}` | no |
| <a name="input_alarm_scheduled"></a> [alarm\_scheduled](#input\_alarm\_scheduled) | This can be used to override scheduled alarm | <pre>object({<br>    alarm_description   = optional(string)<br>    datapoints_to_alarm = optional(number, 1)<br>    evaluation_periods  = optional(number, 1)<br>    period              = optional(number, 60)<br>    threshold           = optional(number, 0)<br>  })</pre> | `{}` | no |
| <a name="input_attributes"></a> [attributes](#input\_attributes) | ID element. Additional attributes (e.g. `workers` or `cluster`) to add to `id`,<br>in the order they appear in the list. New attributes are appended to the<br>end of the list. The elements of the list are joined by the `delimiter`<br>and treated as a single ID element. | `list(string)` | `[]` | no |
| <a name="input_aws_account_id"></a> [aws\_account\_id](#input\_aws\_account\_id) | AWS account id | `string` | `null` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region | `string` | `null` | no |
| <a name="input_containers"></a> [containers](#input\_containers) | The list of container names from your container\_definition | `list(string)` | `null` | no |
| <a name="input_context"></a> [context](#input\_context) | Single object for setting entire context at once.<br>See description of individual variables for details.<br>Leave string and numeric variables as `null` to use default value.<br>Individual variable settings (non-null) override settings in context object,<br>except for attributes, tags, and additional\_tag\_map, which are merged. | `any` | <pre>{<br>  "additional_tag_map": {},<br>  "attributes": [],<br>  "delimiter": null,<br>  "descriptor_formats": {},<br>  "enabled": true,<br>  "environment": null,<br>  "id_length_limit": null,<br>  "label_key_case": null,<br>  "label_order": [],<br>  "label_value_case": null,<br>  "labels_as_tags": [<br>    "unset"<br>  ],<br>  "name": null,<br>  "namespace": null,<br>  "regex_replace_chars": null,<br>  "stage": null,<br>  "tags": {},<br>  "tenant": null<br>}</pre> | no |
| <a name="input_delimiter"></a> [delimiter](#input\_delimiter) | Delimiter to be used between ID elements.<br>Defaults to `-` (hyphen). Set to `""` to use no delimiter at all. | `string` | `null` | no |
| <a name="input_descriptor_formats"></a> [descriptor\_formats](#input\_descriptor\_formats) | Describe additional descriptors to be output in the `descriptors` output map.<br>Map of maps. Keys are names of descriptors. Values are maps of the form<br>`{<br>   format = string<br>   labels = list(string)<br>}`<br>(Type is `any` so the map values can later be enhanced to provide additional options.)<br>`format` is a Terraform format string to be passed to the `format()` function.<br>`labels` is a list of labels, in order, to pass to `format()` function.<br>Label values will be normalized before being passed to `format()` so they will be<br>identical to how they appear in `id`.<br>Default is `{}` (`descriptors` output will be empty). | `any` | `{}` | no |
| <a name="input_domain"></a> [domain](#input\_domain) | The domain for elasticsearch and grafana | `string` | `null` | no |
| <a name="input_elasticsearch_data_stream_enabled"></a> [elasticsearch\_data\_stream\_enabled](#input\_elasticsearch\_data\_stream\_enabled) | Defines whether there will be a elasticsearch data\_stream, index template, index lifecycle policy created | `bool` | `true` | no |
| <a name="input_elasticsearch_host"></a> [elasticsearch\_host](#input\_elasticsearch\_host) | Defines the elasticsearch host to query for logs | `string` | `null` | no |
| <a name="input_elasticsearch_index_template"></a> [elasticsearch\_index\_template](#input\_elasticsearch\_index\_template) | This defines the properties used within the index template (Only used if create\_elasticsearch\_data\_stream is true) | <pre>object({<br>    additional_fields  = map(any)<br>    name               = string<br>    priority           = number<br>    node_name          = string<br>    number_of_shards   = number<br>    number_of_replicas = number<br>  })</pre> | <pre>{<br>  "additional_fields": {},<br>  "name": "",<br>  "node_name": "*",<br>  "number_of_replicas": 1,<br>  "number_of_shards": 1,<br>  "priority": 250<br>}</pre> | no |
| <a name="input_elasticsearch_lifecycle_policy"></a> [elasticsearch\_lifecycle\_policy](#input\_elasticsearch\_lifecycle\_policy) | This defines the properties used within the index lifecycle management policy (Only used if create\_elasticsearch\_data\_stream is true) | <pre>object({<br>    delete_phase_min_age             = string<br>    hot_phase_max_primary_shard_size = string<br>    hot_phase_max_age                = optional(string)<br>    warm_phase_number_of_replicas    = number<br>  })</pre> | <pre>{<br>  "delete_phase_min_age": "28d",<br>  "hot_phase_max_primary_shard_size": "10gb",<br>  "warm_phase_number_of_replicas": 0<br>}</pre> | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Set to false to prevent the module from creating any resources | `bool` | `null` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | ID element. Usually used for region e.g. 'uw2', 'us-west-2', OR role 'prod', 'staging', 'dev', 'UAT' | `string` | `null` | no |
| <a name="input_gosoline_metadata"></a> [gosoline\_metadata](#input\_gosoline\_metadata) | Define custom metadata for the gosoline provider | <pre>object({<br>    domain    = optional(string),<br>    use_https = optional(string),<br>    port      = optional(string)<br>  })</pre> | `null` | no |
| <a name="input_gosoline_name_patterns"></a> [gosoline\_name\_patterns](#input\_gosoline\_name\_patterns) | Define custom name patters for the gosoline provider | <pre>object({<br>    hostname                         = optional(string),<br>    cloudwatch_namespace             = optional(string),<br>    ecs_cluster                      = optional(string),<br>    ecs_service                      = optional(string),<br>    grafana_elasticsearch_datasource = optional(string)<br>  })</pre> | <pre>{<br>  "cloudwatch_namespace": "{env}/{group}/{app}",<br>  "ecs_cluster": "{env}",<br>  "ecs_service": "{group}-{app}",<br>  "grafana_elasticsearch_datasource": "elasticsearch-{env}-logs-{group}-{app}",<br>  "hostname": "{scheme}://{app}.{group}.{env}.{metadata_domain}:{port}"<br>}</pre> | no |
| <a name="input_grafana_dashboard_enabled"></a> [grafana\_dashboard\_enabled](#input\_grafana\_dashboard\_enabled) | Defines whether there will be a grafana dashboard (incl. datasource) | `bool` | `true` | no |
| <a name="input_grafana_dashboard_url"></a> [grafana\_dashboard\_url](#input\_grafana\_dashboard\_url) | Url of the grafana dashboard | `string` | `null` | no |
| <a name="input_grafana_elasticsearch_index_pattern"></a> [grafana\_elasticsearch\_index\_pattern](#input\_grafana\_elasticsearch\_index\_pattern) | Defines the index pattern that should be used within grafana to load dashboard data | `string` | `""` | no |
| <a name="input_id_length_limit"></a> [id\_length\_limit](#input\_id\_length\_limit) | Limit `id` to this many characters (minimum 6).<br>Set to `0` for unlimited length.<br>Set to `null` for keep the existing setting, which defaults to `0`.<br>Does not affect `id_full`. | `number` | `null` | no |
| <a name="input_label_key_case"></a> [label\_key\_case](#input\_label\_key\_case) | Controls the letter case of the `tags` keys (label names) for tags generated by this module.<br>Does not affect keys of tags passed in via the `tags` input.<br>Possible values: `lower`, `title`, `upper`.<br>Default value: `title`. | `string` | `null` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | The order in which the labels (ID elements) appear in the `id`.<br>Defaults to ["namespace", "environment", "stage", "name", "attributes"].<br>You can omit any of the 6 labels ("tenant" is the 6th), but at least one must be present. | `list(string)` | `null` | no |
| <a name="input_label_orders"></a> [label\_orders](#input\_label\_orders) | Overrides the `labels_order` for the different labels to modify ID elements appear in the `id` | <pre>object({<br>    cloudwatch    = optional(list(string), ["environment", "stage", "name"]),<br>    ecs           = optional(list(string), ["stage", "name"]),<br>    elasticsearch = optional(list(string), ["environment", "stage", "name"])<br>  })</pre> | `{}` | no |
| <a name="input_label_value_case"></a> [label\_value\_case](#input\_label\_value\_case) | Controls the letter case of ID elements (labels) as included in `id`,<br>set as tag values, and output by this module individually.<br>Does not affect values of tags passed in via the `tags` input.<br>Possible values: `lower`, `title`, `upper` and `none` (no transformation).<br>Set this to `title` and set `delimiter` to `""` to yield Pascal Case IDs.<br>Default value: `lower`. | `string` | `null` | no |
| <a name="input_labels_as_tags"></a> [labels\_as\_tags](#input\_labels\_as\_tags) | Set of labels (ID elements) to include as tags in the `tags` output.<br>Default is to include all labels.<br>Tags with empty values will not be included in the `tags` output.<br>Set to `[]` to suppress all generated tags.<br>**Notes:**<br>  The value of the `name` tag, if included, will be the `id`, not the `name`.<br>  Unlike other `null-label` inputs, the initial setting of `labels_as_tags` cannot be<br>  changed in later chained modules. Attempts to change it will be silently ignored. | `set(string)` | <pre>[<br>  "default"<br>]</pre> | no |
| <a name="input_name"></a> [name](#input\_name) | ID element. Usually the component or solution name, e.g. 'app' or 'jenkins'.<br>This is the only ID element not also included as a `tag`.<br>The "name" tag is set to the full `id` string. There is no tag with the value of the `name` input. | `string` | `null` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | ID element. Usually an abbreviation of your organization name, e.g. 'eg' or 'cp', to help ensure generated IDs are globally unique | `string` | `null` | no |
| <a name="input_organizational_unit"></a> [organizational\_unit](#input\_organizational\_unit) | Usually used to indicate the AWS organizational unit, e.g. 'prod', 'sdlc' | `string` | `null` | no |
| <a name="input_regex_replace_chars"></a> [regex\_replace\_chars](#input\_regex\_replace\_chars) | Terraform regular expression (regex) string.<br>Characters matching the regex will be removed from the ID elements.<br>If not set, `"/[^a-zA-Z0-9-]/"` is used to remove all characters other than hyphens, letters and digits. | `string` | `null` | no |
| <a name="input_stage"></a> [stage](#input\_stage) | ID element. Usually used to indicate role, e.g. 'prod', 'staging', 'source', 'build', 'test', 'deploy', 'release' | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags (e.g. `{'BusinessUnit': 'XYZ'}`).<br>Neither the tag keys nor the tag values will be modified by this module. | `map(string)` | `{}` | no |
| <a name="input_tenant"></a> [tenant](#input\_tenant) | ID element \_(Rarely used, not included by default)\_. A customer identifier, indicating who this instance of a resource is for | `string` | `null` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
