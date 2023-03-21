resource "kubernetes_deployment_v1" "django_api" {
  metadata {
    name = "django-api"
    labels = {
      nome = "django"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        nome = "django"
      }
    }

    template {
      metadata {
        labels = {
          nome = "django"
        }
      }

      spec {
        container {
          image = "Imagem ECR"
          name  = "django"

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }

          liveness_probe {
            http_get {
              path = "/clientes/"
              port = 8000
            }

            initial_delay_seconds = 3
            period_seconds        = 3
          }
        }
      }
    }
  }
}


# SVC de LoadBalancer Kubernetes
resource "kubernetes_service" "LoadBalancer" {
  metadata {
    name = "loadbalancer-django-api"
  }
  spec {
    selector = {
      nome = "django"
    }
    port {
      port        = 8000
      target_port = 8000
    }
    type = "LoadBalancer"
  }
}

data "kubernetes_service" "nome_dns" {
  metadata {
    name = "loadbalancer-django-api"
  }
}

output "url" {
  value = data.kubernetes_service.nome_dns.status
}
