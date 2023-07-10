# Carga la configuración desde el archivo YAML
locals {
  config = yamldecode(file("${path.module}/terraform.yml"))
}

# Define el proveedor de recursos de Google Cloud
provider "google" {
  credentials = file(local.config.credentials_path)  # Ruta al archivo de credenciales de servicio
  project     = local.config.project_id  # ID del proyecto
  region      = local.config.region  # Región
}

# Crea un bucket de almacenamiento en Google Cloud Storage
resource "google_storage_bucket" "bucket" {
  name     = local.config.bucket_name  # Nombre del bucket
  location = local.config.location  # Ubicación del bucket
  force_destroy = true  # Establecer en 'true' permitirá destruir el bucket incluso si contiene objetos

  # Configuración de la versión del objeto
  versioning {
    enabled = true  # Habilita el versionado del objeto
  }
}

# Crea un tópico de Pub/Sub
resource "google_pubsub_topic" "topic" {
  name = local.config.topic_name  # Nombre del tema
}

# Crea una suscripción al tema de Pub/Sub
resource "google_pubsub_subscription" "subscription" {
  name   = local.config.subscription_name  # Nombre de la suscripción
  topic  = google_pubsub_topic.topic.name  # Nombre del tema al que se suscribe
  ack_deadline_seconds = 10  # Tiempo máximo para reconocer los mensajes
}
