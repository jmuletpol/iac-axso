variable "libvirt_disk_path" {
  description = "path for libvirt pool"
  default     = "/opt/kvm/pool1"
}

variable "ubuntu_20_10_img_url" {
  description = "ubuntu 20.10 image"
  #default     = "https://cloud-images.ubuntu.com/groovy/current/groovy-server-cloudimg-amd64.img"
  default     = "/Users/josep/groovy-server-cloudimg-amd64.img"
}

variable "vm_hostname" {
  description = "terraformed vm hostname"
  default     = "ubt-tf1"
}

variable "ssh_username" {
  description = "the ssh user to use"
  default     = "ubt-admin"
}

variable "ssh_private_key" {
  description = "the private key to use"
  default     = "~/.ssh/id_rsa"
}
