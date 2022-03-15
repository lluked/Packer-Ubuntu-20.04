
# Packer-Ubuntu-Live-Server-20.04
 
Example Packer configuration to build a basic ubuntu-20.04.4-live-server-amd64 box with virtualbox-iso and vmware-iso builders.

`networking.sh` and `vagrant.sh` scripts are from the [chef/bento](https://github.com/chef/bento) project and carry the `Apache-2.0 License`.

-   `networking.sh` ensures the network interface is set to `eth0`, to ensure a consistent interface name between builds.
-   `vagrant.sh` ensures the vagrant public key is installed to allow vagrant to connect to the outputted box. This is replaced by vagrant with a secure key.

Credentials are defined in `cidata/user-data` and `variables.pkr.hcl` as `vagrant:vagrant`.

Instructions:
-   Read Notes
-   Run `packer init .` to install required plugins.
-   Run `Packer build -only=vmware-iso.ubuntu .` for vmware build.
-   Run `Packer build -only=virtualbox-iso.ubuntu .` for virtualbox build.
-   Run `Packer build .` to build both.

Notes:
-   Timing is important, different hosts load at different speeds, boot_wait needs changing to suit the build host. Seperate variables exist for Virtualbox and VMWare.
