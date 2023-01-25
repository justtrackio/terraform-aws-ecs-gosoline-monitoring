<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_elasticsearch"></a> [elasticsearch](#requirement\_elasticsearch) | 2.0.1 |
| <a name="requirement_gosoline"></a> [gosoline](#requirement\_gosoline) | 0.0.11 |
| <a name="requirement_grafana"></a> [grafana](#requirement\_grafana) | 1.22.0 |
| <a name="requirement_template"></a> [template](#requirement\_template) | 2.2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_elasticsearch"></a> [elasticsearch](#provider\_elasticsearch) | 2.0.1 |
| <a name="provider_gosoline"></a> [gosoline](#provider\_gosoline) | 0.0.11 |
| <a name="provider_grafana"></a> [grafana](#provider\_grafana) | 1.22.0 |
| <a name="provider_template"></a> [template](#provider\_template) | 2.2.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_alarm_consumer"></a> [alarm\_consumer](#module\_alarm\_consumer) | ./terraform-aws-ecs-alarm-consumer | n/a |
| <a name="module_alarm_gateway"></a> [alarm\_gateway](#module\_alarm\_gateway) | ./terraform-aws-ecs-alarm-gateway | n/a |
| <a name="module_alarm_kinsumer"></a> [alarm\_kinsumer](#module\_alarm\_kinsumer) | ./terraform-aws-ecs-alarm-kinsumer | n/a |
| <a name="module_elasticsearch_composable_index_template"></a> [elasticsearch\_composable\_index\_template](#module\_elasticsearch\_composable\_index\_template) | Invicton-Labs/deepmerge/null | 0.1.5 |
| <a name="module_elaticsearch_label"></a> [elaticsearch\_label](#module\_elaticsearch\_label) | cloudposse/label/null | 0.25.0 |
| <a name="module_this"></a> [this](#module\_this) | cloudposse/label/null | 0.25.0 |

## Resources

| Name | Type |
|------|------|
| [elasticsearch_composable_index_template.template](https://registry.terraform.io/providers/phillbaker/elasticsearch/2.0.1/docs/resources/composable_index_template) | resource |
| [elasticsearch_kibana_object.index_pattern](https://registry.terraform.io/providers/phillbaker/elasticsearch/2.0.1/docs/resources/kibana_object) | resource |
| [elasticsearch_xpack_index_lifecycle_policy.policy](https://registry.terraform.io/providers/phillbaker/elasticsearch/2.0.1/docs/resources/xpack_index_lifecycle_policy) | resource |
| [grafana_dashboard.main](https://registry.terraform.io/providers/grafana/grafana/1.22.0/docs/resources/dashboard) | resource |
| [grafana_data_source.elasticsearch](https://registry.terraform.io/providers/grafana/grafana/1.22.0/docs/resources/data_source) | resource |
| [gosoline_application_dashboard_definition.main](https://registry.terraform.io/providers/justtrackio/gosoline/0.0.11/docs/data-sources/application_dashboard_definition) | data source |
| [gosoline_application_metadata_definition.main](https://registry.terraform.io/providers/justtrackio/gosoline/0.0.11/docs/data-sources/application_metadata_definition) | data source |
| [template_file.elasticsearch_index_lifecycle_policy](https://registry.terraform.io/providers/hashicorp/template/2.2.0/docs/data-sources/file) | data source |
| [template_file.elasticsearch_index_template](https://registry.terraform.io/providers/hashicorp/template/2.2.0/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_tag_map"></a> [additional\_tag\_map](#input\_additional\_tag\_map) | Additional key-value pairs to add to each map in `tags_as_list_of_maps`. Not added to `tags` or `id`.<br>This is for some rare cases where resources want additional configuration of tags<br>and therefore take a list of maps with tag key, value, and additional configuration. | `map(string)` | `{}` | no |
| <a name="input_alarm_consumer"></a> [alarm\_consumer](#input\_alarm\_consumer) | This can be used to override alarms for consumers. Keys are names of the consumers. | <pre>object({<br>    alarm_description      = optional(string)<br>    datapoints_to_alarm    = optional(number, 1)<br>    evaluation_periods     = optional(number, 1)<br>    period                 = optional(number, 60)<br>    success_rate_threshold = optional(number, 99)<br>  })</pre> | `{}` | no |
| <a name="input_alarm_create"></a> [alarm\_create](#input\_alarm\_create) | Defines if alarms should be created | `bool` | `true` | no |
| <a name="input_alarm_gateway"></a> [alarm\_gateway](#input\_alarm\_gateway) | This can be used to override alarms for gateway routes. Keys are names of the gateway route. | <pre>object({<br>    alarm_description      = optional(string)<br>    datapoints_to_alarm    = optional(number, 3)<br>    evaluation_periods     = optional(number, 3)<br>    period                 = optional(number, 60)<br>    success_rate_threshold = optional(number, 99)<br>  })</pre> | `{}` | no |
| <a name="input_alarm_kinsumer"></a> [alarm\_kinsumer](#input\_alarm\_kinsumer) | This can be used to override alarms for kinsumers. Keys are names of the kinsumers. | <pre>object({<br>    alarm_description        = optional(string)<br>    datapoints_to_alarm      = optional(number, 1)<br>    evaluation_periods       = optional(number, 1)<br>    period                   = optional(number, 60)<br>    threshold_seconds_behind = optional(number, 60)<br>  })</pre> | `{}` | no |
| <a name="input_alarm_topic_arn"></a> [alarm\_topic\_arn](#input\_alarm\_topic\_arn) | The ARN of the SNS topic to receive the alerts | `string` | `null` | no |
| <a name="input_attributes"></a> [attributes](#input\_attributes) | ID element. Additional attributes (e.g. `workers` or `cluster`) to add to `id`,<br>in the order they appear in the list. New attributes are appended to the<br>end of the list. The elements of the list are joined by the `delimiter`<br>and treated as a single ID element. | `list(string)` | `[]` | no |
| <a name="input_context"></a> [context](#input\_context) | Single object for setting entire context at once.<br>See description of individual variables for details.<br>Leave string and numeric variables as `null` to use default value.<br>Individual variable settings (non-null) override settings in context object,<br>except for attributes, tags, and additional\_tag\_map, which are merged. | `any` | <pre>{<br>  "additional_tag_map": {},<br>  "attributes": [],<br>  "delimiter": null,<br>  "descriptor_formats": {},<br>  "enabled": true,<br>  "environment": null,<br>  "id_length_limit": null,<br>  "label_key_case": null,<br>  "label_order": [],<br>  "label_value_case": null,<br>  "labels_as_tags": [<br>    "unset"<br>  ],<br>  "name": null,<br>  "namespace": null,<br>  "regex_replace_chars": null,<br>  "stage": null,<br>  "tags": {},<br>  "tenant": null<br>}</pre> | no |
| <a name="input_delimiter"></a> [delimiter](#input\_delimiter) | Delimiter to be used between ID elements.<br>Defaults to `-` (hyphen). Set to `""` to use no delimiter at all. | `string` | `null` | no |
| <a name="input_descriptor_formats"></a> [descriptor\_formats](#input\_descriptor\_formats) | Describe additional descriptors to be output in the `descriptors` output map.<br>Map of maps. Keys are names of descriptors. Values are maps of the form<br>`{<br>   format = string<br>   labels = list(string)<br>}`<br>(Type is `any` so the map values can later be enhanced to provide additional options.)<br>`format` is a Terraform format string to be passed to the `format()` function.<br>`labels` is a list of labels, in order, to pass to `format()` function.<br>Label values will be normalized before being passed to `format()` so they will be<br>identical to how they appear in `id`.<br>Default is `{}` (`descriptors` output will be empty). | `any` | `{}` | no |
| <a name="input_elasticsearch_data_stream_create"></a> [elasticsearch\_data\_stream\_create](#input\_elasticsearch\_data\_stream\_create) | Defines whether there will be a elasticsearch data\_stream, index template, index lifecycle policy created | `bool` | `true` | no |
| <a name="input_elasticsearch_host"></a> [elasticsearch\_host](#input\_elasticsearch\_host) | Defines the elasticsearch host to query for logs | `string` | `null` | no |
| <a name="input_elasticsearch_index_template"></a> [elasticsearch\_index\_template](#input\_elasticsearch\_index\_template) | This defines the properties used within the index template (Only used if create\_elasticsearch\_data\_stream is true) | <pre>object({<br>    additional_fields  = map(any)<br>    name               = string<br>    priority           = number<br>    node_name          = string<br>    number_of_shards   = number<br>    number_of_replicas = number<br>  })</pre> | <pre>{<br>  "additional_fields": {},<br>  "name": "",<br>  "node_name": "*",<br>  "number_of_replicas": 1,<br>  "number_of_shards": 1,<br>  "priority": 250<br>}</pre> | no |
| <a name="input_elasticsearch_lifecycle_policy"></a> [elasticsearch\_lifecycle\_policy](#input\_elasticsearch\_lifecycle\_policy) | This defines the properties used within the index lifecycle management policy (Only used if create\_elasticsearch\_data\_stream is true) | <pre>object({<br>    delete_phase_min_age             = string<br>    hot_phase_max_primary_shard_size = string<br>    hot_phase_max_age                = string<br>    warm_phase_number_of_replicas    = number<br>  })</pre> | <pre>{<br>  "delete_phase_min_age": "28d",<br>  "hot_phase_max_age": "1d",<br>  "hot_phase_max_primary_shard_size": "50gb",<br>  "warm_phase_number_of_replicas": 0<br>}</pre> | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Set to false to prevent the module from creating any resources | `bool` | `null` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | ID element. Usually used for region e.g. 'uw2', 'us-west-2', OR role 'prod', 'staging', 'dev', 'UAT' | `string` | `null` | no |
| <a name="input_grafana_dashboard_auth"></a> [grafana\_dashboard\_auth](#input\_grafana\_dashboard\_auth) | Authorization token for grafana | `string` | `""` | no |
| <a name="input_grafana_dashboard_create"></a> [grafana\_dashboard\_create](#input\_grafana\_dashboard\_create) | Defines whether there will be a grafana dashboard (incl. datasource) | `bool` | `true` | no |
| <a name="input_grafana_dashboard_url"></a> [grafana\_dashboard\_url](#input\_grafana\_dashboard\_url) | Url of the grafana dashboard | `string` | `""` | no |
| <a name="input_grafana_elasticsearch_index_pattern"></a> [grafana\_elasticsearch\_index\_pattern](#input\_grafana\_elasticsearch\_index\_pattern) | Defines the index pattern that should be used within grafana to load dashboard data | `string` | `""` | no |
| <a name="input_grafana_folder_id"></a> [grafana\_folder\_id](#input\_grafana\_folder\_id) | Defines the grafana folder which should store the dashboards | `number` | `null` | no |
| <a name="input_id_length_limit"></a> [id\_length\_limit](#input\_id\_length\_limit) | Limit `id` to this many characters (minimum 6).<br>Set to `0` for unlimited length.<br>Set to `null` for keep the existing setting, which defaults to `0`.<br>Does not affect `id_full`. | `number` | `null` | no |
| <a name="input_label_key_case"></a> [label\_key\_case](#input\_label\_key\_case) | Controls the letter case of the `tags` keys (label names) for tags generated by this module.<br>Does not affect keys of tags passed in via the `tags` input.<br>Possible values: `lower`, `title`, `upper`.<br>Default value: `title`. | `string` | `null` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | The order in which the labels (ID elements) appear in the `id`.<br>Defaults to ["namespace", "environment", "stage", "name", "attributes"].<br>You can omit any of the 6 labels ("tenant" is the 6th), but at least one must be present. | `list(string)` | `null` | no |
| <a name="input_label_orders"></a> [label\_orders](#input\_label\_orders) | Overrides the `labels_order` for the different labels to modify ID elements appear in the `id` | <pre>object({<br>    cloudwatch    = optional(list(string)),<br>    elasticsearch = optional(list(string))<br>  })</pre> | `{}` | no |
| <a name="input_label_value_case"></a> [label\_value\_case](#input\_label\_value\_case) | Controls the letter case of ID elements (labels) as included in `id`,<br>set as tag values, and output by this module individually.<br>Does not affect values of tags passed in via the `tags` input.<br>Possible values: `lower`, `title`, `upper` and `none` (no transformation).<br>Set this to `title` and set `delimiter` to `""` to yield Pascal Case IDs.<br>Default value: `lower`. | `string` | `null` | no |
| <a name="input_labels_as_tags"></a> [labels\_as\_tags](#input\_labels\_as\_tags) | Set of labels (ID elements) to include as tags in the `tags` output.<br>Default is to include all labels.<br>Tags with empty values will not be included in the `tags` output.<br>Set to `[]` to suppress all generated tags.<br>**Notes:**<br>  The value of the `name` tag, if included, will be the `id`, not the `name`.<br>  Unlike other `null-label` inputs, the initial setting of `labels_as_tags` cannot be<br>  changed in later chained modules. Attempts to change it will be silently ignored. | `set(string)` | <pre>[<br>  "default"<br>]</pre> | no |
| <a name="input_metadata_domain"></a> [metadata\_domain](#input\_metadata\_domain) | Domain for the application metadata | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | ID element. Usually the component or solution name, e.g. 'app' or 'jenkins'.<br>This is the only ID element not also included as a `tag`.<br>The "name" tag is set to the full `id` string. There is no tag with the value of the `name` input. | `string` | `null` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | ID element. Usually an abbreviation of your organization name, e.g. 'eg' or 'cp', to help ensure generated IDs are globally unique | `string` | `null` | no |
| <a name="input_regex_replace_chars"></a> [regex\_replace\_chars](#input\_regex\_replace\_chars) | Terraform regular expression (regex) string.<br>Characters matching the regex will be removed from the ID elements.<br>If not set, `"/[^a-zA-Z0-9-]/"` is used to remove all characters other than hyphens, letters and digits. | `string` | `null` | no |
| <a name="input_stage"></a> [stage](#input\_stage) | ID element. Usually used to indicate role, e.g. 'prod', 'staging', 'source', 'build', 'test', 'deploy', 'release' | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags (e.g. `{'BusinessUnit': 'XYZ'}`).<br>Neither the tag keys nor the tag values will be modified by this module. | `map(string)` | `{}` | no |
| <a name="input_tenant"></a> [tenant](#input\_tenant) | ID element \_(Rarely used, not included by default)\_. A customer identifier, indicating who this instance of a resource is for | `string` | `null` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
