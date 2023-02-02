data "kubernetes_service" "pg_current_svc" {
  metadata {
    name      = helm_release.pg_db.name
    namespace = var.namespace
  }
}

resource "kubernetes_service" "pg_external_svc" {
  metadata {
    name      = "${var.name}-pg-db-external-nodeport"
    namespace = var.namespace
  }
  spec {
    selector = {
      app             = helm_release.pg_db.name
      replicationRole = "primary"
    }
    session_affinity = "None"
    port {
      port = 5432
      #   node_port = 32282
    }

    type = "NodePort"
  }
}


resource "kubernetes_service" "pg_external_replica_svc" {
  metadata {
    name      = "${var.name}-pg-db-external-nodeport-replica"
    namespace = var.namespace
  }
  spec {
    selector = {
      app             = helm_release.pg_db.name
      replicationRole = "replica"
    }
    session_affinity = "None"
    port {
      port = 5432
      #   node_port = 32288
    }

    type = "NodePort"
  }
}