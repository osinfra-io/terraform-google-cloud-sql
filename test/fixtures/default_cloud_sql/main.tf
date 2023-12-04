module "test" {
  source = "../../../regional"

  client_certs = var.client_certs
  cost_center  = "x000"

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

  deletion_protection = false
  host_project_id     = var.host_project_id
  instance_name       = var.instance_name

  labels = {
    env  = "sb"
    team = "testing"
  }

  network                        = "kitchen-vpc"
  point_in_time_recovery_enabled = true
  project_id                     = var.project_id
  region                         = "us-east1"
}
