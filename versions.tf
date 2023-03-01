terraform {
  required_providers {
    elasticsearch = {
      source  = "phillbaker/elasticsearch"
      version = "2.0.7"
    }

    gosoline = {
      source  = "justtrackio/gosoline"
      version = "0.0.12"
    }

    grafana = {
      source  = "grafana/grafana"
      version = "1.35.0"
    }

    template = {
      source  = "hashicorp/template"
      version = "2.2.0"
    }
  }

  required_version = ">= 1.3.0"
}
