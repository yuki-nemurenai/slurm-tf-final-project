output "internal_ips" {
  value = yandex_compute_instance_group.this.instances[*].network_interface.0.ip_address
}

output "external_ips" {
  value = yandex_compute_instance_group.this.instances[*].network_interface.0.nat_ip_address
}

output "private_ssh_key" {
  value = var.public_ssh_key_path != "" ? "" : tls_private_key.rsa_key[0].private_key_openssh
  sensitive = true
}
