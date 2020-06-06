resource "local_file" "login_banner" {

  content  = templatefile("./banner.tpl", { warning = "DO NOT LOGIN!!!" })
  filename = "/etc/motd"

}