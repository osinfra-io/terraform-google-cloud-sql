module "test" {
  source = "../../../regional"

  client_certs = var.client_certs

  postgres_database_flags = [
    {
      name  = "autovacuum"
      value = "on"
    },
    {
      name  = "deadlock_timeout"
      value = 2000
    }
  ]

  deletion_protection = false
  host_project_id     = var.host_project_id
  instance_name       = var.instance_name

  labels = {
    cost-center = "x000"
    env         = "sb"
    repository  = "terraform-google-cloud-sql"
    team        = "testing"
  }

  network                        = "terraform-test-vpc"
  point_in_time_recovery_enabled = true
  project                        = var.project
  region                         = "us-east1"
}
