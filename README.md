
# Packer-Ubuntu-Live-Server-20.04
 
Example Packer configuration to build a basic ubuntu-20.04.4-live-server-amd64 box with virtualbox-iso and vmware-iso builders.

`user-data` file templated from a `pkrtpl` template to set the correct network interface depending on build platform.

`vagrant.sh` script from the [chef/bento](https://github.com/chef/bento) project to ensure the vagrant public key is installed to allow vagrant to connect to the outputted box. This carries the `Apache-2.0 License`. 

Credentials are defined in `templates/user-data` and `variables.pkr.hcl` as `vagrant:vagrant`.

Instructions:
-   Read Notes
-   Run `packer init .` to install required plugins.
-   Run `packer build -only=vmware-iso.ubuntu .` for vmware build.
-   Run `packer build -only=virtualbox-iso.ubuntu .` for virtualbox build.
-   Run `packer build .` to build both.

Notes:
-   Timing is important, different hosts load at different speeds, boot_wait needs changing to suit the build host. Seperate variables exist for Virtualbox and VMWare.
