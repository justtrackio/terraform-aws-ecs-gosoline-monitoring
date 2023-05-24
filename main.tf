locals {
  gosoline_metadata = var.gosoline_metadata != null ? var.gosoline_metadata : {
    domain    = "${module.this.organizational_unit}.${module.this.namespace}"
    use_https = false
    port      = 8070
  }
}

module "ecs_label" {
  source  = "justtrackio/label/null"
  version = "0.26.0"

  label_order = var.label_orders.ecs

  context = module.this.context
}
