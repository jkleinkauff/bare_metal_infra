resource "helm_release" "pg_db" {
  name  = "${var.name}-pg-db"
  chart = "${path.module}/custom-chart"

  namespace = var.namespace

  values = [
    templatefile("${path.module}/custom-chart/values.yaml",
      {
        name            = "${var.name}"
        namespace       = "${var.namespace}",
        size            = "${var.size}",
        replicas        = "${var.replicas}",
        enable_backup   = "${var.enable_backup}",
        wal_level       = "${var.wal_level}",
        db_name         = "${var.db_name}",
        db_user         = "${var.db_user}",
        db_password     = "${var.db_password}",
        max_connections = "${var.max_connections}",
    })
  ]
  timeout          = 600
  disable_webhooks = true
}
