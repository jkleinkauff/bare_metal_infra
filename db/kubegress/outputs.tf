output "db_name" {
  description = "Database name"
  value       = var.db_name
}

output "db_user" {
  description = "Database user"
  value       = var.db_user
}

output "db_password" {
  description = "Database password"
  value       = var.db_password
}

output "db_host" {
  description = "Database host"
  value       = "${var.name}-pg-db.${var.namespace}"
}