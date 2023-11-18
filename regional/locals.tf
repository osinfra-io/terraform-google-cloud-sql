# Terraform Local Values
# https://www.terraform.io/docs/language/values/locals.html

locals {
  network = "projects/${var.host_project_id}/global/networks/${var.network}"
}
