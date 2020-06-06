resource "null_resource" "install_cmatrix" {

  triggers = {
    trigger = uuid()
  }

  provisioner "local-exec" {

    command = "sudo apt -y install cmatrix"

  }

}