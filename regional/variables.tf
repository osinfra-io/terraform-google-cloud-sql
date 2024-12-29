# Input Variables
# https://www.terraform.io/language/values/variables

variable "availability_type" {
  description = "The availability type of the Cloud SQL instance"
  type        = string
  default     = "REGIONAL"
}

variable "backup_start_time" {
  description = "Time indicating when backup configuration starts"
  type        = string
  default     = "04:00"
}

variable "client_certs" {
  description = "A set of client cert names, note: 10 max per instance"
  type        = set(string)
  default     = []
}

variable "database_version" {
  description = "The MySQL, PostgreSQL or SQL Server version to use."
  type        = string
  default     = "POSTGRES_16"
}

variable "deletion_protection" {
  description = "Whether or not to allow Terraform to destroy the instance"
  type        = bool
  default     = true
}

variable "host_project_id" {
  description = "Host project ID for the shared VPC"
  type        = string
  default     = ""
}

variable "instance_name" {
  description = "The name of the instance"
  type        = string
}

variable "labels" {
  description = "A map of key/value pairs to assign to the resources being created"
  type        = map(string)
  default     = {}
}

variable "machine_tier" {
  description = "The machine type to use. Postgres supports only shared-core machine types, and custom machine types such as db-custom-2-13312"
  type        = string
  default     = "db-f1-micro"
}

variable "mw_day" {
  description = "Maintenance window day"
  type        = number
  default     = 4
}

variable "mw_hour" {
  description = "Maintenance window hour"
  type        = number
  default     = 17
}

variable "network" {
  description = "The VPC network from which the Cloud SQL instance is accessible for private IP"
  type        = string
}

variable "point_in_time_recovery_enabled" {
  description = "True if Point-in-time recovery is enabled. Will restart database if enabled after instance creation. Valid only for PostgreSQL instances"
  type        = bool
  default     = false
}

variable "postgres_database_flags" {
  description = "The database flags for Cloud SQL. See [PostgreSQL Flags](https://cloud.google.com/sql/docs/postgres/flags)"
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "project" {
  description = "The ID of the project in which the resource belongs"
  type        = string
}

variable "query_insights_enabled" {
  description = "True if Query Insights feature is enabled"
  type        = bool
  default     = true
}

variable "query_plans_per_minute" {
  description = "Number of query execution plans captured by Insights per minute for all queries combined. Between 0 and 20"
  type        = number
  default     = 5
}

variable "query_string_length" {
  description = "Maximum query length stored in bytes. Between 256 and 4500"
  type        = number
  default     = 1024
}

variable "record_application_tags" {
  description = "True if Query Insights will record application tags from query when enabled"
  type        = bool
  default     = true
}

variable "record_client_address" {
  description = "True if Query Insights will record client address when enabled"
  type        = bool
  default     = true
}

variable "region" {
  description = "The region in which the resource belongs"
  type        = string
}

variable "update_track" {
  description = "Receive updates earlier"
  type        = string
  default     = "stable"
}
