output "ip" {
  value = libvirt_domain.domain-ubuntu2010tf1.network_interface[0].addresses[0]
}

output "url" {
  value = "http://${libvirt_domain.domain-ubuntu2010tf1.network_interface[0].addresses[0]}"
}
