# Boot

variable "boot_command" {
  description = "The boot_command is an array of strings. The strings are all typed in sequence."
  type = list (string)
  default = [
    "<enter><wait2>",
    "<enter><wait2>",
    "<f6><esc><wait2>",
    "autoinstall<wait2>",
    "<spacebar>",
    "ds=nocloud;<wait2>",
    "<enter>"
  ]
}

variable "boot_wait_virtualbox" {
  description = "The time to wait after booting the initial virtual machine before typing the boot_command."
  type = string
  default = "5s"
}

variable "boot_wait_vmware" {
  description = "The time to wait after booting the initial virtual machine before typing the boot_command."
  type = string
  default = "5s"
}

# CD

variable "cd_files" {
  description = "A list of files to place onto a CD that is attached when the VM is booted."
  type = list (string)
  default = [
    "./cidata/meta-data",
    "./cidata/user-data"
  ]
}

variable "cd_label" {
  description = "CD Label"
  type = string
  default = "cidata"
}

# Headless

variable "headless" {
  description = "When this value is set to true, the machine will start without a console."
  type = bool
  default = true
}

# ISO

variable "iso_checksum" {
  description = "The checksum for the ISO file or virtual hard drive file."
  type = string
  default = "https://releases.ubuntu.com/20.04/SHA256SUMS"
}

variable "iso_checksum_type" {
  description = "The type of checksum for the ISO file or virtual hard drive file."
  type = string
  default = "file"
}

variable "iso_name" {
  description = "The name of the local ISO."
  type = string
  default = "ubuntu-20.04.4-live-server-amd64.iso"
}

variable "iso_path" {
  description = "The path to a local ISO."
  type = string
  default = "iso/"
}

variable "iso_url" {
  description = "A URL to the ISO containing the installation image or virtual hard drive (VHD or VHDX) file to clone."
  type = string
  default = "https://releases.ubuntu.com/20.04/ubuntu-20.04.4-live-server-amd64.iso"
}

# SSH

variable "ssh_handshake_attempts" {
  description = "The number of handshakes to attempt with SSH once it can connect."
  type = number
  default = 100
}

variable "ssh_password" {
  description = "A plaintext password to use to authenticate with SSH."
  type = string
  sensitive = true
  default = "vagrant"
}

variable "ssh_pty" {
  description = "If true, a PTY will be requested for the SSH connection."
  type    = string
  default = "false"
}

variable "ssh_timeout" {
  description = "The time to wait for SSH to become available."
  type = string
  default = "30m"
}

variable "ssh_username" {
  description = "The username to connect to SSH with. Required if using SSH."
  type = string
  sensitive = true
  default = "vagrant"
}

# Build Settings

variable "cpus" {
  description = "The number of cpus to use when building the VM."
  type    = number
  default = 1
}

variable "disk_size" {
  description = "The size for the virtual disk in MB"
  type = number
  default = 40000
}

variable "firmware" {
  description = " Set the Firmware for virtual machine. Supported values: bios, efi or efi-secure."
  type = string
  default = "bios"
}

variable "memory" {
  description = " The amount of memory to use when building the VM in megabytes."
  type = number
  default = 4096
}

variable "tools_upload_flavor" {
  description = "The flavor of the VMware Tools ISO to upload into the VM."
  type = string
  default = ""
}

variable "vm_name" {
  description = "This is the name of the VMX file for the new virtual machine."
  type = string
  default = "Ubuntu-20.04"
}
