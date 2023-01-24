provider "gosoline" {
  metadata_domain = var.metadata_domain
}

provider "grafana" {
  url  = var.grafana_dashboard_url
  auth = var.grafana_dashboard_auth
}

provider "elasticsearch" {
  url = var.elasticsearch_host
}
