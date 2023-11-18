variable "client_certs" {
  type = set(string)
  default = [
    "client-cert1",
    "client-cert2"
  ]
}

variable "host_project_id" {
  type    = string
  default = "testing-kitchen-tfd2-sb"
}

variable "project_id" {
  type    = string
  default = "testing-kitchen-tfbd-sb"
}

variable "instance_name" {
  type    = string
  default = "test"
}
