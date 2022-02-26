# Boot

boot_command = [
  "<enter><wait2><enter><wait><f6><esc><wait>",
  "linux /casper/vmlinuz autoinstall ds=nocloud;",
  "<wait><enter>"
  ]
boot_wait = "5s"

# CD

cd_files = [ "./cidata/*"]
cd_label = "cidata"

# ISO

iso_urls = ["https://releases.ubuntu.com/20.04/ubuntu-20.04.4-live-server-amd64.iso"]
iso_checksum = "file:https://releases.ubuntu.com/20.04/SHA256SUMS"

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
vm_name = "ubuntu-live-server-20.04.4"
