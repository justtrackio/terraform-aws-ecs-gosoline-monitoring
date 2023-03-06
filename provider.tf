provider "gosoline" {
  metadata = {
    domain    = var.metadata_domain
    use_https = false
    port      = 8070
  }
  name_patterns = var.gosoline_name_patterns
}

provider "grafana" {
  url  = var.grafana_dashboard_url
  auth = var.grafana_dashboard_auth
}

provider "elasticsearch" {
  url = var.elasticsearch_host
}
