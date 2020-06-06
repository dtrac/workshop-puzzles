resource "random_integer" "d6" {
  min = 1
  max = 6
}

resource "null_resource" "echo_dice" {

  provisioner "local-exec" {

    command = "echo ${random_integer.d6.result}"

  }

}