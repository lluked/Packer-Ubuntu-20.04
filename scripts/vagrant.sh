#!/bin/sh -eux

# https://github.com/chef/bento/blob/5f8d3dc18177b6ec372a2580770c5afc75e250db/packer_templates/ubuntu/scripts/vagrant.sh
# chef/bento
# Apache License 2.0

# set a default HOME_DIR environment variable if not set
HOME_DIR="${HOME_DIR:-/home/vagrant}";

pubkey_url="https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant.pub";
mkdir -p $HOME_DIR/.ssh;
if command -v wget >/dev/null 2>&1; then
    wget --no-check-certificate "$pubkey_url" -O $HOME_DIR/.ssh/authorized_keys;
elif command -v curl >/dev/null 2>&1; then
    curl --insecure --location "$pubkey_url" > $HOME_DIR/.ssh/authorized_keys;
elif command -v fetch >/dev/null 2>&1; then
    fetch -am -o $HOME_DIR/.ssh/authorized_keys "$pubkey_url";
else
    echo "Cannot download vagrant public key";
    exit 1;
fi
chown -R vagrant $HOME_DIR/.ssh;
chmod -R go-rwsx $HOME_DIR/.ssh;
