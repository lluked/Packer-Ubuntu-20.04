#!/bin/sh -eux

# https://github.com/chef/bento/blob/5f8d3dc18177b6ec372a2580770c5afc75e250db/packer_templates/ubuntu/scripts/networking.sh
# chef/bento
# Apache License 2.0

ubuntu_version="`lsb_release -r | awk '{print $2}'`";
major_version="`echo $ubuntu_version | awk -F. '{print $1}'`";

if [ "$major_version" -ge "18" ]; then
echo "Create netplan config for eth0"
cat <<EOF >/etc/netplan/01-netcfg.yaml;
network:
  version: 2
  ethernets:
    eth0:
      dhcp4: true
      dhcp-identifier: mac

EOF
else
  # Adding a 2 sec delay to the interface up, to make the dhclient happy
  echo "pre-up sleep 2" >> /etc/network/interfaces;
fi

# Disable Predictable Network Interface names and use eth0
[ -e /etc/network/interfaces ] && sed -i 's/en[[:alnum:]]*/eth0/g' /etc/network/interfaces;
sed -i 's/GRUB_CMDLINE_LINUX="\(.*\)"/GRUB_CMDLINE_LINUX="net.ifnames=0 biosdevname=0 \1"/g' /etc/default/grub;
update-grub;