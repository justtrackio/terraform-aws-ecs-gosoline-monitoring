provider "gosoline" {
  metadata      = var.gosoline_metadata
  name_patterns = var.gosoline_name_patterns
}

provider "grafana" {
  url  = var.grafana_dashboard_url
  auth = var.grafana_dashboard_auth
}

provider "elasticsearch" {
  url = var.elasticsearch_host
}
