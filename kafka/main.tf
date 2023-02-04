locals {
  bootstrap_host = "bootstrap.${var.host}.nip.io"
  broker_host    = "bootstrap.${var.host}.nip.io"
}

resource "kubernetes_namespace" "kafka" {
  metadata {
    name = var.namespace
  }
}

resource "helm_release" "kafka-strimzi" {
  name = "kafka-strimzi"

  repository = "https://strimzi.io/charts/"
  chart      = "strimzi-kafka-operator"
  version    = "0.33.0"
  namespace  = var.namespace

  timeout          = 600
  disable_webhooks = true
}

resource "helm_release" "kafka" {
  name      = "${var.name}-kafka-cluster"
  chart     = "${path.module}/strimzi/custom-chart"
  namespace = var.namespace

  values = [
    templatefile("${path.module}/strimzi/custom-chart/values.yaml",
      {
        bootstrap_host = local.bootstrap_host
        broker_host    = local.broker_host
        deply_kafka_connect = var.deply_kafka_connect
        kafka_connect_output_inmage = var.kafka_connect_output_inmage
    })
  ]

  depends_on = [
    helm_release.kafka-strimzi
  ]

}
