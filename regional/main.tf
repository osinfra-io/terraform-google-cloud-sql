# Google SQL Database Instance
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance

resource "google_sql_database_instance" "this" {

  # Postgres Database Flags false positives
  # checkov:skip=CKV2_GCP_13
  # checkov:skip=CKV_GCP_51
  # checkov:skip=CKV_GCP_52
  # checkov:skip=CKV_GCP_53
  # checkov:skip=CKV_GCP_54
  # checkov:skip=CKV_GCP_108
  # checkov:skip=CKV_GCP_109
  # checkov:skip=CKV_GCP_110
  # checkov:skip=CKV_GCP_111

  # Manual test:
  # terraform plan --out tfplan.binary
  # terraform show -json tfplan.binary | jq > tfplan.json
  # checkov -f tfplan.json

  # Ensure all Cloud SQL database instance requires all incoming connections to use SSL
  # checkov:skip=CKV_GCP_6: The require_ssl argument is deprecated: https://github.com/bridgecrewio/checkov/issues/6102

  database_version    = var.database_version
  deletion_protection = var.deletion_protection
  name                = local.name
  project             = var.project
  region              = var.region

  settings {
    availability_type = var.availability_type
    edition           = "ENTERPRISE"
    tier              = var.machine_tier

    backup_configuration {
      enabled                        = true
      point_in_time_recovery_enabled = var.point_in_time_recovery_enabled
      start_time                     = var.backup_start_time
    }

    dynamic "database_flags" {
      for_each = startswith(var.database_version, "POSTGRES_") ? local.postgres_database_flags : []
      content {
        name  = database_flags.value.name
        value = database_flags.value.value
      }
    }

    insights_config {
      query_insights_enabled  = var.query_insights_enabled
      query_plans_per_minute  = var.query_plans_per_minute
      query_string_length     = var.query_string_length
      record_application_tags = var.record_application_tags
      record_client_address   = var.record_client_address
    }

    ip_configuration {
      ipv4_enabled    = false
      private_network = local.network
      ssl_mode        = "ENCRYPTED_ONLY"
    }

    maintenance_window {
      day          = var.mw_day
      hour         = var.mw_hour
      update_track = var.update_track
    }

    user_labels = var.labels
  }
}

# Google SQL SSL Certificate Resource
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_ssl_cert

resource "google_sql_ssl_cert" "this" {
  for_each = var.client_certs

  common_name = each.key
  instance    = google_sql_database_instance.this.name
  project     = var.project
}

# Random ID Resource
# https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id

resource "random_id" "this" {
  prefix      = "tf"
  byte_length = "1"
}
