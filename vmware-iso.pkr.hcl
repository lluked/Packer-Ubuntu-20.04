# Plugins

packer {
  required_plugins {
    vmware = {
      version = ">= 1.0.3"
      source = "github.com/hashicorp/vmware"
    }
  }
}

# Source

source "vmware-iso" "ubuntu" {
  boot_command = var.boot_command
  boot_wait = var.boot_wait
  cd_files = var.cd_files
  cd_label = var.cd_label
  cpus = var.cpus
  disk_size = var.disk_size
  guest_os_type = var.guest_os_type
  headless = var.headless
  iso_checksum = var.iso_checksum
  iso_urls = var.iso_urls
  memory = var.memory
  output_directory = "output/${var.vm_name}_vmware"
  shutdown_command = "echo '${var.ssh_password}' | sudo -S -E shutdown -P now"
  ssh_password = var.ssh_password
  ssh_username = var.ssh_username
  ssh_timeout = var.ssh_timeout
  ssh_handshake_attempts = var.ssh_handshake_attempts
  tools_upload_flavor = var.tools_upload_flavor
  vm_name = var.vm_name
}

# Build

build {
  sources = ["source.vmware-iso.ubuntu"]
  provisioner "shell" {
    inline = ["ls -l"]
  }
  post-processor "checksum" {
  checksum_types = ["sha256"]
  output = "output/${var.vm_name}_vmware_{{.ChecksumType}}.checksum"
  }
  post-processor "vagrant" {
  keep_input_artifact = true
  output = "output/${var.vm_name}_vmware.box"
  }
}
