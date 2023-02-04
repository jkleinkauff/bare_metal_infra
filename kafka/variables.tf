variable "name" {
  description = "Resource name"
  default     = null
}

variable "namespace" {
  description = "Namespace"
}

variable "host" {
  description = "Host - Broker"
  default     = ""
}

variable "deply_kafka_connect" {
  description = "Deploy Kafka Connect with the main cluster"
  default     = false
}

variable "docker_sm_secret" {
  description = "Secrets Manager key containing the docker credentials"
  default     = ""
}

variable "kafka_connect_output_inmage" {
  description = "Docker image to push Kafka Connect"
  default     = ""
}