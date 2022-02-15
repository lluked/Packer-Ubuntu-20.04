# Boot

boot_command = [
    "yes",
    "<enter>"
  ]
boot_wait = "45s"

# CD

cd_files = [ "./cidata/*"]
cd_label = "cidata"

# ISO

iso_urls = ["iso/ubuntu-20.04.3-live-server-amd64.iso", "https://releases.ubuntu.com/20.04/ubuntu-20.04.3-live-server-amd64.iso"]
iso_checksum = "https://releases.ubuntu.com/20.04/SHA256SUMS"

# Headless

headless = false

# SSH

ssh_password = "vagrant"
ssh_timeout = "30m"
ssh_username = "vagrant"
ssh_handshake_attempts = 1000

# Build Settings

cpus = 2
disk_size = 20000
firmware = "bios"
guest_os_type = "ubuntu64Guest"
memory = 4096
tools_upload_flavor = "linux"
vm_name = "ubuntu-20.04.3-live-server-amd64"
