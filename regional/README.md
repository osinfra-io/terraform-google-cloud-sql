# Terraform Documentation

A child module automatically inherits its parent's default (un-aliased) provider configurations. The provider versions below are informational only and do **not** need to align with the provider configurations from its parent.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 5.8.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_sql_database_instance.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance) | resource |
| [google_sql_ssl_cert.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_ssl_cert) | resource |
| [random_id.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_type"></a> [availability\_type](#input\_availability\_type) | The availability type of the Cloud SQL instance | `string` | `"REGIONAL"` | no |
| <a name="input_backup_start_time"></a> [backup\_start\_time](#input\_backup\_start\_time) | Time indicating when backup configuration starts | `string` | `"04:00"` | no |
| <a name="input_client_certs"></a> [client\_certs](#input\_client\_certs) | A set of client cert names, note: 10 max per instance | `set(string)` | `[]` | no |
| <a name="input_cost_center"></a> [cost\_center](#input\_cost\_center) | The cost center to label the project with | `string` | n/a | yes |
| <a name="input_database_flags"></a> [database\_flags](#input\_database\_flags) | The database flags for Cloud SQL. See [PostgreSQL Flags](https://cloud.google.com/sql/docs/postgres/flags) | <pre>list(object({<br>    name  = string<br>    value = string<br>  }))</pre> | `[]` | no |
| <a name="input_database_version"></a> [database\_version](#input\_database\_version) | The MySQL, PostgreSQL or SQL Server version to use. | `string` | `"POSTGRES_15"` | no |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | Whether or not to allow Terraform to destroy the instance | `bool` | `true` | no |
| <a name="input_host_project_id"></a> [host\_project\_id](#input\_host\_project\_id) | Host project ID for the shared VPC | `string` | `""` | no |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | The name of the instance | `string` | n/a | yes |
| <a name="input_labels"></a> [labels](#input\_labels) | A set of key/value label pairs to assign to the project | `map(string)` | `{}` | no |
| <a name="input_machine_tier"></a> [machine\_tier](#input\_machine\_tier) | The machine type to use. Postgres supports only shared-core machine types, and custom machine types such as db-custom-2-13312 | `string` | `"db-f1-micro"` | no |
| <a name="input_mw_day"></a> [mw\_day](#input\_mw\_day) | Maintenance window day | `number` | `4` | no |
| <a name="input_mw_hour"></a> [mw\_hour](#input\_mw\_hour) | Maintenance window hour | `number` | `17` | no |
| <a name="input_network"></a> [network](#input\_network) | The VPC network from which the Cloud SQL instance is accessible for private IP | `string` | n/a | yes |
| <a name="input_point_in_time_recovery_enabled"></a> [point\_in\_time\_recovery\_enabled](#input\_point\_in\_time\_recovery\_enabled) | True if Point-in-time recovery is enabled. Will restart database if enabled after instance creation. Valid only for PostgreSQL instances | `bool` | `false` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the project in which the resource belongs | `string` | n/a | yes |
| <a name="input_query_insights_enabled"></a> [query\_insights\_enabled](#input\_query\_insights\_enabled) | True if Query Insights feature is enabled | `bool` | `true` | no |
| <a name="input_query_plans_per_minute"></a> [query\_plans\_per\_minute](#input\_query\_plans\_per\_minute) | Number of query execution plans captured by Insights per minute for all queries combined. Between 0 and 20 | `number` | `5` | no |
| <a name="input_query_string_length"></a> [query\_string\_length](#input\_query\_string\_length) | Maximum query length stored in bytes. Between 256 and 4500 | `number` | `1024` | no |
| <a name="input_record_application_tags"></a> [record\_application\_tags](#input\_record\_application\_tags) | True if Query Insights will record application tags from query when enabled | `bool` | `true` | no |
| <a name="input_record_client_address"></a> [record\_client\_address](#input\_record\_client\_address) | True if Query Insights will record client address when enabled | `bool` | `true` | no |
| <a name="input_region"></a> [region](#input\_region) | The region the instance will sit in | `string` | n/a | yes |
| <a name="input_update_track"></a> [update\_track](#input\_update\_track) | Receive updates earlier | `string` | `"stable"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_client_cert"></a> [client\_cert](#output\_client\_cert) | The client certificate |
| <a name="output_instance_server_ca_cert"></a> [instance\_server\_ca\_cert](#output\_instance\_server\_ca\_cert) | The SQL instance server CA certificate |
| <a name="output_private_ip_address"></a> [private\_ip\_address](#output\_private\_ip\_address) | SQL instance private IP address |
| <a name="output_private_key"></a> [private\_key](#output\_private\_key) | The client private key |
| <a name="output_project_id"></a> [project\_id](#output\_project\_id) | The ID of the project in which the resource belongs |
| <a name="output_sql_instance"></a> [sql\_instance](#output\_sql\_instance) | SQL instance name |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
