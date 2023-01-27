variable "name" {
  description = "Resource name"
  default     = null
}

variable "size" {
  description = "Used to compose the rds resources names"
  default     = "2Gi"
}

variable "namespace" {
  description = "Namespace"
}

variable "replicas" {
  description = "Replicas count"
  default     = 2
}

variable "enable_backup" {
  description = "Enable backup"
  default     = false
}

variable "wal_level" {
  description = "Wal Lever"
  default     = "logical"
}

variable "db_name" {
  description = "Db name"
}

variable "db_user" {
  description = "Db User"
}

variable "db_password" {
  description = "Db Password"
}

variable "max_connections" {
  description = "Max Connections"
  default     = 50
}
