resource "helm_release" "kube-prometheus-stack" {
  name = var.name

  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"

  namespace = var.namespace

  values = [
    file("${path.module}/values.yaml"),
    var.values
  ]

  timeout          = 300
  disable_webhooks = true
}

