#
# store all needed creds by terraform and packer in the admin VM
#
resource "null_resource" "copy-creds-to-admin-vm" {
  provisioner "file" {
    source = "~/.secrets"
    destination = "/home/${module.vm.vm-admin-username}"
    connection {
      type      = "ssh"
      host      = "${module.vm.vm-public-ip}"
      user      = "${module.vm.vm-admin-username}"
      password  = "${module.vm.vm-admin-password}"
    }
  }
}