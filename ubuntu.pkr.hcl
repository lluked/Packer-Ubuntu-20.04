## Required plugins

packer {
  required_plugins {
    virtualbox = {
      version = ">= 0.0.1"
      source = "github.com/hashicorp/virtualbox"
    }
    vmware = {
      version = ">= 1.0.3"
      source = "github.com/hashicorp/vmware"
    }
  }
}

## Source blocks

source "virtualbox-iso" "ubuntu" {
  boot_command         = "${var.boot_command}"
  boot_wait            = "${var.boot_wait_virtualbox}"
  cd_files             = "${var.cd_files}"
  cd_label             = "${var.cd_label}"
  cpus                 = "${var.cpus}"
  disk_size            = "${var.disk_size}"
  export_opts          = [
    "--manifest", 
    "--vsys", "0"
    ]
  format                 = "ova"
  gfx_controller         = "vmsvga"
  gfx_vram_size          = "32"
  guest_additions_path   = "VBoxGuestAdditions_{{ .Version }}.iso"
  guest_os_type          = "Ubuntu_64"
  hard_drive_interface   = "sata"
  headless               = "${var.headless}"
  iso_checksum           = "${var.iso_checksum_type}:${var.iso_checksum}"
  iso_urls               = ["${var.iso_path}/${var.iso_name}", "${var.iso_url}"]
  memory                 = "${var.memory}"
  output_directory       = "output/${var.vm_name}_virtualbox/"
  shutdown_command       = "echo ${var.ssh_password} | sudo -S shutdown -P now"
  ssh_handshake_attempts = "${var.ssh_handshake_attempts}"
  ssh_password           = "${var.ssh_password}"
  ssh_pty                = "${var.ssh_pty}"
  ssh_timeout            = "${var.ssh_timeout}"
  ssh_username           = "${var.ssh_username}"
  vboxmanage             = [
    ["modifyvm", "{{ .Name }}", "--natpf1", "ssh,tcp,,2222,0.0.0.0,22"], 
    ["modifyvm", "{{ .Name }}", "--vrde", "off"]
  ]
  vm_name                = "${var.vm_name}"
}

source "vmware-iso" "ubuntu" {
  boot_command           = "${var.boot_command}"
  boot_wait              = "${var.boot_wait_vmware}"
  cd_files               = "${var.cd_files}"
  cd_label               = "${var.cd_label}"
  disk_size              = "${var.disk_size}"
  guest_os_type          = "ubuntu-64"
  headless               = "${var.headless}"
  iso_checksum           = "${var.iso_checksum_type}:${var.iso_checksum}"
  iso_urls               = ["${var.iso_path}/${var.iso_name}", "${var.iso_url}"]
  memory                 = "${var.memory}"
  output_directory       = "output/${var.vm_name}_vmware/"
  shutdown_command       = "echo ${var.ssh_password} |sudo -S shutdown -P now"
  skip_compaction        = false
  ssh_handshake_attempts = "${var.ssh_handshake_attempts}"
  ssh_password           = "${var.ssh_password}"
  ssh_pty                = "${var.ssh_pty}"
  ssh_timeout            = "${var.ssh_timeout}"
  ssh_username           = "${var.ssh_username}"
  tools_upload_flavor    = "linux"
  vm_name                = "${var.vm_name}"
}

# Build

build {
  sources = ["source.virtualbox-iso.ubuntu", "source.vmware-iso.ubuntu"]

  provisioner "shell" {
    execute_command = "echo '${var.ssh_password}' | sudo -S env {{ .Vars }} {{ .Path }}"
    scripts         = [
      "scripts/networking.sh",
      "scripts/vagrant.sh"
    ]
  }

  post-processor "checksum" {
  checksum_types = ["sha256"]
  output = "output/${var.vm_name}_${trimsuffix(source.type, "-iso")}/${var.vm_name}_{{ .ChecksumType }}.checksum"
  }

  post-processor "vagrant" {
  keep_input_artifact = true
  output = "output/${var.vm_name}_${trimsuffix(source.type, "-iso")}.box"
  }

}
