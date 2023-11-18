output "client_cert" {
  value = {
    for cert in var.client_certs : cert => module.test.client_cert[cert]
  }
}

output "instance_server_ca_cert" {
  value = module.test.instance_server_ca_cert
}

output "private_key" {
  value = {
    for key in var.client_certs : key => module.test.private_key[key]
  }
  sensitive = true
}

output "private_ip_address" {
  value = module.test.private_ip_address
}

output "project_id" {
  value = module.test.project_id
}

output "sql_instance" {
  value = module.test.sql_instance
}
