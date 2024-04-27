variable "client_certs" {
  type = set(string)
  default = [
    "client-cert1",
    "client-cert2"
  ]
}

variable "host_project_id" {
  type    = string
  default = "test-default-tf75-sb"
}

variable "project" {
  type    = string
  default = "test-gke-fleet-member-tfc5-sb"
}

variable "instance_name" {
  type    = string
  default = "test"
}
