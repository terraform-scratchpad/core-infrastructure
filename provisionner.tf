#
# prepare needed folders/files on the admin VM
#
resource "null_resource" "post-vm-init-folders" {
  provisioner "remote-exec" {
    inline = [
      "mkdir /home/${module.vm.vm-admin-username}/.secrets"
    ],
    connection {
      type      = "ssh"
      host      = "${module.vm.vm-public-ip}"
      user      = "${module.vm.vm-admin-username}"
      password  = "${module.vm.vm-admin-password}"
    }
  }
}

#
# store all needed creds by terraform and packer in the admin VM
#
resource "null_resource" "copy-creds-to-admin-vm" {
  provisioner "file" {
    source      = "${var.host_home}/.secrets/"
    destination = "/home/${module.vm.vm-admin-username}/.secrets"
    connection {
      host      = "${module.vm.vm-public-ip}"
      user      = "${module.vm.vm-admin-username}"
      password  = "${module.vm.vm-admin-password}"
    }
  }
}