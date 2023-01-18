output "internal_ips" {
  value = flatten(yandex_compute_instance_group.this.instances[*].network_interface.0.ip_address)
}

output "external_ips" {
  value = flatten(yandex_compute_instance_group.this.instances[*].network_interface.0.nat_ip_address)
}

output "private_ssh_key" {
  value = var.public_ssh_key_path != "" ? "" : tls_private_key.rsa_key[0].private_key_openssh
  sensitive = true
}

output "loadbalancer_external_ip" {
  value = tolist(tolist(tolist(tolist(yandex_alb_load_balancer.this.listener).0.endpoint).0.address).0.external_ipv4_address).0.address
}
