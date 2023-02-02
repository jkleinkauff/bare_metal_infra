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

  depends_on = [
    helm_release.kafka-strimzi
  ]

}
