resource "random_id" "random" {
  byte_length = "3"
}

module "test" {
  source = "../../../regional"

  client_certs = var.client_certs

  database_flags = [
    {
      name  = "cloudsql.enable_pgaudit"
      value = "on"
    },
    {
      name  = "log_checkpoints"
      value = "on"
    },
    {
      name  = "log_connections"
      value = "on"
    },
    {
      name  = "log_disconnections"
      value = "on"
    },
    {
      name  = "log_hostname"
      value = "on"
    },
    {
      name  = "log_lock_waits"
      value = "on"
    },
    {
      name  = "log_min_duration_statement"
      value = "-1"
    },
    {
      name  = "log_min_messages"
      value = "error"
    },
    {
      name  = "log_statement"
      value = "ddl"
    }
  ]

  database_version               = "POSTGRES_15"
  deletion_protection            = false
  host_project                   = var.host_project_id
  instance_name                  = "${var.instance_name}-${random_id.random.hex}"
  machine_tier                   = "db-f1-micro"
  network                        = "kitchen-vpc"
  point_in_time_recovery_enabled = true
  project_id                     = var.project_id
  region                         = "us-east1"
}
