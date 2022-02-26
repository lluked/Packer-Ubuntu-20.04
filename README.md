
# Packer-Ubuntu-Live-Server-20.04
 
Example Packer configuration to build a ubuntu-20.04.4-live-server-amd64 box with VMware vmware-iso builder.
 
 Credentials are defined in <code>cidata/user-data</code> as vagrant:vagrant
 
 Run:
<code>packer build -var-file=ubuntu-20.04.4-live-server-amd64.pkvars.hcl .</code>
