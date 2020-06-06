data "http" "winter_is_coming" {
  url = "https://anapioficeandfire.com/api/characters/583"
  # Optional request headers
  request_headers = {
    Accept = "application/json"
  }
}

resource "null_resource" "echo_the_bastard" {
  triggers = {
    trigger = uuid()
  }
  provisioner "local-exec" {
    command = "echo ${jsondecode(data.http.winter_is_coming.body)["name"]}"
  }

}

output "name" {
  value = jsondecode(data.http.winter_is_coming.body)["name"]
}