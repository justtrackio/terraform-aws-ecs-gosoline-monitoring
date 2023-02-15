provider "gosoline" {
  metadata = {
    domain    = var.metadata_domain
    use_https = false
    port      = 8070
  }
  name_patterns = {
    hostname                         = "{scheme}://{group}-{app}.{env}.{metadata_domain}:{port}"
    cloudwatch_namespace             = "{project}/{env}/{group}-{app}"
    ecs_cluster                      = "{env}"
    ecs_service                      = "{group}-{app}"
    grafana_elasticsearch_datasource = "elasticsearch-{env}-logs-{project}-{group}-{app}"
  }
}

provider "grafana" {
  url  = var.grafana_dashboard_url
  auth = var.grafana_dashboard_auth
}

provider "elasticsearch" {
  url = var.elasticsearch_host
}
