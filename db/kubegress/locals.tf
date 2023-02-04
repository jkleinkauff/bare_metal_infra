locals {
  db_name                 = var.db_name
  db_user                 = var.db_user
  db_password             = var.db_password
  db_host                 = "${var.name}-pg-db.${var.namespace}"
  airbyte_connection_name = "${var.db_name}-airbyte-connection"
}