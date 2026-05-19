terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.67, != 6.14.0"
    }

    gosoline = {
      source  = "justtrackio/gosoline"
      version = ">= 1.0.0"
    }

    grafana = {
      source  = "grafana/grafana"
      version = ">= 1.40.1"
    }

    elasticstack = {
      source  = "elastic/elasticstack"
      version = "<= 0.14.2"
    }
  }

  required_version = ">= 1.3.0"
}
