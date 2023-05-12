locals {
  gosoline_metadata = var.gosoline_metadata != null ? var.gosoline_metadata : {
    domain    = "${var.organizational_unit}.${module.this.namespace}"
    use_https = false
    port      = 8070
  }
}
