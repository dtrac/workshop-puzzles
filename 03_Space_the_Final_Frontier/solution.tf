variable "api_key" {
  description = "API Key for NASA - from https://api.nasa.gov/"
  type        = string
}

data "external" "mars_weather" {
  program = ["bash", "${path.module}/mars_weather.sh"]

  query = {
    # arbitrary map from strings to strings, passed
    # to the external program as the data query.
    api_key = var.api_key
  }
}

resource "null_resource" "echo_weather" {
  provisioner "local-exec" {

    command = <<EOT
              echo \"min temp: ${data.external.mars_weather.result.min_temp_f}\"
              echo \"max temp: ${data.external.mars_weather.result.max_temp_f}\" 
              EOT

  }
}