# Boot

variable "boot_command" {
  description = "The boot_command is an array of strings. The strings are all typed in sequence."
  type = list (string)
  default = []
}

variable "boot_wait" {
  description = "The time to wait after booting the initial virtual machine before typing the boot_command."
  type = string
  default = "10s"
}

# CD

variable "cd_files" {
  description = "A list of files to place onto a CD that is attached when the VM is booted."
  type = list (string)
  default = []
}

variable "cd_label" {
  description = "CD Label"
  type = string
  default = ""
}

# Headless

variable "headless" {
  description = "When this value is set to true, the machine will start without a console."
  type = bool
  default = false
}

# ISO

variable "iso_checksum" {
  description = "The checksum for the ISO file or virtual hard drive file."
  type = string
  default = ""
}

variable "iso_urls" {
  description = "Multiple URLs for the ISO to download."
  type = list(string)
  default = []
}

# SSH

variable "ssh_handshake_attempts" {
  description = "The number of handshakes to attempt with SSH once it can connect."
  type = number
  default = 10
}

variable "ssh_password" {
  description = "A plaintext password to use to authenticate with SSH."
  type = string
  sensitive = true
  default = "packer"
}

variable "ssh_timeout" {
  description = "The time to wait for SSH to become available."
  type = string
  default = "10m"
}

variable "ssh_username" {
  description = "The username to connect to SSH with. Required if using SSH."
  type = string
  sensitive = true
  default = "packer"
}

# Build Settings

variable "cpus" {
  description = "The number of cpus to use when building the VM."
  type = number
}

variable "disk_size" {
  description = "The size for the virtual disk in MB"
  type = number
}

variable "firmware" {
  description = " Set the Firmware for virtual machine. Supported values: bios, efi or efi-secure."
  type = string
  default = "bios"
}

variable "guest_os_type" {
  description = "The guest OS type being installed. This will be set in the VMware VMX."
  type = string
  default = "other"
}

variable "memory" {
  description = " The amount of memory to use when building the VM in megabytes."
  type = number
}

variable "tools_upload_flavor" {
  description = "The flavor of the VMware Tools ISO to upload into the VM."
  type = string
  default = ""
}

variable "vm_name" {
  description = "This is the name of the VMX file for the new virtual machine."
  type = string
}
