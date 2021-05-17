provider "libvirt" {
  uri = "qemu+ssh://jmuletpol@192.168.1.200/system?socket=/var/run/libvirt/libvirt-sock"
}

resource "libvirt_pool" "terraform" {
  name = "terraform"
  type = "dir"
  path = var.libvirt_disk_path
}
 
resource "libvirt_volume" "ubuntu2010tf1-qcow2" {
  name = "ubuntu2010tf1-qcow2"
  pool = libvirt_pool.terraform.name
  source = var.ubuntu_20_10_img_url
  format = "qcow2"
  #size = 15 * 1024 * 1024 * 1024
}

data "template_file" "user_data" {
  template = file("${path.module}/config/cloud_init.yml")
}

data "template_file" "network_config" {
  template = file("${path.module}/config/network_config.yml")
}

data "template_file" "meta_data" {
  template = file("${path.module}/config/meta_data.yml")
}

resource "libvirt_cloudinit_disk" "commoninit" {
  name           = "commoninit.iso"
  user_data      = data.template_file.user_data.rendered
  network_config = data.template_file.network_config.rendered
  meta_data      = data.template_file.meta_data.rendered 
  pool           = libvirt_pool.terraform.name
}

resource "libvirt_domain" "domain-ubuntu2010tf1" {
  name   = var.vm_hostname
  memory = "512"
  vcpu   = 1

  cloudinit = libvirt_cloudinit_disk.commoninit.id

  network_interface {
    network_name   = "host-bridge"
    bridge = "br0"
    wait_for_lease = false
    hostname = var.vm_hostname
  }

  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }

  console {
    type        = "pty"
    target_type = "virtio"
    target_port = "1"
  }

  disk {
    volume_id = libvirt_volume.ubuntu2010tf1-qcow2.id
  }

  graphics {
    type        = "spice"
    listen_type = "address"
    autoport    = true
  }
  
}
