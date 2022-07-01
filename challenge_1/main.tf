resource "kubernetes_service" "webapp-service" {
  metadata {
    name = "webapp-service"
  }

  spec {
    port {
      port      = 8080
      node_port = 30080
    }
    type = "NodePort"
  }
}


resource "kubernetes_deployment" "frontend" {
  metadata {
    name = "frontend"
    labels = {
      name = "frontend"
    }
  }

  spec {
    replicas = 4

    selector {
      match_labels = {
        name = "webapp"
      }
    }

    template {
      metadata {
        labels = {
          name = "webapp"
        }
      }

      spec {
        container {
          image = "kodekloud/webapp-color:v1"
          name  = "simple-webapp"
          port {
            container_port = 8080
          }

        }
      }
    }
  }
}